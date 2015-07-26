import sets

#program: list -> list
def program(P):
    progr = ['progr']
             
    for p in P[1:]:
        if p[0] == 'tdecls':
            progr = progr + [sort_defs(p)]
        elif p[0] == 'rules':
            progr = progr + [pred_decls(p)] + [rules(p)]
            
    return progr

######################################################################

# sort_defs: list -> list
def sort_defs(T):
    if T[0] in sets.terminals:
        return T
    elif T[0] == 'tdecl':
        sdefs = ['sdef']
        for t in T[1:]:
            sdefs = sdefs + [sort_defs(t)]
        return sdefs
    elif T[0] == 'tdecls':
        sdefs = ['sdefs']
        for t in T[1:]:
            sdefs = sdefs + [sort_defs(t)]
        return sdefs
    else:
        sdefs = T[:1]
        for t in T[1:]:
            sdefs = sdefs + [sort_defs(t)]
        return sdefs

######################################################################

# pred_decls: list -> list
def pred_decls(T):
    pdecls = ['stmts']
    Preds = Predicates(T)
    for pred in Preds:
        pdecls = pdecls + [['pdecl', ('identifier', pred)]]
    pdecls = ['pdecls', pdecls]
    return pdecls

# Predicates: list -> set
def Predicates(T):
    if T[0] in sets.terminals:
        return set()
    elif T[0] == 'patom':
        return {T[1][1]}
    else:
        Preds = set()
        for t in T[1:]:
            Preds = Preds | Predicates(t)
        return Preds

######################################################################

# rules: list -> list
def rules(T):
    if T[0] in sets.terminals:
        return T        
    elif T[0] == 'neg_literal':
        return ['not_literal', rules(T[1])]
    elif T[0] == 'rule':
        if len(T) == 2:
            return ['fact', ['head', rules(T[1][1])]]
        elif len(T) == 3:
            return ['long_rule', ['head', rules(T[1][1])], ['body', rules(T[2][1])]]
    else:
        ruls = T[:1]
        for t in T[1:]:
            ruls = ruls + [rules(t)]
        return ruls
