import labels

'''
Transform adjusted L program into incomplete parsed ASP program

Input: adjusted L program: 
['progr', ['rules', ['rule', ['sent',...]]],...]

Output: incomplete parsed ASP program: 
['progr', ['rules', ['rule', ['fact',...]]],...]

program: list -> list
'''
def program(T):
    progr = []

    for t in T[1:]:
        if t[0] == 'rules':
            ruls = rules(t)
            if ruls != []:
                progr += [rules(t)]

    if progr != []:
        progr = ['progr'] + progr

    return progr

########## ########## ########## ########## ########## ########## ########## ##########

'''
Transform adjusted L rules into parsed ASP rules

Input: adjusted L rules: 
['rules', ['rule', ['sent', ['unit',...]]],...]

Output: parsed ASP rules: 
['rules', ['rule', ['fact', ['head',...]]],...]

rules: list -> list
'''
def rules(T):
    if T[0] in labels.lexemes:
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
