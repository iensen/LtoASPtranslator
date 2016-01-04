'''
This "arithmetizer.py" module handles arithmetic when translating from L to ASP
'''

########## ########## ########## ########## ########## ########## ########## ##########

from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
calc_cdecls: tuple -> dict(str: int)
'''
def calc_cdecls(T):
    dict1 = {}
    cdecls = T[1:]
    for cdecl in cdecls:
        cname = cdecl[1][1]
        num = calc_gar_term(cdecl[2], dict1)
        dict1[cname] = num
    return dict1

########## ########## ########## ########## ########## ########## ########## ##########

'''
calc_gar_term: tuple * dict(str: int) -> int
'''
def calc_gar_term(T, D):
    if T[0] == 'identifier':
        return D[T[1]]
    elif T[0] == 'numeral':
        return int(T[1])
    else: # in {'gar_term', 'sum', 'product'}
        a = calc_gar_term(T[1], D)
        b = calc_gar_term(T[3], D)
        infix = T[2][1]
        if infix == '+':
            return a + b
        elif infix == '-':
            return a - b
        elif infix == '*':
            return a * b
        else: # '/'
            return a // b
            
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
Evaluate GROUND arithmetic expressions

eval_gar: dict(str: tuple) <->
'''
def eval_gar(D):
    dict1 = {}
    e_tdecls = eval_gar_term(D['tdecls'], dict1)
    e_rules = eval_gar_term(D['rules'], dict1)
    return {'tdecls': e_tdecls, 'rules': e_rules}

########## ########## ########## ########## ########## ########## ########## ##########

'''
eval_gar_term: tuple * dict(str: int) -> tuple
'''
def eval_gar_term(T, D):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'gar_term':
        num = calc_gar_term(T, D) # int
        num = 'numeral', str(num)
        return num
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += eval_gar_term(t, D),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
Evaluate (non-ground) arithmetic term

eval_ar_term: tuple * dict(vname: set(tuple)) -> set(tuple)
'''
def eval_ar_term(T, D):
    vars = housekeeper.get_vars(T) # Get variable subterms of arithmetic term
    var_sets = {} 
    for var in vars:
        vname = var[1]
        nums = D[vname]
        ints = set()
        for num in nums:
            ints |= {int(num[1])}
        var_sets[vname] = ints # dict(str: set(int))
    s_tuples = substitute(T, var_sets) # set(tuple)
    e_tuples = set()
    for s_tuple in s_tuples:
        e_tuples |= {eval_gar_term(s_tuple, {})}
    return e_tuples
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
Substitute variables in a tree with their numeric values

substitute: tuple * dict(vname: set(int)) -> set(tuple)
'''
def substitute(T, D):
    tuples = set()
    for vname in D:
        var = 'variable', vname
        for num in D[vname]:
            num = 'numeral', str(num)
            tuples |= {substitute1(T, var, num)}
    return tuples

'''
substitute1: tuple * tuple1 * tuple2 -> tuple
'''
def substitute1(T, t1, t2):
    if T == t1:
        T = t2
        return substitute1(T, t1, t2)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = ('gar_term',) if T[0] == 'ar_term' else T[:1]
        for t in T[1:]:
            tr += substitute1(t, t1, t2),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
Replace constant names with their evaluated numeric values

replace: dict(str: tuple) <->
'''
def replace(D):
    c_cdecls = calc_cdecls(D['cdecls']) # dict
    r_tdecls = replace_section(D['tdecls'], c_cdecls)
    r_rules = replace_section(D['rules'], c_cdecls)
    return {'tdecls': r_tdecls, 'rules': r_rules}
    
'''
replace_section: tuple * dict(str: int) -> tuple
'''
def replace_section(T, D):
    if T[0] == 'identifier':
        if T[1] in D:
            num = 'numeral', str(D[T[1]])
            return num
        else:
            return T
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += replace_section(t, D),
        return tr
        
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
demodularize: Convert modulo-expressions to modulo-free-expressions:
    a % b := a - (a / b) * b
Because Sparc doesn't support the modulo operation

demodularize: dict(str: tuple) <->
'''
def demodularize(D):
    for sect in D:
        D[sect] = demodularize_sect(D[sect])
    return D

'''
demodularize_sect: tuple -> tuple
'''
def demodularize_sect(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] in {'gar_term', 'ar_term', 'sum', 'product'}:
        a = demodularize_sect(T[1])
        b = demodularize_sect(T[3])
        if T[2][0] == 'mod':
            div = 'product', a, ('div', '/'), b
            mult = 'product', b, ('mult', '*'), div
            
            root =  T[0]    if T[0] in {'gar_term', 'ar_term'} else \
                    'sum' #         == 'product'
            return root, a, ('minus', '-'), mult
        else:
            return T[0], a, T[2], b
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += demodularize_sect(t),
        return tr
