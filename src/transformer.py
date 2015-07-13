'''
program: list -> list

The function 'program' transforms a parsed L program into a parsed ASP program.

For examples, let P =
[['rule', ['sent', ['literal', ['patom', ('identifier', 'h')]]]], ['rule', ['sent', ['disj', ['literal', ['patom', ('identifier', 'h1')]], ['literal', ['patom', ('identifier', 'h2')]]]], ['sent', ['conj', ['literal', ['patom', ('identifier', 'b1')]], ['neg_literal', ['patom', ('identifier', 'b2')]]]]]].
Then, program(P) =
[['rule', ['sent', ['literal', ['patom', ('identifier', 'h')]]]], ['rule', ['sent', ['disj', ['literal', ['patom', ('identifier', 'h1')]], ['literal', ['patom', ('identifier', 'h2')]]]], ['sent', ['conj', ['literal', ['patom', ('identifier', 'b1')]], ['not_literal', ['patom', ('identifier', 'b2')]]]]]].
'''

def program(P):
    P_t = [] # _t stands for 'translated'
    for S in P:
        P_t = P_t + [statement(S)]
    return P_t

def statement(S):
    if S[0] == 'rule':
        return rule(S)

def rule(R):
    return tree(R)

def tree(T):
    
    if T[0] == 'rule': # T[0] is the root
        T_t = ['rule']
        for C in T[1:]: # T[1:] is the list of children
            T_t = T_t + [tree(C)]
        return T_t
    
    if T[0] == 'sent':
        T_t = ['sent']
        for C in T[1:]:
            T_t = T_t + [tree(C)]
        return T_t
    
    if T[0] == 'disj':
        T_t = ['disj']
        for C in T[1:]:
            T_t = T_t + [tree(C)]
        return T_t

    if T[0] == 'conj':
        T_t = ['conj']
        for C in T[1:]:
            T_t = T_t + [tree(C)]
        return T_t
    
    if T[0] == 'neg_literal':
        T_t = ['not_literal']
        for C in T[1:]:
            T_t = T_t + [tree(C)]
        return T_t
    
    if T[0] == 'literal':
        T_t = ['literal']
        for C in T[1:]:
            T_t = T_t + [tree(C)]
        return T_t
    
    if T[0] == 'patom':
        T_t = ['patom']
        for C in T[1:]:
            T_t = T_t + [tree(C)]
        return T_t

    if T[0] == 'identifier':
        T_t = T
        return T_t
######################################################################
