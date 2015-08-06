import labels

'''
From an adjusted L program: look in the rules; extract ground terms and predicates with arities

Input: adjusted L program:
['progr',..., ['rules',...]]

Output: ground terms and predicates with arities:
{'gterms': {('const', ('identifier', 'a')),...}, 'preds': {('p', 0),...}}

extract: list -> dict
'''
def extract(T):
    progr = {'gterms': set(), 'preds': set()}
    for t in T[1:]:
        if t[0] == 'rules':
            gterms = ground_terms_tuple(list_to_tuple(t))
            progr['gterms'] |= gterms
            preds = predicates(t)
            progr['preds'] |= preds
    return progr

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
Collect (list) ground terms from adjusted L rules

Input: adjusted L rules: 
['rules', ['rule',...['patom',..., ['terms',...('identifier', 'a'),...]]],...]

Output: (list) ground terms: 
[['const', ('identifier', 'a')],...]

ground_terms_list: list -> list
'''
def ground_terms_list(T):
    Tuple = list_to_tuple(T)
    Set = ground_terms_tuple(Tuple)
    List = []
    for t in Set:
        List += [tuple_to_list(t)]
    return List

########## ########## ########## ########## ########## ########## ########## ##########

'''
Collect (tuple) ground terms from L tuple-rules

Input: L tuple-rules: 
('rules', ('rule',...('patom',..., ('terms',...('identifier', 'a'),...))),...)

Output: (tuple) ground terms: 
{('const', ('identifier', 'a')),...}

ground_terms_tuple: tuple -> set
'''
def ground_terms_tuple(T):
    if T[0] in labels.lexemes:
        return set()
    elif T[0] == 'patom':
        return ground_terms_tuple_label_patom(T)
    else:
        gterms = set()
        for t in T[1:]:
            gterms |= ground_terms_tuple(t)
        return gterms

# When function 'ground_terms_tuple' sees a label 'patom', flow control to this similar, assisting function 'ground_terms_tuple_label_patom'
def ground_terms_tuple_label_patom(T):
    if T[0] in {'const', 'num', 'func'}:
        return {T}
    elif T[0] in labels.basic_terms:
        return set()
    else:
        gterms = set()
        for t in T[1:]:
            gterms |= ground_terms_tuple_label_patom(t)
        return gterms
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
Convert a list-AST to a tuple-AST, to make it a (hashable) member of a set

Input: list-AST like: 
['patom', ('identifier', 'p')]

Output: tuple-AST like: 
('patom', ('identifier', 'p'))

list_to_tuple: list -> tuple
'''
def list_to_tuple(T):
    if T[0] in labels.lexemes:
        return T
    else:
        Tuple = (T[0],)
        for t in T[1:]:
            Tuple += (list_to_tuple(t),)
        return Tuple

'''
Convert a tuple-AST back to a list-AST

Input: tuple-AST like: 
('patom', ('identifier', 'p'))

Output: list-AST like: 
['patom', ('identifier', 'p')]

tuple_to_list: tuple -> list
'''
def tuple_to_list(T):
    if T[0] in labels.lexemes:
        return T
    else:
        List = [T[0]]
        for t in T[1:]:
            List += [tuple_to_list(t)]
        return List

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
Collect predicates with arities from adjusted L rules

Input: adjusted L rules: 
['rules', ['rule',...['patom', ('identifier', 'p')]],...]

Output: predicates with arities: 
{('p', 0),...}

predicates: list -> set
'''
def predicates(T):
    if T[0] in labels.lexemes:
        return set()
    elif T[0] == 'patom':
        return predicates_label_patom(T)
    else:
        preds = set()
        for t in T[1:]:
            preds |= predicates(t)
        return preds

# When function 'predicates' sees a label 'patom', flow control to this similar, assisting function 'predicates_label_patom'
def predicates_label_patom(T):
    pname = T[1][1]
    if len(T) == 2:
        arity = 0
    else:
        arity = len(T[2]) - 1
    return {(pname, arity)}
