import transformer
import extractor

# Link transformed and extracted information of an adjusted L program to produce a complete parsed ASP program
# Input: adjusted L program: ['progr',..., ['rules', ['rule',...['patom',...]],...]]
# Output: complete parsed ASP program: ['progr', ['sdefs',...], ['pdecls',...], ['rules',...]]
# program: list -> list
def program(T):
    progr = []
    for t in T[1:]:
        if t[0] == 'rules':
        
            sdefs = []
            gterms = ground_terms(t)
            if gterms != []:
                sdefs += [gterms]
            if sdefs != []:
                sdefs = ['sdefs'] + sdefs
                progr += [sdefs]
                
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

# Define the parsed ASP sort '#ground_terms' from adjusted L rules
# Input: adjusted L rules: ['rules', ['rule',...['patom',..., ['terms',...('identifier', 'a'),...]]],...]
# Output: parsed ASP sort definition '#ground_terms': ['sdef', ('identifier', 'ground_terms'), ['terms', ['gterms', ['const', ('identifier', 'a')],...]]]
# ground_terms: list -> list
def ground_terms(T):
    gterms = []
    List = extractor.ground_terms_list(T)
    if List != []:
        List = ['gterms'] + List
        List = ['terms', List]
        gterms += ['sdef', ('identifier', 'ground_terms'), List]
    return gterms
    
########## ########## ########## ########## ########## ########## ########## ##########

# Declare parsed ASP predicates from adjusted L rules
# Input: adjusted L rules: ['rules', ['rule',...['patom', ('identifier', 'p'), ['terms',...]]],...]
# Output: parsed ASP predicate declarations: ['pdecls', ['pdecl', ('identifier', 'p'), ['snames', ['sname', ('identifier', 'ground_terms')],...]],...]
# predicates: list -> list
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
                snames += [['sname', ('identifier', 'ground_terms')]]
            snames = ['snames'] + snames
            pred += [snames]
        preds += [pred]
    if preds != []:
        preds = ['pdecls'] + preds
    return preds
