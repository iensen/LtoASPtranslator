from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
entype_prog: dict(str: tuple) <->
'''
def entype_prog(prog):
    tdecls = prog['tdecls'][1:]
    if tdecls != ():
        t_tdecls = ('tdecls',)
        for tdecl in tdecls:
            t_tdecls += (entype_tdecl(tdecl),)
        prog['tdecls'] = t_tdecls
    rules = prog['rules'][1:]
    if rules != ():
        t_rules = ('rules',)
        for rule in rules:
            t_rules += (entype_rule(rule),)
        prog['rules'] = t_rules
    return prog

########## ########## ########## ########## ########## ########## ########## ##########

'''
entype_tdecl: tuple <->
'''
def entype_tdecl(T):
    if T[0] == 'sconstr':
        return entype_sconstr(T)
    elif T[0] in housekeeper.lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (entype_tdecl(t),)
        return tr

'''
entype_sconstr: sconstr <->
'''
def entype_sconstr(sconstr):
    varts = sconstr[2]
    var_tnameS = get_var_tnameS_from_varts(varts)
    term = sconstr[1]
    term = entype_tuple_via_var_tnameS(term, var_tnameS)
    sconstr = ('sconstr', term)
    return sconstr

'''
get_var_tnameS_from_varts: varts -> dict(tuple: tuple)
'''
def get_var_tnameS_from_varts(varts):
    D = {}
    for vart in varts[1:]:
        var = vart[1]
        tname = vart[2]
        D[var] = tname
    return D

########## ########## ########## ########## ########## ########## ########## ##########

'''
entype_rule: rule <->
'''
def entype_rule(rule):
    var_tnameS = get_var_tnameS_in_tuple(rule)
    rule = entype_tuple_via_var_tnameS(rule, var_tnameS)
    return rule

'''
get_var_tnameS_in_tuple: tuple -> dict(tuple: tuple)
'''
def get_var_tnameS_in_tuple(T):
    if T[0] == 'tvar':
        tname = T[1]
        var = T[2]
        return {var: tname}
    elif T[0] in housekeeper.lexemes:
        return {}
    else:
        D = {}
        for t in T[1:]:
            d = get_var_tnameS_in_tuple(t)
            D.update(d)
        return D

'''
entype_tuple_via_var_tnameS: tuple * dict(var: tname) -> tuple
'''
def entype_tuple_via_var_tnameS(T, var_tnameS):
    if T[0] in housekeeper.lexemes | {'tvar'}:
        return T
    elif T[0] == 'var':
        tname = var_tnameS[T]
        tvar = ('tvar', tname, T)
        return tvar
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (entype_tuple_via_var_tnameS(t, var_tnameS),)
        return tr
        
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
detype_tuple: tuple -><
'''
def detype_tuple(T):
    if T[0] in housekeeper.lexemes | {'aggr'}:
        return T
    elif T[0] == 'tvar':
        return T[2]
    elif T[0] == 'tname':
        return tname_to_sname(T)
    elif T[0] in housekeeper.ruleForms:
        return detype_rule(T)
    else:
        root = T[0]
        tr =    ('sdefs',)  if root == 'tdecls' else \
                ('sdef',)   if root == 'tdecl' else \
                ('snames',) if root == 'tnames' else \
                T[:1]
        for t in T[1:]:
            tr += (detype_tuple(t),)
        return tr

'''
detype_rule: tuple -><
'''
def detype_rule(T):
    tvarS = housekeeper.get_tvarS_from_tuple(T) # set
    satomS = get_satomS_using_tvarS(tvarS) # set
    rule = T[:1]
    for t in T[1:]:
        rule += detype_tuple(t),
    if satomS != set():
        if rule[0] == 'iconstr':
            body = rule[1][1]
            for satom in satomS:
                body = 'conj', body, satom
            body = 'body', body
            rule = 'iconstr', body
        elif rule[0] == 'fact':
            satomS = tuple(satomS)
            body = satomS[0]
            for satom in satomS[1:]:
                body = 'conj', body, satom
            body = 'body', body
            rule = 'fullRule', rule[1], body
        else: # 'fullRule'
            body = rule[2][1]
            for satom in satomS:
                body = 'conj', body, satom
            body = 'body', body
            rule = 'fullRule', rule[1], body
    return rule

########## ########## ########## ########## ########## ########## ########## ##########

'''
get_satomS_using_tvarS: set <->
'''
def get_satomS_using_tvarS(tvarS):
    satomS = set()
    for tvar in tvarS:
        tname = tvar[1]
        sname = tname_to_sname(tname)
        var = tvar[2]
        satom = ('satom', sname, var)
        satomS |= {satom}
    return satomS

'''
tname_to_sname: tuple <->
'''
def tname_to_sname(T):
    sname = T[1][1] # str
    sname = ('pound_id', '#' + sname)
    sname = ('sname', sname)
    return sname
