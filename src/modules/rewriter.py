import grounder
import normalizer

import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
rewrite: rewrite a dictionary parsed L program into an incomplete dictionary parsed ASP program
(The "ASP program" is incomplete because it lacks of: (1) the sort definition of #rule_gterms; and (2) predicate declarations.)

Input: a dictionary parsed L program
{'tdecls': ['tdecls', ['tdecl',...],...], 'rules': ['rules', ['rule',...],...]}

Output: an incomplete dictionary parsed ASP program:
{'sdefs': ['sdefs', ['sdef',...],...], 'rules': ['rules', ['rule',...],...]}
    
rewrite: dict -> dict
'''
def rewrite(T):
    e_cdecls = eval_cdecls(T['cdecls']) # dict
    e_tdecls = eval_tdecls(T['tdecls'], e_cdecls)

    global g_tdecls
    g_tdecls = grounder.ground_tdecls(e_tdecls)
    g_rules = grounder.ground_rules((T['rules']), g_tdecls)
                
    rewritten = {   'cdefs': rewrite_cdecls(T['cdecls']),
                    'sdefs': rewrite_tdecls(e_tdecls), 
                    'rules': rewrite_rules(g_rules)}
    return rewritten

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
eval_tdecls: tuple * dict(str: int) -> tuple
'''
def eval_tdecls(T, D):
    if T[0] == 'identifier':
        key = T[1]
        if key in D:
            val = str(D[key])
            val = 'numeral', val
            return val
        else:
            return T
    else:
        tuple1 = T[:1]
        for t in T[1:]:
            tuple1 += eval_tdecls(t, D),
        return tuple1

'''
rewrite_cdecls: list -> list
'''
def rewrite_cdecls(T):
    tr = 'cdefs',
    dict1 = eval_cdecls(T)
    for key in dict1:
        cname = ('identifier', key)
        val = ('numeral', str(dict1[key]))
        tr += ('cdef', cname, val),
    return tr
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
eval_cdecls: tuple -> dict(str: int)
'''
def eval_cdecls(T):
    dict1 = {}
    cdecls = T[1:]
    for cdecl in cdecls:
        dict2 = eval_cdecl(cdecl, dict1)
        dict1.update(dict2)
    return dict1
    
'''
eval_cdecl: tuple * dict -> dict
'''
def eval_cdecl(T, D):
    cname = T[1][1]
    val = eval_gar_term(T[2], D)
    return {cname: val}
    
'''
eval_gar_term: tuple * dict -> int
'''
def eval_gar_term(T, D):
    if T[0] in {'gar_term', 'sum', 'product'}:
        operand1 = eval_gar_term(T[1], D)
        infix = T[2][1]
        operand2 = eval_gar_term(T[3], D)
        if infix == '+':
            return operand1 + operand2
        elif infix == '-':
            return operand1 - operand2
        elif infix == '*':
            return operand1 * operand2
        elif infix == '/':
            return operand1 // operand2
        elif infix == '%':
            return operand1 % operand2
    elif T[0] == 'identifier':
        return D[T[1]]
    else: # 'numeral'
        return int(T[1])

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
rewrite_tdecls: rewrite parsed L type declarations into incomplete parsed ASP sort definitions
(These "ASP sort definitions" are incomplete since they exclude the sort definition of #rule_gterms.)

Input: parsed L type declarations:
['tdecls', ['tdecl',...],...]

Output: incomplete parsed ASP sort definitions:
['sdefs', ['sdef',...],...]

rewrite_tdecls: list -> list
'''
def rewrite_tdecls(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'sconstr':
        Tuple = grounder.sconstr_to_set(T, g_tdecls)
        return Tuple
    elif T[0] in housekeeper.set_ops:
        tr = T[:1]
        for t in T[1:]:
            operand = rewrite_tdecls(t)
            if t[0] == 'identifier':
                operand = 'sname', operand
            tr += operand,
        return tr
    elif T[0] == 'tdecl':
        tr = 'sdef',
        sname = 'sname', rewrite_tdecls(T[1])
        
        set_expr = rewrite_tdecls(T[2])
        if T[2][0] == 'identifier':
            set_expr = 'sname', set_expr
        
        tr += sname, set_expr
        return tr
    else:
        tr =    ('sdefs',) if T[0] == 'tdecls' else \
                T[:1]
        for t in T[1:]:
            tr += rewrite_tdecls(t),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
rewrite_rules: rewrite parsed L rules into parsed ASP rules

Input: parsed L rules:
['rules', ['rule', ['sent',...]],...]

Output: parsed ASP rules:
['rules', ['fact', ['head',...]],...]

rewrite_rules: list -> list
'''
def rewrite_rules(T):
    rewritten = 'rules',
    for t in T[1:]:
        satoms = tvars_to_satoms(t)
        tuple1 = reshape(t)
        
        tuple2 = ()
        if satoms == ():
            tuple2 += tuple1
        else:
            if tuple1[0] == 'fact':
                tuple2 += 'rule', tuple1[1]
                
                body = satoms[0]
                for satom in satoms[1:]:
                    body = 'conj', body, satom
                body = 'body', body
                
                tuple2 += body,
            else: # 'rule'
                tuple2 += tuple1[:2]
                
                body = tuple1[2][1]
                for satom in satoms:
                    body = 'conj', body, satom
                body = 'body', body
                
                tuple2 += body,
                
        # normalizer start
        if tuple2[0] == 'fact':
            disjs = normalizer.flatten(normalizer.normalize(tuple2[1][1], 'CNF'), 'CNF')
            for disj in disjs:
                rewritten += ('fact', ('head', disj)),
        else: # 'rule'
            disjs = normalizer.flatten(normalizer.normalize(tuple2[1][1], 'CNF'), 'CNF')
            conjs = normalizer.flatten(normalizer.normalize(tuple2[2][1], 'DNF'), 'DNF')
            for disj in disjs:
                for conj in conjs:
                    rewritten += ('rule', ('head', disj), ('body', conj)),
        # normalizer end
        
    return rewritten

########## ########## ########## ########## ########## ########## ########## ##########

'''
tvars_to_satoms: from typed variables of a parsed L rule, return corresponding ASP sort atoms

Input: a parsed L rule with typed variables:
['rule',...['literal', ['patom',...,['terms', ['bt', ['tvar', ('identifier', t1), ('variable', 'X1')]],...]]],...]

Output: corresponding ASP sort atoms:
[['literal', ['satom', ['sname', ('identifier', 't1')], ('variable', 'X1')]],...]

tvars_to_satoms: list -> list
'''
def tvars_to_satoms(T):
    if T[0] in housekeeper.lexemes:
        return ()
    elif T[0] == 'tvar':
        sname = 'sname', T[1]
        vname = T[2]
        tr = ('satom', sname, vname),
        return tr
    else:
        tr = ()
        for t in T[1:]:
            tr += tvars_to_satoms(t)
        return tr
    
'''
reshape: reshape a parsed L rule with typed variables into a parsed ASP rule without corresponding sort atoms
(such atoms are generated separately by the function: tvars_to_satoms)

Input: a parsed L rule with typed variables:
['rule',...['patom',...['tvar', ('identifier', 't1'), ('variable', 'X1')],...]]

Output: a parsed ASP rule without corresponding sort atoms:
['fact',...['patom',...['var', ('variable', 'X1')],...]]

reshape: list -> list
'''
def reshape(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'tvar':
        return 'var', T[2]
    elif T[0] == 'mlit':
        patom = reshape(T[1])
        head = 'head', ('disj', patom, ('neg_class', patom))
        return head
    elif T[0] == 'psent':
        return 'head', reshape(T[1])
    elif T[0] == 'sent':
        return 'body', reshape(T[1])
    elif T[0] == 'rule':
        if len(T) == 2:
            return 'fact', reshape(T[1])
        else: # >= 3
            return 'rule', reshape(T[1]), reshape(T[2])
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += reshape(t),
        return tr
