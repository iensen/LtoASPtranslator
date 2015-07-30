'''
In this transformer module, an input of each function is an adjusted L program (output of the adjuster module)
'''

import labels

# Transform explicit L statements into ASP statements
# program: list -> list
def program(P):
    ruls = rules(P)
    
    if ruls == []:
        return []
    
    progr = ['progr']
    ruls = ruls[1]
    progr += [ruls]
    return progr

########## ########## ########## ########## ########## ########## ########## ##########

# Transform L rules into ASP rules
# rules: list -> list
def rules(T):
    if T == []:
        return []
    
    if T[0] == 'progr':
        for t in T[1:]:
            if t[0] == 'rules':
                return ['progr', rules(t)]
    elif T[0] == 'rules':
        return ['rules', rules(T[1])]
    elif T[0] == 'stmts':
        ruls = ['stmts']
        for t in T[1:]:
            ruls += [rules(t)]
        return ruls
    ##########
    elif T[0] in labels.terminals:
        return T
    elif T[0] == 'neg_literal':
        return ['not_literal', rules(T[1])]
    elif T[0] == 'rule':
        if len(T) == 2:
            return ['fact', ['head', rules(T[1][1])]]
        else:
            return ['long_rule', ['head', rules(T[1][1])], ['body', rules(T[2][1])]]
    else:
        ruls = T[:1]
        for t in T[1:]:
            ruls += [rules(t)]
        return ruls
