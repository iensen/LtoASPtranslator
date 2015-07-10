'''
program: list -> str

The function 'program' unparses a parsed ASP program.

For example, let P =
[['rule', ['sent', ['literal', ['patom', ('identifier', 'h')]]]], ['rule', ['sent', ['disj', ['literal', ['patom', ('identifier', 'h1')]], ['literal', ['patom', ('identifier', 'h2')]]]], ['sent', ['conj', ['literal', ['patom', ('identifier', 'b1')]], ['not_literal', ['patom', ('identifier', 'b2')]]]]]].
Then, program(P) =
'h. h1 | h2 :- b1, not b2.'.
'''

def program(P):
    P_u = statement(P[0]) # _u stands for 'unparsed'
    for S in P[1:]:
        P_u = P_u + ' ' + statement(S) # avoid adding a 'space' before the first 'statement'
    return P_u

def statement(S):
    if S[0] == 'rule':
        return rule(S)

def rule(R):
    return tree(R)

def tree(T):
    n = len(T[1:]) # number of children

    if T[0] == 'rule':
        if n == 2:
            return tree(T[1]) + ' :- ' + tree(T[2]) + '.'
        if n == 1:
            return tree(T[1]) + '.'

    if T[0] == 'sent':
        return tree(T[1])

    if T[0] == 'disj':
        T_u = tree(T[1])
        for C in T[2:]:
            T_u = T_u + ' | ' + tree(C)
        return T_u

    if T[0] == 'conj':
        T_u = tree(T[1])
        for C in T[2:]:
            T_u = T_u + ', ' + tree(C)
        return T_u

    if T[0] == 'not_literal':
        return 'not ' + tree(T[1])

    if T[0] == 'literal':
        return tree(T[1])

    if T[0] == 'patom':
        if n == 1: # arity-0 predicate
            return T[1][1]
######################################################################
