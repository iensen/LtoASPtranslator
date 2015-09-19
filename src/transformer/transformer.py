import sys
sys.path.insert(0, '..')
sys.path.insert(0, 'submodules')
import rewriter
import reassembler

'''
transform: transform a parsed L program into a parsed ASP program

Input: a parsed L program:
[['tdecl',...], ['rule',...],...]

Output: a parsed ASP program:
['prog', ['sdefs',...], ['pdecls',...], ['rules',...]]

transform: list -> list
'''
def transform(T):
    return dict_to_list(reassembler.reassemble(rewriter.rewrite(list_to_dict(T))))
    
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
    prog = {'tdecls': ['tdecls'], 'rules': ['rules']}
    for t in T:
        prog[t[0]+'s'] += [t]
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
    prog = []
    for keyw in ('sdefs', 'pdecls', 'rules'):
        if len(T[keyw]) > 1:
            prog += [T[keyw]]
    if prog != []:
        prog = ['prog'] + prog
    return prog
