import labels

'''
Transform adjusted L program into incomplete parsed ASP program

Input: adjusted L program: 
['progr', ['rules', ['rule', ['sent',...]]],...]

Output: incomplete parsed ASP program: 
['progr', ['rules', ['rule', ['fact',...]]],...]

transform: list -> list
'''
def transform(T):
    progr = []

    for t in T[1:]:
        if t[0] == 'tdecls':
            tdecls = type_decls(t)
            if tdecls != []:
                progr += [tdecls]
        if t[0] == 'rules':
            ruls = rules(t)
            if ruls != []:
                progr += [ruls]

    if progr != []:
        progr = ['progr'] + progr

    return progr

########## ########## ########## ########## ########## ########## ########## ##########

def type_decls(T):
    if T[0] in labels.lexemes:
        return T
    elif T[0] in labels.set_operations:
        tdecls = T[:1]
        for t in T[1:]:
            tdecls += \
            [['sname', type_decls(t)]] if t[0] == 'identifier' else \
            [type_decls(t)]
        return tdecls
    elif T[0] == 'tdecl':
        return ['sdef', ['sname', type_decls(T[1])], type_decls(T[2])]
    elif T[0] == 'tdecls':
        tdecls = ['sdefs']
        for t in T[1:]:
            tdecls += [type_decls(t)]
        return tdecls
    else:
        tdecls = T[:1]
        for t in T[1:]:
            tdecls += [type_decls(t)]
        return tdecls

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
