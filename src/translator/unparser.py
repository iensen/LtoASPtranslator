'''

u_program: list -> str

The function u_program unparses a list of ASP parse trees.

For instance, assign P as:
['progr', ['pdecls', ['stmts', ['pdecl', ('identifier', 'p')], ['pdecl', ('identifier', 'q2')], ['pdecl', ('identifier', 'p3')], ['pdecl', ('identifier', 'p2')], ['pdecl', ('identifier', 'p1')], ['pdecl', ('identifier', 'q3')], ['pdecl', ('identifier', 'q1')], ['pdecl', ('identifier', 'r')]]], ['rules', ['stmts', ['fact', ['head', ['unit', ['literal', ['patom', ('identifier', 'p1')]]]]], ['fact', ['head', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1')]]], ['unit', ['literal', ['patom', ('identifier', 'p2')]]]], ['unit', ['literal', ['patom', ('identifier', 'p3')]]]]]], ['long_rule', ['head', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['body', ['unit', ['literal', ['patom', ('identifier', 'q1')]]]]], ['long_rule', ['head', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['body', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1')]]], ['literal', ['patom', ('identifier', 'q2')]]], ['literal', ['patom', ('identifier', 'q3')]]]]], ['long_rule', ['head', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['body', ['unit', ['not_literal', ['patom', ('identifier', 'r')]]]]]]]]
Then u_program(P) should give:
'predicates p(). q2(). p3(). p2(). p1(). q3(). q1(). r(). rules p1. p1 | p2 | p3. p :- q1. p :- q1, q2, q3. p :- not r. '

'''

import shared
import transformer

def u_program(P):
    return u_pred_decls(P) + u_rules(P)

######################################################################

def u_pred_decls(P):
    pdecls = P[1][1][1:]
    pdecls_u = 'predicates '
    for pdecl in pdecls:
        pred = pdecl[1][1]
        pdecls_u = pdecls_u + pred + '(). '
    return pdecls_u

######################################################################

def u_rules(P):
    rules = P[2][1][1:]
    rules_u = 'rules '
    for rule in rules:
        rules_u = rules_u + u_tree(rule)
    return rules_u

def u_tree(T):
    root = T[0]
    child1 = T[1]
    children = T[1:]
    n = len(children)
    if n >= 2:
        child2 = T[2]

    if root == 'contraint':
        return ':- ' + u_tree(child1) + '. '
    if root == 'fact':
        return u_tree(child1) + '. '
    if root == 'long_rule':
        return u_tree(child1) + ' :- ' + u_tree(child2) + '. '

    if root == 'disj':
        return u_tree(child1) + ' | ' + u_tree(child2)

    if root == 'conj':
        return u_tree(child1) + ', ' + u_tree(child2)

    if root == 'not_literal':
        return 'not ' + u_tree(child1)

    if root in shared.unwritten_labels:
        return u_tree(child1)

    if root in shared.lexemes:
        return child1
######################################################################
P = transformer.P_t
P_u = u_program(P)
