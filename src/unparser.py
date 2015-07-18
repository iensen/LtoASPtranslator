'''
u_program: list -> str

The function 'u_program' unparses a list of ASP parse trees into an ASP program.
'''

def u_test():
    P = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'h')]]]]], ['rule', ['sent', ['disj', ['unit', ['literal', ['patom', ('identifier', 'h1')]]], ['unit', ['literal', ['patom', ('identifier', 'h2')]]]]], ['sent', ['conj', ['unit', ['literal', ['patom', ('identifier', 'b1')]]], ['not_literal', ['patom', ('identifier', 'b2')]]]]]]
    P_u = 'h. h1 | h2 :- b1, not b2.'
    return u_program(P) == P_u

def u_program(P):
    P_u = u_statement(P[0]) # _u stands for 'unparsed'
    for S in P[1:]:
        P_u = P_u + ' ' + u_statement(S) # avoid adding a 'space' before the first 'statement'
    return P_u

def u_statement(S):
    if S[0] == 'rule':
        return u_rule(S)

def u_rule(R):
    return u_tree(R)

def u_tree(T):
    n = len(T[1:]) # number of children

    if T[0] == 'rule':
        if n == 2:
            return u_tree(T[1]) + ' :- ' + u_tree(T[2]) + '.'
        if n == 1:
            return u_tree(T[1]) + '.'

    if T[0] == 'sent':
        return u_tree(T[1])

    if T[0] == 'disj':
        T_u = u_tree(T[1])
        for C in T[2:]:
            T_u = T_u + ' | ' + u_tree(C)
        return T_u

    if T[0] == 'conj':
        T_u = u_tree(T[1])
        for C in T[2:]:
            T_u = T_u + ', ' + u_tree(C)
        return T_u

    if T[0] == 'unit':
        return u_tree(T[1])

    if T[0] == 'not_literal':
        return 'not ' + u_tree(T[1])

    if T[0] == 'literal':
        return u_tree(T[1])

    if T[0] == 'patom':
        if n == 1: # arity-0 predicate
            return T[1][1]
######################################################################
