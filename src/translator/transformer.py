import sets
import preparer

def program(P):
    progr = ['progr']

    Preds = Predicates(P)
    pdecls = ['stmts']
    for pred in Preds:
        pdecls = pdecls + [['pdecl', ('identifier', pred)]]
    pdecls = ['pdecls', pdecls]
    progr = progr + [pdecls]

    for p in P[1:]:
        if p[0] == 'rules':
            ruls = rules(p)
    progr = progr + [ruls]

    return progr

######################################################################

def Predicates(T):
    if T[0] in sets.lexemes:
        return set()
    else:
        if T[0] == 'patom':
            return {T[1][1]}
        else:
            Preds = set()
            for t in T[1:]:
                Preds = Preds | Predicates(t)
            return Preds

######################################################################

def rules(T):
    if T[0] in sets.lexemes:
        return T        
    if T[0] == 'neg_literal':
        return ['not_literal', rules(T[1])]
    if T[0] == 'rule':
        if len(T) == 2:
            return ['fact', ['head', rules(T[1][1])]]
        if len(T) == 3:
            return ['long_rule', ['head', rules(T[1][1])], ['body', rules(T[2][1])]]
    if T[0] in sets.same_labels:
        ruls = T[:1]
        for t in T[1:]:
            ruls = ruls + [rules(t)]
        return ruls
