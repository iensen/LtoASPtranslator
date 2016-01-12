import random
from . import housekeeper

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
    tvarS = housekeeper.get_tvarS(T)
    if tvarS == set():
        return {T}
    else:
        tvar = random.sample(tvarS, 1)[0]
        tname = tvar[1]
        constS = tname_constSS[tname]
        s = set()
        for const in constS:
            d = {tvar: const}
            s |= {housekeeper.subst_stat(T, d)}
        S = set()
        for el in s:
            S |= get_ground_tupleS(el, tname_constSS)
        return S
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
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
    S = eval_set_expr(set_expr, D)
    return {tname: S}

'''
eval_set_expr: tuple * tname_constSS -> set
'''
def eval_set_expr(T, D):
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
        return eval_set_expr(T[1], D) | eval_set_expr(T[2], D)
    elif T[0] == 'inters':
        return eval_set_expr(T[1], D) & eval_set_expr(T[2], D)
    else: # 'diff'
        return eval_set_expr(T[1], D) - eval_set_expr(T[2], D)
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
get_evaluated_termS: tuple * tname_constSS -> set
'''
def get_evaluated_termS(T, D):
    if T[0] == 'terms':
        S = set()
        for term in T[1:]:
            S |= get_evaluated_tupleS(term, D)
            if term[0] == 'func':
                subterms = term[2]
                S |= get_evaluated_termS(subterms, D)
        return S
    elif T[0] in {'aggr'} | housekeeper.lexemes:
        return set()
    else:
        S = set()
        for t in T[1:]:
            S |= get_evaluated_termS(t, D)
        return S