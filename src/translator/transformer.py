import shared
P = shared.P

'''

t_program: list -> list

The function t_program transforms a parsed L program into a parsed ASP program.

For example, we now have P is:
[['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p1')]]]]], ['rule', ['sent', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1')]]], ['unit', ['literal', ['patom', ('identifier', 'p2')]]]], ['unit', ['literal', ['patom', ('identifier', 'p3')]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['literal', ['patom', ('identifier', 'q1')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1')]]], ['literal', ['patom', ('identifier', 'q2')]]], ['literal', ['patom', ('identifier', 'q3')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['neg_literal', ['patom', ('identifier', 'r')]]]]]]
Then t_program(P) returns:
['progr', ['pdecls', ['stmts', ['pdecl', ('identifier', 'p2')], ['pdecl', ('identifier', 'r')], ['pdecl', ('identifier', 'p3')], ['pdecl', ('identifier', 'p')], ['pdecl', ('identifier', 'q3')], ['pdecl', ('identifier', 'q2')], ['pdecl', ('identifier', 'p1')], ['pdecl', ('identifier', 'q1')]]], ['rules', ['stmts', ['fact', ['head', ['unit', ['literal', ['patom', ('identifier', 'p1')]]]]], ['fact', ['head', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1')]]], ['unit', ['literal', ['patom', ('identifier', 'p2')]]]], ['unit', ['literal', ['patom', ('identifier', 'p3')]]]]]], ['long_rule', ['head', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['body', ['unit', ['literal', ['patom', ('identifier', 'q1')]]]]], ['long_rule', ['head', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['body', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1')]]], ['literal', ['patom', ('identifier', 'q2')]]], ['literal', ['patom', ('identifier', 'q3')]]]]], ['long_rule', ['head', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['body', ['unit', ['not_literal', ['patom', ('identifier', 'r')]]]]]]]]

'''

def t_program(P):
    return ['progr', pred_decls(P), t_rules(P)]

######################################################################

def pred_decls(P):
    stmts = ['stmts']
    for pred in predicates(P):
        stmts = stmts + [['pdecl', ('identifier', pred)]]
    return ['pdecls', stmts]

def predicates(T):
    root = T[0]
    child1 = T[1]
    children = T[1:]

    if type(T) == list:
        if root == 'patom':
            return {child1[1]}
        if root != 'patom':
            preds = set()
            for child in children:
                preds = preds | predicates(child)
            return preds

    if type(T) == tuple:
        return set()
    
######################################################################
    
def t_rules(P):
    stmts_t = ['stmts']
    for stmt in P:
        root = stmt[0]
        if root == 'rule':
            stmts_t = stmts_t + [t_tree(stmt)]
    return ['rules', stmts_t]

def t_tree(T):
    root = T[0]
    child1 = T[1]
    children = T[1:]
    n = len(children)
    if n >= 2:
        child2 = T[2]
    
    if root == 'rule':
        if n == 1:
            return ['fact', ['head', t_tree(child1[1])]]
        if n == 2:
            return ['long_rule', ['head', t_tree(child1[1])], ['body', t_tree(child2[1])]]

    if root in shared.same_labels:
        T_t = [root]
        for child in children:
            T_t = T_t + [t_tree(child)]
        return T_t

    if root == 'neg_literal':
        return ['not_literal', t_tree(child1)]
    
    if root in shared.lexemes:
        return T
######################################################################
