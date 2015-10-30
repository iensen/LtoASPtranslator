import sys
sys.path.insert(0, 'modules')

import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
ground_tdecls: tuple -> dict(str: set(tuple))
'''
def ground_tdecls(T):
    Dict = {}
    tdecls = T[1:]
    for tdecl in tdecls:
        entry = ground_tdecl(tdecl, Dict)
        Dict.update(entry)
    return Dict

'''
ground_tdecl: tuple * dict(str: set) -> dict(str: set)
'''
def ground_tdecl(T, D):
    set_expr = T[2]
    Set = ground_set_expr(set_expr, D)
    tname = T[1][1]
    D[tname] = Set
    return D

'''
ground_set_expr: tuple * dict -> set
'''
def ground_set_expr(T, D):
    if T[0] == 'sconstr':
        tr = sconstr_to_set(T, D)
        return ground_set_expr(tr, D)
    elif T[0] == 'set':
        Set = set()
        gterms = T[1][1:]
        for gterm in gterms:
            Set |= {gterm}
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
    else: # 'diff'
        return ground_set_expr(T[1], D) - ground_set_expr(T[2], D)
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
sconstr_to_set: tuple * dict(str: set(tuple)) -> tuple
'''
def sconstr_to_set(T, type_sets):
    var_sets = {}
    tvars = T[2][1:]
    for tvar in tvars:
        vname = tvar[1][1]
        tname = tvar[2][1]
        Set = type_sets[tname]
        var_sets[vname] = Set
    bterm = T[1]
    g_bterms = ground_bterm(bterm, var_sets)
    gterms = ('gterms',) + tuple(g_bterms)
    tr = ('set', gterms)
    return tr

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
ground_bterms: tuple * dict -> set(tuple)
'''
def ground_bterms(T, D):
    if bterms_is_ground(T):
        return {T}
    else:
        g_btermss = set()
        next_btermss = ground1_bterms(T, D)
        for next_bterms in next_btermss:
            g_btermss |= ground_bterms(next_bterms, D)
        return g_btermss

'''
ground1_bterms: tuple * dict -> set(tuple)
'''
def ground1_bterms(T, D):
    next_btermss = set()
    for i in range(1, len(T)):
        bterm = T[i]
        if not bterm_is_ground(bterm):
            g_bterms = ground_bterm(bterm, D)
            for g_bterm in g_bterms:
                next_bterms = T[:i] + (g_bterm,) + T[i+1:]
                next_btermss |= {next_bterms}
            return next_btermss

'''
ground_bterm: tuple * dict -> set(tuple)
'''
def ground_bterm(T, D):
    if T[0] == 'func':
        return ground_bfunc(T, D)
    elif T[0] == 'var':
        vname = T[1][1]
        Set = D[vname]
        return Set
    else: # in housekeeper.bterms
        return {T}

'''
ground_bfunc: tuple * dict(str: set(tuple)) -> set(tuple)
'''
def ground_bfunc(T, D):
    g_bfuncs = set()
    bterms = T[2]
    g_btermss = ground_bterms(bterms, D)
    for g_bterms in g_btermss:
        g_bfunc = T[:2] + (g_bterms,)
        g_bfuncs |= {g_bfunc}
    return g_bfuncs

########## ########## ########## ########## ########## ########## ########## ##########

'''
bterms_is_ground: tuple -> bool
'''
def bterms_is_ground(T):
    bterms = T[1:]
    for bterm in bterms:
        gr = bterm_is_ground(bterm)
        if not gr:
            return False
    return True

'''
bterm_is_ground: tuple -> bool
'''
def bterm_is_ground(T):
    if T[0] == 'var':
        return False
    elif T[0] == 'func':
        return bfunc_is_ground(T)
    else: # in {'ar_term', 'const', 'num'}
        return True

'''
bfunc_is_ground: tuple -> bool
'''
def bfunc_is_ground(T):
    sub_bfuncs = []
    bterms = T[2][1:]
    for bterm in bterms:
        if bterm[0] == 'var':
            return False
        elif bterm[0] == 'func':
            sub_bfuncs += [bterm]
    for sub_bfunc in sub_bfuncs:
        gr = bfunc_is_ground(sub_bfunc)
        if not gr:
            return False
    return True

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
ground_rules: tuple * dict -> tuple
'''
def ground_rules(T, D):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'patom':
        return ground_patom(T, D)
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (ground_rules(t, D),)
        return tr

'''
ground_patom: tuple * dict -> tuple
'''
def ground_patom(T, D):
    quant = quant_patom(T)
    if quant == 'basic':
        return T
    else:
        conn = 'conj' if quant == 'universal' else 'disj'
        header = T[:2]
        terms = T[2]
        g_termss = tuple(ground_terms(terms, D))
        
        g_terms_0 = g_termss[0]
        patom_0 = header + (g_terms_0,)
        tr = patom_0
        for g_terms in g_termss[1:]:
            g_terms_i = g_terms
            patom_i = header + (g_terms_i,)
            tr = [conn, tr, patom_i]
            
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
ground_terms: tuple * dict -> set(tuple)
'''
def ground_terms(T, D):
    if quant_terms(T) == 'basic':
        return {T}
    else:
        g_termss = set()
        next_termss = ground1_terms(T, D)
        for next_terms in next_termss:
            g_termss |= ground_terms(next_terms, D)
        return g_termss

'''
ground1_terms: tuple * dict -> set(tuple)
'''
def ground1_terms(T, D):
    next_termss = set()
    for i in range(1, len(T)):
        term = T[i]
        if quant_term(term) != 'basic':
            g_terms = ground_term(term, D)
            for g_term in g_terms:
                next_terms = T[:i] + (g_term,) + T[i+1:]
                next_termss |= {next_terms}
            return next_termss

'''
ground_term: tuple * dict -> set(tuple)
'''
def ground_term(T, D):
    if T[0] == 'func':
        return ground_func(T, D)
    elif T[0] == 'qt':
        tname = T[2][1]
        Set = D[tname]
        return Set
    else: # in housekeeper.terms
        return {T}

'''
ground_func: tuple * dict(str: set(tuple)) -> set(tuple)
'''
def ground_func(T, D):
    g_funcs = set()
    terms = T[2]
    g_termss = ground_terms(terms, D)
    for g_terms in g_termss:
        g_func = T[:2] + (g_terms,)
        g_funcs |= {g_func}
    return g_funcs

########## ########## ########## ########## ########## ########## ########## ##########

'''
quant_patom: tuple -> str
'''
def quant_patom(T):
    if len(T) == 2:
        return 'basic'
    else: # >= 3
        terms = T[2]
        return quant_terms(terms)
        
'''
quant_terms: tuple -> str
'''
def quant_terms(T):
    terms = T[1:]
    for term in terms:
        quant = quant_term(term)
        if quant != 'basic':
            return quant
    return 'basic'

'''
quant_term: tuple -> str
'''
def quant_term(T):
    if T[0] == 'qt':
        if T[1][0] == 'every':
            return 'universal'
        else: # 'some'
            return 'existential'
    elif T[0] == 'func':
        return quant_func(T)
    else: # in housekeeper.basic_terms
        return 'basic'

'''
quant_func: tuple -> str
'''
def quant_func(T):
    sub_funcs = []
    terms = T[2][1:]
    for term in terms:
        if term[0] == 'qt':
            return quant_term(term)
        elif term[0] == 'func':
            sub_funcs += [term]
    for sub_func in sub_funcs:
        quant = quant_func(sub_func)
        if quant != 'basic':
            return quant
    return 'basic'
      
########## ########## ########## ########## ########## ########## ########## ##########
