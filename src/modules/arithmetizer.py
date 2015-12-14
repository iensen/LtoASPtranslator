import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
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
                    'sum'   #       == 'product'
            return root, a, ('minus', '-'), mult
        else:
            return T[0], a, T[2], b
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += demodularize_sect(t),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
eval: dict(str: tuple) <->
'''
def eval(D):
    dict1 = {}
    e_tdecls = eval_section(D['tdecls'], dict1)
    e_rules = eval_section(D['rules'], dict1)
    return {'tdecls': e_tdecls, 'rules': e_rules}

'''
eval_section: tuple <->
'''
def eval_section(T, D):
    if T[0] in housekeeper.lexemes | {'ar_term'}:
        return T
    elif T[0] == 'gar_term':
        num = calc_gar_term(T, D) # int
        num = 'numeral', str(num)
        return num
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += eval_section(t, D),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
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
        elif infix == '/':
            return a // b
