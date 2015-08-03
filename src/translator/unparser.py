import labels
import linker

# Unparse complete ASP program
# Input: complete parsed ASP program: ['progr', ['sdefs',...], ['pdecls',...], ['rules',...]]
# Output: ASP program: 'sorts ... predicates ... rules ...'
# program: list -> str
def program(T):
    progr = ''
    for t in T[1:]:
        if t[0] == 'sdefs':
            sdefs = sort_defs(t)
            if sdefs != '':
                sdefs = 'sorts ' + sdefs
            progr += sdefs
        if t[0] == 'pdecls':
            preds = predicates(t)
            if preds != '':
                preds = 'predicates ' + preds
            progr += preds
        if t[0] == 'rules':
            ruls = rules(t)
            if ruls != '':
                ruls = 'rules ' + ruls
            progr += ruls
    return progr
                
########## ########## ########## ########## ########## ########## ########## ##########

# Unparse complete ASP sort definitions
# Input: complete parsed ASP sort definitions: ['sdefs', ['sdef', ('identifier', 'ground_terms'), ['terms',...]],...]
# Output: ASP sort definitions: 'sorts #ground_terms = {...}. ...'
# sort_defs: list -> str
def sort_defs(T):
    if T[0] in labels.lexemes:
        return T[1]
    elif T[0] in labels.cut_root_comma:
        terms = sort_defs(T[1])
        for t in T[2:]:
            terms += ', ' + sort_defs(t)
        return terms
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
# Input: parsed ASP predicate declarations: ['pdecls', ['pdecl', ('identifier', 'p')],...]
# Output: ASP predicate declarations: 'predicates p(). ...'
# predicates: list -> str
def predicates(T):
    if T[0] in labels.lexemes:
        return T[1]
    elif T[0] == 'sname':
        return '#' + predicates(T[1])
    elif T[0] in labels.cut_root_comma:
        snames = predicates(T[1])
        for t in T[2:]:
            snames += ', ' + predicates(t)
        return snames
    elif T[0] == 'pdecl':
        pdecl = predicates(T[1]) + '('
        if len(T) != 2:
            pdecl += predicates(T[2])
        pdecl += '). '
        return pdecl
    else:
        preds = ''
        for t in T[1:]:
            preds += predicates(t)
        return preds
        
########## ########## ########## ########## ########## ########## ########## ##########

# Unparse ASP rules
# Input: parsed ASP rules: ['rules', ['fact',...['patom', ('identifier', 'p')]],...]
# Output: ASP rules: 'rules p. ...'
# rules: list -> str
def rules(T):
    if T[0] in labels.lexemes:
        return T[1]
    elif T[0] in labels.cut_root_comma:
        ruls = rules(T[1])
        for t in T[2:]:
            ruls += ', ' + rules(t)
        return ruls
    elif T[0] == 'patom':
        ruls = rules(T[1])
        if len(T) != 2:
            ruls += '(' + rules(T[2]) + ')'
        return ruls
    elif T[0] == 'not_literal':
        return 'not ' + rules(T[1])
    elif T[0] == 'conj':
        return rules(T[1]) + ', ' + rules(T[2])
    elif T[0] == 'disj':
        return rules(T[1]) + ' | ' + rules(T[2])
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
