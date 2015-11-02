# Frequently referred labels from L/ASP lexicon/grammar:

lexemes = {'identifier', 'numeral', 'variable', 'every', 'some'}

ar_ops = {'plus', 'minus', 'mult', 'div', 'mod'}

ground_terms = {'const', 'num', 
                'ar_term',  # possibly non-ground
                'func'}     # possibly non-basic
basic_terms = ground_terms | {'var', 'tvar'}
terms = basic_terms | {'qt'}

cut_root_comma = {'snames', 'terms', 'bterms', 'gterms', 'tvars'}

set_ops = {'union': ' + ', 'inters': ' * ', 'diff': ' - '}

comp_ops = {'eq', 'noteq', 'less', 'lessoreq', 'greater', 'greateroreq'}

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
list_to_tuple: convert a tree and its subtrees from lists to tuples
(to make the tree hashable to be a member of a set)

Input: trees
['rules', ['fact', ['head',...,['patom', ('identifier', 'p0')]]],...]

Output: tuple trees
('rules', ('fact', ('head',...,('patom', ('identifier', 'p0')))),...)

list_to_tuple: list -> tuple
'''
def list_to_tuple(T):
    if type(T) == tuple:
        return T
    else:
        tr = (T[0],)
        for t in T[1:]:
            tr += (list_to_tuple(t),)
        return tr

'''
tuple_to_list: convert a tuple tree and its tuple non-leaf subtrees to lists
(for consistency with the spec of the generic parser)

Input: tuple trees
('const', ('identifier', 'a'))

Output: trees
['const', ('identifier', 'a')]

tuple_to_list: tuple -> list
'''
def tuple_to_list(T):
    if T[0] in lexemes:
        return T
    else:
        tr = [T[0]]
        for t in T[1:]:
            tr += [tuple_to_list(t)]
        return tr
