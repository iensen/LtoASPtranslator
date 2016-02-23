'''
This is a submodule of *transformer*.

Most *evaluator* functions return evaluated terms from 
L statements (which might contain variables and arithmetic terms)
'''

########## ########## ########## ########## ########## ########## ########## ##########

import random

from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
get_evaluated_tupleS: tuple * tname_constSS -> set
'''
def get_evaluated_tupleS(T, tname_constSS):
    s = get_ground_tupleS(T, tname_constSS)
    S = set()
    for el in s:
        S |= {housekeeper.eval_tuple(el)}
    return S

'''
get_ground_tupleS: tuple * tname_constSS -> set
'''
def get_ground_tupleS(T, tname_constSS):
    tvarS = housekeeper.get_tvarS_from_tuple(T)
    if tvarS == set():
        return {T}
    else:
        tvar = random.sample(tvarS, 1)[0]
        tname = tvar[1]
        constS = tname_constSS[tname]
        s = set()
        for const in constS:
            d = {tvar: const}
            s |= {housekeeper.subbing_tuple(T, d)}
        S = set()
        for el in s:
            S |= get_ground_tupleS(el, tname_constSS)
        return S
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
expand_tdecls: tuple -> tname_constSS
'''
def expand_tdecls(T):
    D = {}
    tdecls = T[1:]
    for tdecl in tdecls:
        d = expand_tdecl(tdecl, D)
        D.update(d)
    return D

'''
expand_tdecl: tuple * tname_constSS -> tname_constSS
'''
def expand_tdecl(T, D):
    tname = T[1]
    set_expr = T[2]
    S = get_constS_from_set_expr(set_expr, D)
    return {tname: S}

'''
get_constS_from_set_expr: tuple * tname_constSS -> set
'''
def get_constS_from_set_expr(T, D):
    if T[0] == 'sconstr':
        term = T[1]
        return get_evaluated_tupleS(term, D)
    elif T[0] == 'set':
        terms = T[1]
        return set(terms[1:])
    elif T[0] == 'range':
        S = set()
        l1 = int(T[1][1][1])
        l2 = int(T[2][1][1])
        for i in range(l1, l2 + 1):
            S |= {('num', ('numeral', str(i)))}
        return S
    elif T[0] == 'tname':
        return D[T]
    elif T[0] == 'union':
        return get_constS_from_set_expr(T[1], D) | get_constS_from_set_expr(T[2], D)
    elif T[0] == 'inters':
        return get_constS_from_set_expr(T[1], D) & get_constS_from_set_expr(T[2], D)
    else: # 'diff'
        return get_constS_from_set_expr(T[1], D) - get_constS_from_set_expr(T[2], D)
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
get_evaluated_termS_from_basic_term: tuple * tname_constSS -> set
'''
def get_evaluated_termS_from_basic_term(T, D):
    if T[0] in housekeeper.basic_terms:
        S = get_evaluated_tupleS(T, D)
        if T[0] == 'func':
            subterms = T[2]
            S |= get_evaluated_termS_from_basic_term(subterms, D)
        return S
    elif T[0] in housekeeper.lexemes:
        return set()
    else:
        S = set()
        for t in T[1:]:
            S |= get_evaluated_termS_from_basic_term(t, D)
        return S
