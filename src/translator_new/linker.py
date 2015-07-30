'''
In the linker module, each function intakes an adjusted L program
'''

import extractor
import transformer

# Add the 'ground_terms__' sort definition and predicate declarations to an explicit/incomplete parsed ASP program
# program: list -> list
def program(P):
    if P == []:
        return []

    progr = ['progr']

    sdefs = ground_terms(P)
    if sdefs != []:
        sdefs = ['stmts', sdefs]
        sdefs = ['sdefs', sdefs]
        progr += [sdefs]

    pdecls = predicates(P)
    if pdecls != []:
        progr += [pdecls]

    for p in transformer.program(P)[1:]:
        if p[0] == 'rules':
            ruls = p
    progr += [ruls]

    return progr

    
########## ########## ########## ########## ########## ########## ########## ##########

# Take the set of ground terms and declare it as the ASP sort 'ground_terms__'
# ground_terms: set -> list
def ground_terms(P):
    gterm_set = extractor.ground_terms(P)
    
    if gterm_set == set():
        return []
        
    gterms = ['gterms']
    for gterm in gterm_set:
        gterm_type = gterm[0]
        gterm_name = gterm[1]
        if gterm_type == 'numeral':
            gterms += [['num', ['pos', gterm]]]
        elif gterm_type == 'identifier':
            gterms += [['const', gterm]]
    gterms = ['terms', gterms]
    gterms = ['sdef', ('identifier', 'ground_terms__'), gterms]
    return gterms

########## ########## ########## ########## ########## ########## ########## ##########

# From the set of predicates, produce parsed ASP predicate declarations
# predicates: set -> list
def predicates(P):
    pred_set = extractor.predicates(P)
    
    if pred_set == set():
        return []
        
    preds = ['stmts']
    for pred_pair in pred_set:
        pname = pred_pair[0]
        arity = pred_pair[1]
        pred = ['pdecl', ('identifier', pname)]
        if arity >= 1:
            snames = ['snames']
            for i in range(0, arity):
                snames += [['sname', ('identifier', 'ground_terms__')]]
            pred += [snames]
        preds += [pred]
    preds = ['pdecls', preds]
    return preds
