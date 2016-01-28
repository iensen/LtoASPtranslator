import random

from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
dequantify_rules: tuple * tname_constSS -> tuple
'''
def dequantify_rules(T, D):
    if T[0] in housekeeper.ruleForms:
        global tvar_index
        tvar_index = 0
        head = T[1]
        if head[0] == 'psent':
            head = dequantify_psent(head, D)
        tr = (T[0], head)
        if T[0] == 'fullRule':
            sent = T[2]
            sent = dequantify_sent(sent, D)
            tr += (sent,)
        return tr
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += dequantify_rules(t, D),
        return tr
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
dequantify_psent: tuple * tname_constSS -> tuple
'''
def dequantify_psent(T, D):
    if T[0] == 'patom':
        return dequantify_patom_in_psent(T, D)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (dequantify_psent(t, D),)
        return tr

'''
dequantify_sent: tuple * tname_constSS -> tuple
'''
def dequantify_sent(T, D):
    if T[0] == 'patom':
        return dequantify_patom_in_sent(T, D)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (dequantify_sent(t, D),)
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
dequantify_patom_in_psent: tuple * tname_constSS -> tuple
'''
def dequantify_patom_in_psent(T, tname_constSS):
    everyS = get_everyS(T)
    someS = get_someS(T)
    if everyS == set() == someS:
        return T
    elif everyS != set(): # ?== someS
        T = qt_to_tvar_R(T, everyS, 'Every')
        return T
    else: # someS != set() ?== everyS
        S = get_dequantified_patoms(T, tname_constSS, 'some')
        patoms = tuple(S)
        tr = patoms[0]
        for patom in patoms[1:]:
            tr = ('disj', tr, patom)
        return tr
            
'''
dequantify_patom_in_sent: tuple * tname_constSS -> tuple
'''
def dequantify_patom_in_sent(T, tname_constSS):
    everyS = get_everyS(T)
    someS = get_someS(T)
    if everyS == set() == someS:
        return T
    elif everyS != set(): # ?== someS
        S = get_dequantified_patoms(T, tname_constSS, 'every')
        patoms = tuple(S)
        tr = patoms[0]
        for patom in patoms[1:]:
            tr = ('conj', tr, patom)
        return tr
    else: # someS != set() ?== everyS
        T = qt_to_tvar_R(T, someS, 'Some')
        return T
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
get_dequantified_patoms: tuple * tname_constSS * str -> set
'''
def get_dequantified_patoms(T, D, mode):
    qtS = get_everyS(T) if mode == 'every' else get_someS(T)
    if qtS == set():
        return {T}
    else:
        qt = random.sample(qtS, 1)[0]
        tname = qt[2]
        constS = D[tname] # set
        s = set()
        for const in constS:
            d = {qt: const}
            s |= {housekeeper.subbing_tuple(T, d)}
        S = set()
        for el in s:
            S |= get_dequantified_patoms(el, D, mode)
        return S

########## ########## ########## ########## ########## ########## ########## ##########

'''
qt_to_tvar_R: tuple * set * str -> tuple
'''
def qt_to_tvar_R(T, qtS, variable):
    if T in qtS:
        tname = T[2]
        global tvar_index
        variable += str(tvar_index)
        var = ('var', ('variable', variable))
        tvar_index += 1
        return ('tvar', tname, var)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (qt_to_tvar_R(t, qtS, variable),)
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
