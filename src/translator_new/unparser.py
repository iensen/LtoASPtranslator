'''
In the unparser module, every function takes a linked ASP program as an input
'''

import labels

# Unparse an ASP program
# program: list -> str
def program(P):
    if P == []:
        return ''

    progr = ''
    for p in P[1:]:
        if p[0] == 'sdefs':
            sdefs = sort_defs(p)
            if sdefs != '':
                progr += 'sorts ' + sdefs
        elif p[0] == 'pdecls':
            pdecls = pred_decls(P)
            if pdecls != '':
                progr += 'predicates ' + pdecls
        elif p[0] == 'rules':
            ruls = rules(P)
            if ruls != '':
                progr += 'rules ' + ruls
    return progr

########## ########## ########## ########## ########## ########## ########## ##########

# Unparse ASP sort definitions
# sort_defs: list -> str
def sort_defs(T):
    if T == []:
        return ''

    if T[0] == 'progr':
        for t in T[1:]:
            if t[0] == 'sdefs':
                return sort_defs(t)
    elif T[0] == 'sdefs':
        return sort_defs(T[1])
    elif T[0] == 'stmts':
        sdefs = ''
        for t in T[1:]:
            sdefs += sort_defs(t)
        return sdefs
    ##########
    elif T[0] in labels.terminals:
        return T[1]
    elif T[0] in labels.cut_root_comma:
        sdefs = sort_defs(T[1])
        if len(T) >= 3:
            for t in T[2:]:
                sdefs += ', ' + sort_defs(t)
        return sdefs
    elif T[0] == 'sdef':
        sdef = '#' + sort_defs(T[1]) + ' = {' + sort_defs(T[2]) + '}. '
        return sdef
    else:
        sdefs = ''
        for t in T[1:]:
            sdefs += sort_defs(t)
        return sdefs

########## ########## ########## ########## ########## ########## ########## ##########

# Unparse ASP predicate declarations
# pred_decls: list -> str
def pred_decls(T):
    if T == []:
        return ''

    if T[0] == 'progr':
        for t in T[1:]:
            if t[0] == 'pdecls':
                return pred_decls(t)
        return ''
    elif T[0] == 'pdecls':
        return pred_decls(T[1])
    elif T[0] == 'stmts':
        pdecls = ''
        for t in T[1:]:
            pdecls += pred_decls(t)
        return pdecls
    elif T[0] == 'pdecl':
        pdecl = pred_decls(T[1]) + '('
        if len(T) >= 3:
            pdecl += pred_decls(T[2])
        pdecl += '). '
        return pdecl
    elif T[0] == 'snames':
        snames = pred_decls(T[1])
        for t in T[2:]:
            snames += ', ' + pred_decls(t)
        return snames
    elif T[0] == 'sname':
        return '#' + pred_decls(T[1])
    elif T[0] == 'identifier':
        return T[1]        
    
'''
# This alternate 'pred_decls' function is more efficient but incompatible with the architecture

import extractor

def pred_decls(T):
    preds = extractor.predicates(T)

    if preds == set():
        return ''
    
    pdecls = ''
    for pred in preds:
        pname = pred[0]
        arity = pred[1]
        pdecl = pname + '('
        if arity >= 1:
            pdecl += '#ground_terms__'
            for i in range(1, arity):
                pdecl += ', #ground_terms__'
        pdecl += '). '
    return pdecls
'''

########## ########## ########## ########## ########## ########## ########## ##########

# Unparse ASP rules
# rules: list -> str
def rules(T):
    if T == []:
        return ''

    if T[0] == 'progr':
        for t in T[1:]:
            if t[0] == 'rules':
                return rules(t)
        return ''
    elif T[0] == 'rules':
        return rules(T[1])
    elif T[0] == 'stmts':
        ruls = ''
        for t in T[1:]:
            ruls += rules(t)
        return ruls
    ##########
    elif T[0] in labels.terminals:
        return T[1]
    elif T[0] in labels.cut_root_comma:
        ruls = rules(T[1])
        for t in T[2:]:
            ruls += ', ' + rules(t)
        return ruls
    elif T[0] == 'patom':
        ruls = rules(T[1])
        if len(T) == 3:
            ruls += '(' + rules(T[2]) + ')'
        return ruls
    elif T[0] == 'not_literal':
        return 'not ' + rules(T[1])
    elif T[0] == 'conj':
        return rules(T[1]) + ', ' + rules(T[2])
    elif T[0] == 'disj':
        return rules(T[1]) + ' | ' + rules(T[2])
    elif T[0] in {'head', 'body'}:
        return rules(T[1])
    elif T[0] == 'constraint':
        return ':- ' + rules(T[1]) + '. '
    elif T[0] == 'fact':
        return rules(T[1]) + '. '
    elif T[0] == 'long_rule':
        return rules(T[1]) + ' :- ' + rules(T[2]) + '. '
    else:
        ruls = ''
        for t in T[1:]:
            ruls += rules(t)
        return ruls
