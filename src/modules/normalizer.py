'''
This 'normalizer' module converts a propositional formula into 
conjunctive/disjunctive normal form.
'''

########## ########## ########## ########## ########## ########## ########## ##########

from . import unparser

########## ########## ########## ########## ########## ########## ########## ##########

NOT = 'neg_class'
AND = 'conj'
OR = 'disj'

FALSE = '#false'
TRUE = '#true'

########## ########## ########## ########## ########## ########## ########## ##########

'''
flatten: tuple * str -> tuple
'''
def flatten(T, mode):
    Dict = {'CNF': AND, 'DNF': OR}
    tuple1 = ()
    if T[0] == Dict[mode]:
        for t in T[1:]:
            tuple1 += flatten(t, mode)
    else:
        tuple1 += T,
    return tuple1

########## ########## ########## ########## ########## ########## ########## ##########

'''
normalize: tuple * str -> tuple
'''
def normalize(T, mode):
    T = NOTing(T)
    global floated
    
    floated = True
    while floated:
        floated = False
        if mode == 'CNF':
            T = ORing(T)
        else: # 'DNF'
            T = ANDing(T)
            
    floated = True
    while floated:
        floated = False
        T = elim(T)
        
    return T

########## ########## ########## ########## ########## ########## ########## ##########

'''
NOTing: tuple -> tuple
'''
def NOTing(T):
    if T[0] == NOT:
        if T[1][0] == NOT:
            return NOTing(T[1][1])
        elif T[1][0] == AND:
            tuple1 = OR, (NOT, T[1][1]), (NOT, T[1][2])
            return NOTing(tuple1)
        elif T[1][0] == OR:
            tuple1 = AND, (NOT, T[1][1]), (NOT, T[1][2])
            return NOTing(tuple1)
        else:
            return T
    elif T[0] in {AND, OR}:
        return T[0], NOTing(T[1]), NOTing(T[2])
    else:
        return T

########## ########## ########## ########## ########## ########## ########## ##########

'''
ANDing: tuple -> tuple
'''
def ANDing(T):
    if T[0] == NOT: # 'NOTing' is called first in 'normalize'
        return NOT, ANDing(T[1])
    elif T[0] == AND:
        if T[1][0] == OR:
            global floated
            floated = True
            tuple1 = OR, (AND, T[1][1], T[2]), (AND, T[1][2], T[2])
            return ANDing(tuple1)
        elif T[2][0] == OR:
            return ANDing((AND, T[2], T[1]))
        else:
            return AND, ANDing(T[1]), ANDing(T[2])
    elif T[0] == OR:
        return OR, ANDing(T[1]), ANDing(T[2])
    else:
        return T
        
'''
ORing: tuple -> tuple
'''
def ORing(T):
    if T[0] == NOT: # 'NOTing' is called first in 'normalize'
        return NOT, ORing(T[1])
    elif T[0] == AND:
        return AND, ORing(T[1]), ORing(T[2])
    elif T[0] == OR:
        if T[1][0] == AND:
            global floated
            floated = True
            tuple1 = AND, (OR, T[1][1], T[2]), (OR, T[1][2], T[2])
            return ORing(tuple1)
        elif T[2][0] == AND:
            return ORing((OR, T[2], T[1]))
        else:
            return OR, ORing(T[1]), ORing(T[2])
    else:
        return T
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
elim: tuple -> tuple
'''
def elim(T):
    global floated
    if T[0] == NOT:
        return NOT, elim(T[1])
    elif T[0] == AND:
        if T[1][0] == FALSE:
            floated = True
            return FALSE,
        elif T[1][0] == TRUE:
            floated = True
            return elim(T[2])
        elif T[1] == (NOT, T[2]):
            floated = True
            return FALSE,
        elif T[2][0] in {FALSE, TRUE} or T[2] == (NOT, T[1]):
            return elim((AND, T[2], T[1]))
        elif T[1] == T[2]:
            floated = True
            return elim(T[1])
        else:
            return AND, elim(T[1]), elim(T[2])
    elif T[0] == OR:
        if T[1][0] == FALSE:
            floated = True
            return elim(T[2])
        if T[1][0] == TRUE:
            floated = True
            return TRUE,
        elif T[2][0] in {FALSE, TRUE}:
            return elim((OR, T[2], T[1]))
        elif T[1] == T[2]:
            floated = True
            return elim(T[1])
        else:
            return OR, elim(T[1]), elim(T[2])
    else:
        return T
        
########## ########## ########## ########## ########## ########## ########## ##########

def tuple_to_str(T):
    if T[0] in {FALSE, TRUE}:
        return T[0]
    elif T[0] == NOT:
        st = tuple_to_str(T[1])
        cond = T[1][0] in {AND, OR}
        st = parentheses(st, cond)
        return 'not ' + st
    elif T[0] == AND:
        Pair = ()
        for t in T[1:]:
            st = tuple_to_str(t)
            cond = t[0] == OR
            st = parentheses(st, cond)
            Pair += (st,)
        return Pair[0] + ' and ' + Pair[1]
    elif T[0] == OR:
        return tuple_to_str(T[1]) + ' or ' + tuple_to_str(T[2])
    else:
        return unparser.unparse_rules(T)

'''
parentheses: str * str -> str
'''
def parentheses(st, cond):
    if cond:
        st = '(' + st + ')'
    return st
    
########## ########## ########## ########## ########## ########## ########## ##########

# '''
# To use the module as a stand-alone program:
    # 1.  Write an L program, whose sole statement is a fact, 
        # which represents a propositional formula.
    # 2.  Via a command-line interface:
        # a.  Change the directory to src/modules.
        # b.  Call 'normalizer':
                # python normalizer.py <path_to_L_program>
                
# An example:
    # 1.  See:
        # https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/formula.l
    # 2.  Windows Command Prompt:
        # a.  Type:
                # cd/d E:\LtoASPtranslator\src\modules
        # b.  Type:
                # python normalizer.py ../examples/formula.l
            # (Python 3.4.3)
# '''

# if __name__ == '__main__':
    # import sys
    # sys.path.insert(0, '..')
    # import main
    
    # import housekeeper

    # l = sys.argv[1]
    # parsed = main.parse_file(l)[0][1][1]
    # parsed = housekeeper.list_to_tuple(parsed)

    # modes = {'CNF', 'DNF'}
    # Dict = {}
    # for mode in modes:
        # Dict[mode] = normalize(parsed, mode)
        
    # print('Input:', tuple_to_str(parsed), sep = '\n', end = '\n\n')
    
    # for mode in modes:
        # normalized = Dict[mode]
        # print(mode + ':', tuple_to_str(normalized), sep = '\n', end = '\n\n')
