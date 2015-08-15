import transformer
import extractor

'''
Link transformed and extracted information of an adjusted L program to produce a complete parsed ASP program

Input: adjusted L program: 
['progr',..., ['rules', ['rule',...['patom',...]],...]]

Output: complete parsed ASP program: 
['progr', ['sdefs',...], ['pdecls',...], ['rules',...]]

link: list -> list
'''
def link(T):
    progr = []
    sdefs = sort_defs(T)
    if sdefs != []:
        progr += [sdefs]
    for t in T[1:]:
        if t[0] == 'rules':
            preds = predicates(t)
            if preds != []:
                progr += [preds]
            ruls = transformer.rules(t)
            if ruls != []:
                progr += [ruls]
    if progr != []:
        progr = ['progr'] + progr
    return progr
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

def sort_defs(T):
    sdefs = []
    for t in T[1:]:
        if t[0] == 'tdecls':
            tdecls = transformer.type_decls(t)
            if tdecls != []:
                tdecls = tdecls[1:]
                sdefs += tdecls
            tunion = type_union(t)
            if tunion != []:
                sdefs += [tunion]
        if t[0] == 'rules':
            gterms = ground_terms(t)
            if gterms != []:
                sdefs += [gterms]
    usort = universal_sort(T)
    if usort != []:
        sdefs += [usort]
    if sdefs != []:
        sdefs = ['sdefs'] + sdefs
    return sdefs
    
########## ########## ########## ########## ########## ########## ########## ##########

def type_union(T):
    tunion = []
    tdecls = transformer.type_decls(T)
    for t in tdecls[1:]:
        tunion += t[1:2]
    while len(tunion) > 1:
        tunion = [['union', tunion[0], tunion[1]]] + tunion[2:]
    if tunion != []:
        tunion = ['sdef', ['sname', ('identifier', 'type_union')]] + tunion
    return tunion

########## ########## ########## ########## ########## ########## ########## ##########

'''
Define the parsed ASP sort '#ground_terms' from adjusted L rules

Input: adjusted L rules: 
['rules', ['rule',...['patom',..., ['terms',...('identifier', 'a'),...]]],...]

Output: parsed ASP sort definition '#ground_terms': 
['sdef', ('identifier', 'ground_terms'), ['terms', ['gterms', ['const', ('identifier', 'a')],...]]]

ground_terms: list -> list
'''
def ground_terms(T):
    gterms = []
    List = extractor.ground_terms_list(T)
    if List != []:
        List = ['gterms'] + List
        List = ['terms', List]
        gterms += ['sdef', ['sname', ('identifier', 'ground_terms')], List]
    return gterms
    
########## ########## ########## ########## ########## ########## ########## ##########

def universal_sort(T):
    usort = []
    for t in T[1:]:
        if t[0] == 'tdecls':
            tunion = type_union(t)
            if tunion != []:
                usort += tunion[1:2]
        if t[0] == 'rules':
            gterms = ground_terms(t)
            if gterms != []:
                usort += gterms[1:2]
    if usort != []:
        if len(usort) == 1:
            usort = usort[0]
        else:
            usort = ['union'] + usort
        usort = ['sdef', ['sname', ('identifier', 'universal_sort')], usort]
    return usort
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
Declare parsed ASP predicates from adjusted L rules

Input: adjusted L rules: 
['rules', ['rule',...['patom', ('identifier', 'p'), ['terms',...]]],...]

Output: parsed ASP predicate declarations: 
['pdecls', ['pdecl', ('identifier', 'p'), ['snames', ['sname', ('identifier', 'ground_terms')],...]],...]

predicates: list -> list
'''
def predicates(T):
    preds = []
    Set = extractor.predicates(T)
    for p in Set:
        pname = p[0]
        arity = p[1]
        pred = ['pdecl', ('identifier', pname)]
        if arity != 0:
            snames = []
            for i in range(0, arity):
                snames += [['sname', ('identifier', 'universal_sort')]]
            snames = ['snames'] + snames
            pred += [snames]
        preds += [pred]
    if preds != []:
        preds = ['pdecls'] + preds
    return preds
