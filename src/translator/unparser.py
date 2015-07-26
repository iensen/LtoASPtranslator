import sets
import transformer

# program: list -> str
def program(P):
    progr = ''
    for p in P[1:]:
        if p[0] == 'sdefs':
            progr = progr + 'sorts ' + sort_defs(p)
        elif p[0] == 'rules':
            progr = progr + 'predicates ' + pred_decls(p) + 'rules ' + rules(p)

    return progr

######################################################################

# sort_defs: list -> str

def sort_defs(T):
    if T[0] in sets.terminals:
        return T[1]
    elif T[0] in sets.cut_root_comma:
        children = sort_defs(T[1])
        if len(T) >= 3:
            for child in T[2:]:
                children = children + ', ' + sort_defs(child)
        return children
    elif T[0] == 'sdef':
        sdef = '#' + sort_defs(T[1]) + ' = {' + sort_defs(T[2]) + '}. '
        return sdef
    else:
        sdefs = ''
        for t in T[1:]:
            sdefs = sdefs + sort_defs(t)
        return sdefs

######################################################################

# pred_decls: set -> str
def pred_decls(P):
    Preds = transformer.Predicates(P)
    pdecls = ''
    for pred in Preds:
        pdecls = pdecls + pred + '(). '
    return pdecls

######################################################################

# rules: list -> str
def rules(T):
    if T[0] in sets.terminals:
        return T[1]
    elif T[0] == 'not_literal':
        return 'not ' + rules(T[1])
    elif T[0] == 'conj':
        return rules(T[1]) + ', ' + rules(T[2])
    elif T[0] == 'disj':
        return rules(T[1]) + ' | ' + rules(T[2])
    elif T[0] == 'constraint':
        return ':- ' + rules(T[1][1]) + '. '
    elif T[0] == 'fact':
        return rules(T[1][1]) + '. '
    elif T[0] == 'long_rule':
        return rules(T[1][1]) + ' :- ' + rules(T[2][1]) + '. '
    else:
        ruls = ''
        for t in T[1:]:
            ruls = ruls + rules(t)
        return ruls
