import labels

'''
rewrite: rewrite a dictionary parsed L program into an incomplete dictionary parsed ASP program
(The "ASP program" is incomplete because it lacks of: (1) the sort definition of #rule_gterms; and (2) predicate declarations.)

Input: a dictionary parsed L program
{'tdecls': ['tdecls', ['tdecl',...],...], 'rules': ['rules', ['rule',...],...]}

Output: an incomplete dictionary parsed ASP program:
{'sdefs': ['sdefs', ['sdef',...],...], 'rules': ['rules', ['rule',...],...]}
    
rewrite: dict -> dict
'''
def rewrite(T):
    return {'sdefs': rewrite_tdecls(T['tdecls']), 'rules': rewrite_rules(T['rules'])}

########## ########## ########## ########## ########## ########## ########## ##########

'''
rewrite_tdecls: rewrite parsed L type declarations into incomplete parsed ASP sort definitions
(These "ASP sort definitions" are incomplete since they exclude the sort definition of #rule_gterms.)

Input: parsed L type declarations:
['tdecls', ['tdecl',...],...]

Output: incomplete parsed ASP sort definitions:
['sdefs', ['sdef',...],...]

rewrite_tdecls: list -> list
'''
def rewrite_tdecls(T):
    if T[0] in labels.lexemes:
        return T
    elif T[0] in labels.set_ops:
        tr = T[:1]
        for t in T[1:]:
            tr += \
                [['sname', rewrite_tdecls(t)]] \
                    if t[0] == 'identifier' else \
                [rewrite_tdecls(t)]
        return tr
    elif T[0] == 'tdecl':
        tr = ['sdef', ['sname', rewrite_tdecls(T[1])]]
        tr += \
            [['sname', rewrite_tdecls(T[2])]] \
                if T[2][0] == 'identifier' else \
            [rewrite_tdecls(T[2])]
        return tr
    elif T[0] == 'tdecls':
        tr = ['sdefs']
        for t in T[1:]:
            tr += [rewrite_tdecls(t)]
        return tr
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += [rewrite_tdecls(t)]
        return tr

'''
rewrite_rules: rewrite parsed L rules into parsed ASP rules

Input: parsed L rules:
['rules', ['rule', ['sent',...]],...]

Output: parsed ASP rules:
['rules', ['fact', ['head',...]],...]

rewrite_rules: list -> list
'''
def rewrite_rules(T):
    if T[0] in labels.lexemes:
        return T
    elif T[0] == 'neg_literal':
        return ['not_literal', rewrite_rules(T[1])]
    elif T[0] == 'rule':
        if len(T) == 2:
            return ['fact', ['head', rewrite_rules(T[1][1])]]
        else:
            return ['rule', \
                    ['head', rewrite_rules(T[1][1])], \
                    ['body', rewrite_rules(T[2][1])]]
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += [rewrite_rules(t)]
        return tr
