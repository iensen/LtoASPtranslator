'''
This module 'normalizer' converts a propositional formula to conjunctive/disjunctive normal form.

Using a command-line interface:
    1.  Change the directory to: src
    2.  Provide an input formula in the form of an L program whose 
        sole statement is a head-only rule (such as: not(p and (q or r))):
            python normalizer.py <path_to_input_formula>
        
For example:
    cd/d E:/LtoASPtranslator/src
    python normalizer.py examples/formula.l
'''

import main

import sys
sys.path.insert(0, 'unparser')
import unparser

########## ########## ########## ########## ########## ########## ########## ##########

NOT = 'neg_class'
AND = 'conj'
OR = 'disj'

FALSE = 'false'
TRUE = 'true'

########## ########## ########## ########## ########## ########## ########## ##########

def flatten(T, mode):
    Dict = {'CNF': AND, 'DNF': OR}
    List = []
    if T[0] == Dict[mode]:
        for t in T[1:]:
            List += flatten(t, mode)
    else:
        List += [T]
    return List

########## ########## ########## ########## ########## ########## ########## ##########

def normalize(T, mode):
    T = NOTing(T)
    
    global floated
    
    floated = True
    while floated:
        floated = False
        if mode == 'CNF':
            T = ORing(T)
        else:
            T = ANDing(T)
            
    floated = True
    while floated:
        floated = False
        T = elim(T)
        
    return T

########## ########## ########## ########## ########## ########## ########## ##########
        
def NOTing(T):
    if T[0] == NOT:
        if T[1][0] == NOT:
            return NOTing(T[1][1])
        elif T[1][0] == AND:
            return NOTing([OR, [NOT, T[1][1]], [NOT, T[1][2]]])
        elif T[1][0] == OR:
            return NOTing([AND, [NOT, T[1][1]], [NOT, T[1][2]]])
        else:
            return T
    elif T[0] in {AND, OR}:
        return [T[0], NOTing(T[1]), NOTing(T[2])]
    else:
        return T

########## ########## ########## ########## ########## ########## ########## ##########

def ANDing(T):
    if T[0] == NOT:
        return [NOT, ANDing(T[1])]
    elif T[0] == AND:
        if T[1][0] == OR:
            global floated
            floated = True
            return ANDing([OR, [AND, T[1][1], T[2]], [AND, T[1][2], T[2]]])
        elif T[2][0] == OR:
            return ANDing([AND, T[2], T[1]])
        else:
            return [AND, ANDing(T[1]), ANDing(T[2])]
    elif T[0] == OR:
        return [OR, ANDing(T[1]), ANDing(T[2])]
    else:
        return T
        
def ORing(T):
    if T[0] == NOT:
        return [NOT, ORing(T[1])]
    elif T[0] == AND:
        return [AND, ORing(T[1]), ORing(T[2])]
    elif T[0] == OR:
        if T[1][0] == AND:
            global floated
            floated = True
            return ORing([AND, [OR, T[1][1], T[2]], [OR, T[1][2], T[2]]])
        elif T[2][0] == AND:
            return ORing([OR, T[2], T[1]])
        else:
            return [OR, ORing(T[1]), ORing(T[2])]
    else:
        return T
        
########## ########## ########## ########## ########## ########## ########## ##########

def elim(T):
    global floated
    if T[0] == NOT:
        return [NOT, elim(T[1])]
    elif T[0] == AND:
        if T[1][0] == FALSE:
            floated = True
            return [FALSE]
        elif T[1][0] == TRUE:
            floated = True
            return elim(T[2])
        elif T[1] == [NOT, T[2]]:
            floated = True
            return [FALSE]
        elif T[2][0] in {FALSE, TRUE} or T[2] == [NOT, T[1]]:
            return elim([AND, T[2], T[1]])
        elif T[1] == T[2]:
            floated = True
            return elim(T[1])
        else:
            return [AND, elim(T[1]), elim(T[2])]
    elif T[0] == OR:
        if T[1][0] == FALSE:
            floated = True
            return elim(T[2])
        if T[1][0] == TRUE:
            floated = True
            return [TRUE]
        if T[1] == [NOT, T[2]]:
            floated = True
            return [TRUE]
        elif T[2][0] in {FALSE, TRUE} or T[2] == [NOT, T[1]]:
            return elim([OR, T[2], T[1]])
        elif T[1] == T[2]:
            floated = True
            return elim(T[1])
        else:
            return [OR, elim(T[1]), elim(T[2])]
    else:
        return T
        
########## ########## ########## ########## ########## ########## ########## ##########

def list_to_str(T):
    if T[0] in {FALSE, TRUE}:
        return T[0]
    elif T[0] == NOT:
        st = list_to_str(T[1])
        cond = T[1][0] in {AND, OR}
        st = parentheses(st, cond)
        return 'not ' + st
    elif T[0] == AND:
        Pair = ()
        for t in T[1:]:
            st = list_to_str(t)
            cond = t[0] == OR
            st = parentheses(st, cond)
            Pair += (st,)
        return Pair[0] + ' and ' + Pair[1]
    elif T[0] == OR:
        return list_to_str(T[1]) + ' or ' + list_to_str(T[2])
    else:
        return unparser.unparse_rules(T)

def parentheses(st, cond):
    if cond:
        st = '(' + st + ')'
    return st
    
########## ########## ########## ########## ########## ########## ########## ##########
        
if __name__ == '__main__':
    file_input = sys.argv[1]
    parsed = main.parse_file(file_input)[0][1][1]

    modes = {'CNF', 'DNF'}
    Dict = {}
    for mode in modes:
        Dict[mode] = normalize(parsed, mode)
        
    print('Input:', list_to_str(parsed), sep = '\n', end = '\n\n')
    # print('Parsed:\n', parsed, '\n', sep = '')
    
    for mode in modes:
        normalized = Dict[mode]
        print(mode + ':', list_to_str(normalized), sep = '\n', end = '\n\n')
        # print('Flattened:\n', flatten(normalized, mode), sep = '', end = '\n\n')
