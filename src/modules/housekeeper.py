# Frequently referred labels from L/ASP lexicon/grammar:

ar_ops = {'plus', 'minus', 'mult', 'div', 'mod'}
comp_ops = {'eq', 'noteq', 'less', 'lessoreq', 'greater', 'greateroreq'}
lexemes = ar_ops | comp_ops | {'identifier', 'numeral', 'variable', 'every', 'some'}

ground_terms = {    'const', 'num', 
                    'ar_term',  # possibly non-ground
                    'func'}     # possibly non-basic
basic_terms = ground_terms | {'var', 'tvar'}
terms = basic_terms | {'qt'}

cut_root_comma = {'snames', 'terms', 'bterms', 'gterms', 'tvars'}

set_ops = {'union': ' + ', 'inters': ' * ', 'diff': ' - '}

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
    else: # list
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
    else: # non-terminal label
        tr = [T[0]]
        for t in T[1:]:
            tr += [tuple_to_list(t)]
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
list_to_dict: change the data type of a program from list to dictionary
(for convenient handling)

Input: a parsed L program:
[['tdecl',...], ['rule',...],...]

Output: a dictionary parsed L program:
{'tdecls': ['tdecls', ['tdecl',...],...], 'rules': ['rules', ['rule',...],...]}

list_to_dict: list -> dict
'''
def list_to_dict(T):
    T = list_to_tuple(T)
    prog = {'cdecls': ('cdecls',), 'tdecls': ('tdecls',), 'rules': ('rules',)}
    for t in T[1:]:
        prog[t[0]+'s'] += t,
    return prog

'''
dict_to_list: change the data type of a program from dictionary to list
(for consistency with the spec of the generic parser)

Input: a dictionary parsed ASP program:
{
    'sdefs': ['sdefs', ['sdef',...],...],
    'pdecls': ['pdecls', ['pdecl',...],...],
    'rules': ['rules', ['rule',...],...]}

Output: a parsed ASP program:
['prog',
    ['sdefs', ['sdef',...],...],
    ['pdecls', ['pdecl',...],...],
    ['rules', ['rule',...],...]]
    
dict_to_list: dict -> list
'''
def dict_to_list(T):
    prog = ()
    for keyw in ('cdefs', 'sdefs', 'pdecls', 'rules'):
        if len(T[keyw]) > 1:
            prog += T[keyw],
    if prog != ():
        prog = ('prog',) + prog
    prog = tuple_to_list(prog)
    return prog
