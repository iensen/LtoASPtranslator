import sets
import preparer
import transformer

def program(P):
    progr = ''

    progr = progr + 'predicates ' + pred_decls(P)

    for p in P[1:]:
        if p[0] == 'rules':
            progr = progr + 'rules ' + rules(p)

    return progr

######################################################################

def pred_decls(P):
    Preds = transformer.Predicates(P)
    pdecls = ''
    for pred in Preds:
        pdecls = pdecls + pred + '(). '
    return pdecls

######################################################################

def rules(T):
    if T[0] in sets.lexemes:
        return T[1]
    if T[0] == 'not_literal':
        return 'not ' + rules(T[1])
    if T[0] == 'conj':
        return rules(T[1]) + ', ' + rules(T[2])
    if T[0] == 'disj':
        return rules(T[1]) + ' | ' + rules(T[2])
    if T[0] == 'constraint':
        return ':- ' + rules(T[1]) + '. '
    if T[0] == 'fact':
        return rules(T[1]) + '. '
    if T[0] == 'long_rule':
        return rules(T[1]) + ' :- ' + rules(T[2]) + '. '
    if T[0] in sets.nonprinting_labels:
        ruls = ''
        for t in T[1:]:
            ruls = ruls + rules(t)
        return ruls
