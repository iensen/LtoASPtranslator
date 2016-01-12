import random
from . import evaluator

from . import housekeeper
'''
dequant_rules: tuple * tname_constSS -> tuple
'''
def dequant_rules(T, D):
    if T[0] in housekeeper.ruleForms:
        global quant_tvar_index
        quant_tvar_index = 0
        head = T[1]
        if head[0] == 'psent':
            head = dequant_psent(head, D)
        tr = (T[0], head)
        if T[0] == 'fullRule':
            sent = T[2]
            sent = dequant_sent(sent, D)
            tr += (sent,)
        return tr
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += dequant_rules(t, D),
        return tr
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
dequant_psent: tuple * tname_constSS -> tuple
'''
def dequant_psent(T, D):
    if T[0] == 'patom':
        return dequant_patom_in_psent(T, D)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (dequant_psent(t, D),)
        return tr

'''
dequant_sent: tuple * tname_constSS -> tuple
'''
def dequant_sent(T, D):
    if T[0] == 'patom':
        return dequant_patom_in_sent(T, D)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (dequant_sent(t, D),)
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
dequant_patom_in_psent: tuple * tname_constSS -> tuple
'''
def dequant_patom_in_psent(T, tname_constSS):
    everyS = get_everyS(T)
    someS = get_someS(T)
    if everyS == set() == someS:
        return T
    elif everyS != set(): # ?== someS
        T = subst_qts_by_quant_tvarS(T, everyS, 'Every')
        return T
    else: # someS != set() ?== everyS
        S = get_deqed_patoms(T, tname_constSS, 'some')
        patoms = tuple(S)
        tr = patoms[0]
        for patom in patoms[1:]:
            tr = ('disj', tr, patom)
        return tr
            
'''
dequant_patom_in_sent: tuple * tname_constSS -> tuple
'''
def dequant_patom_in_sent(T, tname_constSS):
    everyS = get_everyS(T)
    someS = get_someS(T)
    if everyS == set() == someS:
        return T
    elif everyS != set(): # ?== someS
        S = get_deqed_patoms(T, tname_constSS, 'every')
        patoms = tuple(S)
        tr = patoms[0]
        for patom in patoms[1:]:
            tr = ('conj', tr, patom)
        return tr
    else: # someS != set() ?== everyS
        T = subst_qts_by_quant_tvarS(T, someS, 'Some')
        return T
        
'''
get_deqed_patoms: tuple * tname_constSS * str -> tuple
'''
def get_deqed_patoms(T, D, mode):
    qtS = get_everyS(T) if mode == 'every' else get_someS(T)
    if qtS == set():
        return {T}
    else:
        qt = random.sample(qtS, 1)[0]
        tname = qt[2]
        constS = D[tname]
        s = set()
        for const in constS:
            d = {qt: const}
            s |= {housekeeper.subst_stat(T, d)}
        S = set()
        for el in s:
            S |= get_deqed_patoms(el, D, mode)
        return S

########## ########## ########## ########## ########## ########## ########## ##########

'''
subst_qts_by_quant_tvarS: tuple * set * str -> tuple
'''
def subst_qts_by_quant_tvarS(T, qtS, variable):
    if T in qtS:
        tname = T[2]
        global quant_tvar_index
        variable += str(quant_tvar_index)
        var = ('var', ('variable', variable))
        quant_tvar_index += 1
        return ('tvar', tname, var)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (subst_qts_by_quant_tvarS(t, qtS, variable),)
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
get_everyS: tuple -> set
'''
def get_everyS(T):
    if T[0] == 'qt':
        if T[1][0] == 'every':
            return {T}
        else:
            return set()
    elif T[0] in housekeeper.lexemes:
        return set()
    else:
        S = set()
        for t in T[1:]:
            S |= get_everyS(t)
        return S

'''
get_someS: tuple -> set
'''
def get_someS(T):
    if T[0] == 'qt':
        if T[1][0] == 'some':
            return {T}
        else:
            return set()
    elif T[0] in housekeeper.lexemes:
        return set()
    else:
        S = set()
        for t in T[1:]:
            S |= get_someS(t)
        return S