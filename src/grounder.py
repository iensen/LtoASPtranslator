import random

import sys
sys.path.insert(0, 'transformer/submodules')

from reassembler import *
########## ########## ########## ########## ########## ########## ########## ##########

'''
mode_patom: list -> str
'''
def mode_patom(T):
    if len(T) == 2:
        return 'basic'
    else: # >= 3
        for term in T[2][1:]:
            if term[0] == 'qt':
                if term[1][0] == 'every':
                    return 'universal'
                else: # 'some'
                    return 'existential'
        return 'basic'
########## ########## ########## ########## ########## ########## ########## ##########
'''
ground_rules: list * dict -> list
'''
def ground_rules(T, D):
    # print(T)
    tr = T[:1]
    for t in T[1:]:
        tr += [ground_rule(t, D)]
    # print(tr)
    return tr

'''
ground_rule: list * dict(str: set) -> list
'''
def ground_rule(T, D):
    # print(T)
    tr = ['rule']
    head = ground_sent(T[1], D, 'existential')
    # print(head)
    tr += [head[0]]
    satoms = head[1]
    
    if len(T) == 3:
        body = ground_sent(T[2], D, 'universal')
        tr += [body[0]]
        satoms += body[1]
    
    if satoms != []:
        # print(satoms)
        if len(T) == 2:
            body = satoms[0]
            for satom in satoms[1:]:
                body = ['conj', body, satom]
            body = ['sent', body]
            tr += [body]
        else: # >= 3
            for satom in satoms:
                tr[2][1] = ['conj', tr[2][1], satom]
    # print(tr)
    return tr
    
'''
ground_sent: list * dict * str -> list * list
'''
def ground_sent(T, D, mode):
    # print(T)
    if type(T) == tuple:
        return (T, [])
    elif T[0] == 'patom':
        # print(T)
        # print(ground_patom(T, D, mode))
        return ground_patom(T, D, mode)
    else:
        # print(T)
        tr = T[:1]
        satoms = []
        for t in T[1:]:
            # print(t)
            grounded = ground_sent(t, D, mode)
            tr += [grounded[0]]
            satoms += grounded[1]
            # print(ground_sent(t, D, mode))
        # print(satoms)
        return (tr, satoms)
var_num = 0
'''
ground_patom: list * dict(str: set) * str -> list * list
'''
def ground_patom(T, D, mode):
    # print(T)
    if mode_patom(T) == 'basic':
        return (T, [])
    elif mode_patom(T) == mode:
        sets = []
        terms = T[2][1:]
        for term in terms:
            if term[0] == 'bt':
                sets += [{list_to_tuple(term[1])}]
            else: # 'qt'
                quantifier = term[1][0]
                tname = term[2][1]
                sets += [D[tname]]
        groundings = list(C_prod(sets))
        for i in range(len(groundings)): # grounding
            groundings[i] = list(groundings[i])
            for j in range(len(groundings[i])): # term
                groundings[i][j] = tuple_to_list(groundings[i][j])
                groundings[i][j] = ['bt', groundings[i][j]]
        terms = ['terms'] + groundings[0]
        tr = T[:2] + [terms]
        for grounding in groundings[1:]:
            terms = ['terms'] + grounding
            patom = T[:2] + [terms]
            set_op = 'conj' if quantifier == 'every' else 'disj'
            tr = [set_op, tr, patom]
        return (tr, [])
    else:
        tr = ['terms']
        satoms = []
        terms = T[2][1:]
        for term in terms:
            if term[0] == 'qt':
                tname = term[2]
                sname = ['sname', tname]
                
                global var_num
                var_num += 1
                vname = 'AutoVar' + str(var_num)
                vname = ('variable', vname)

                satom = ['satom', sname, vname]
                satoms += [satom]
                ###################
                bt = ['bt', ['var', vname]]
                tr += [bt]
            else: # 'bt'
                tr += [term]
        tr = T[:2] + [tr]
        # print((tr, satoms), '\n')
        return (tr, satoms)
                
                    
########## ########## ########## ########## ########## ########## ########## ##########
'''
ground_tdecls: list -> dict(str: set)
'''
def ground_tdecls(T):
    Dict = {}
    tdecls = T[1:]
    for tdecl in tdecls:
        Dict = ground_tdecl(tdecl, Dict)
    return Dict
'''
ground_tdecl: list * dict(str: set) -> dict(str: set)
'''
def ground_tdecl(T, D):
    
    set_expr = T[2]
    Set = ground_set_expr(set_expr, D)
    tname = T[1][1]
    D[tname] = Set
    return D
    
'''
ground_set_expr: list * dict(str: set) -> set
'''
def ground_set_expr(T, D):
    if T[0] == 'set':
        Set = set()
        gterms = T[1][1:]
        for gterm in gterms:
            Set |= {list_to_tuple(gterm)}
        return Set
    elif T[0] == 'range':
        Set = set()
        l = int(T[1][1])
        r = int(T[2][1])
        for i in range(l, r + 1):
            Set |= {('num', ('numeral', str(i)))}
        return Set
    elif T[0] == 'identifier':
        tname = T[1]
        return D[tname]
    elif T[0] == 'union':
        return ground_set_expr(T[1], D) | ground_set_expr(T[2], D)
    elif T[0] == 'inters':
        return ground_set_expr(T[1], D) & ground_set_expr(T[2], D)
    elif T[0] == 'diff':
        return ground_set_expr(T[1], D) - ground_set_expr(T[2], D)
    else: # 'sconstr'
        var_sets = {}
        tvars = T[2][1:]
        for tvar in tvars:
            vname = tvar[1][1]
            tname = tvar[2][1]
            var_sets[vname] = D[tname]
        sets = []
        terms = T[1][2][1:]
        for bt in terms:
            if bt[1][0] == 'var':
                var = bt[1][1][1]
                sets += [var_sets[var]]
        Set = set()
        groundings = C_prod(sets)
        for grounding in groundings:
            gterms = ('gterms',) + grounding
            fname = T[1][1]
            func = ('func', fname, gterms)
            Set |= {func}
        return Set

            
########## ########## ########## ########## ########## ########## ########## ##########


'''
C_prod: list(set) -> set(tuple)
'''
def C_prod(L):
    if len(L) == 1:
        Set = set()
        for m in L[0]:
            Set |= {(m,)}
        return Set
    elif len(L) == 2:
        Set = set()
        for m0 in L[0]:
            for m1 in L[1]:
                if type(m0) == tuple == type(m0[0]):
                    Tuple = m0 + (m1,)
                else:
                    Tuple = (m0, m1)
                Set |= {Tuple}
        return Set
    else:
        return C_prod([C_prod(L[:2])] + L[2:])
########## ########## ########## ########## ########## ########## ########## ##########

