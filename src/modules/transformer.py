'''
This module transforms an L program AST into a (complete) ASP program AST
'''

########## ########## ########## ########## ########## ########## ########## ##########

from . import rewriter
from . import reassembler
from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
transform: transform a parsed L program into a parsed ASP program

Input: a parsed L program:
[['tdecl',...], ['rule',...],...]

Output: a parsed ASP program:
['prog', ['sdefs',...], ['pdecls',...], ['rules',...]]

transform: list -> list
'''
def transform(T):
    T = ['prog'] + T
    T = housekeeper.list_to_dict(T)
    rewritten = rewriter.rewrite(T)
    reassembled = reassembler.reassemble(rewritten)
    T = housekeeper.dict_to_list(reassembled)
    return T
