'''
In this extractor module, an input of each function is an adjusted L program
'''

import labels

# Look for ground terms in parsed L rules
# ground_terms: list -> set
def ground_terms(T):
    if T == []:
        return set()
        
    if T[0] == 'progr':
        for t in T[1:]:
            if t[0] == 'rules':
                return ground_terms(t)
    elif T[0] == 'rules':
        return ground_terms(T[1])
    elif T[0] == 'stmts':
        gterms = set()
        for t in T[1:]:
            gterms |= ground_terms(t)
        return gterms
    elif T[0] == 'terms':
        return gterms_label_terms_found(T)
    elif T[0] in labels.terminals:
        return set()
    else:
        gterms = set()
        for t in T[1:]:
            gterms |= ground_terms(t)
        return gterms

# When a 'terms' label is found, search downward for ground terms
# gterms_label_terms_found: list -> set
def gterms_label_terms_found(T):
    if T[0] in labels.constants:
        return {T}
    elif T[0] == 'variable':
        return set()
    else:
        gterms = set()
        for t in T[1:]:
            gterms |= gterms_label_terms_found(t)
        return gterms

########## ########## ########## ########## ########## ########## ########## ##########

# From parsed L rules, collect predicate names and arities
# predicates: list -> set
def predicates(T):
    if T == []:
        return set()
        
    if T[0] in labels.terminals:
        return set()
    elif T[0] == 'patom':
        pname = T[1][1]
        if len(T) == 2:
            arity = 0
        else:
            arity = len(T[2]) - 1
        return {(pname, arity)}
    else:
        preds = set()
        for t in T[1:]:
            preds |= predicates(t)
        return preds
