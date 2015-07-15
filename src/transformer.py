######################################################################
# INCOMPLETE
######################################################################

'''
t_program: list -> list

The function 't_program' transforms a parsed L program into a parsed ASP program.
'''

def t_test():
    P = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'h')]]]]], ['rule', ['sent', ['disj', ['unit', ['literal', ['patom', ('identifier', 'h1')]]], ['unit', ['literal', ['patom', ('identifier', 'h2')]]]]], ['sent', ['conj', ['unit', ['literal', ['patom', ('identifier', 'b1')]]], ['neg_literal', ['patom', ('identifier', 'b2')]]]]]]
    P_t = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'h')]]]]], ['rule', ['sent', ['disj', ['unit', ['literal', ['patom', ('identifier', 'h1')]]], ['unit', ['literal', ['patom', ('identifier', 'h2')]]]]], ['sent', ['conj', ['unit', ['literal', ['patom', ('identifier', 'b1')]]], ['not_literal', ['patom', ('identifier', 'b2')]]]]]]
    return t_program(P) == P_t

def t_program(P):
    P_t = [] # _t stands for 'transformed'
    for S in P:
        P_t = P_t + [t_statement(S)]
    return P_t

def t_statement(S):
    if S[0] == 'rule':
        return t_rule(S)

def t_rule(R):
    return t_tree(R)

def t_tree(T):
    
    if T[0] == 'rule': # T[0] is the root
        T_t = ['rule']
        for C in T[1:]: # T[1:] is the list of children
            T_t = T_t + [t_tree(C)]
        return T_t
    
    if T[0] == 'sent':
        T_t = ['sent']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t
    
    if T[0] == 'disj':
        T_t = ['disj']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t

    if T[0] == 'conj':
        T_t = ['conj']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t
    
    if T[0] == 'unit':
        T_t = ['unit']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t
    
    if T[0] == 'neg_literal':
        T_t = ['not_literal']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t
    
    if T[0] == 'literal':
        T_t = ['literal']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t
    
    if T[0] == 'patom':
        T_t = ['patom']
        for C in T[1:]:
            T_t = T_t + [t_tree(C)]
        return T_t

    if T[0] == 'identifier':
        T_t = T
        return T_t
######################################################################
