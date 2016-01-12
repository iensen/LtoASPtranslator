from . import housekeeper
from . import typer
from . import evaluator
from . import dequantifier
from . import normalizer
'''
Input: a dictionary parsed L program
{'tdecls': ['tdecls', ['tdecl',...],...], 'rules': ['rules', ['rule',...],...]}

Output: an incomplete dictionary parsed ASP program:
{'tdecls': ['tdecls', ['tdecl',...],...], 'rules': ['rules', ['rule',...],...]}
    
transform: list -> dict
'''
def transform(P):
    P = ['prog'] + P
    P = housekeeper.list_to_dict(P)
    for k in P:
        P[k] = housekeeper.demodularize(P[k])
    P = housekeeper.subst_calculated_cnames(P)
    P['rules'] = qtLegacys_to_tvarS(P['rules'])
    P = typer.entype_prog(P)
    global expanded_tdecls
    expanded_tdecls = evaluator.expand_tdecls(P['tdecls'])
    P['rules'] = dequantifier.dequant_rules(P['rules'], expanded_tdecls)
    P['rules'] = aggr_rules(P['rules'])
    P['tdecls'] = rewrite_tdecls(P['tdecls'])
    P['rules'] = reform_rules(P['rules'])
    P['rules'] = normalizer.normalize_rules(P['rules'])
    P['tdecls'] = combine_tdecls(P)
    predS = get_predS(P['rules'])
    pdecls = introduce_pdecls(predS)
    pdecls = typer.detype_stmts(pdecls)
    CWAS = get_CWAS(predS)
    P['rules'] += tuple(CWAS)
    display = introduce_display(predS)
    sdefs = typer.detype_stmts(P['tdecls'])
    del P['tdecls']
    P['rules'] = typer.detype_stmts(P['rules'])
    P.update({'sdefs': sdefs, 'pdecls': pdecls, 'display': display})
    P = housekeeper.dict_to_list(P)
    return P
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
rewrite_tdecls: tuple -><
'''
def rewrite_tdecls(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'tdecl':
        tname = T[1]
        set_expr = T[2]
        if sconstr_in_set_expr(set_expr):
            terms = expanded_tdecls[tname] # set(tuple)
            set_expr = ('terms',) + tuple(terms)
            set_expr = 'set', set_expr
        else:
            set_expr = rewrite_tdecls(set_expr)
        tr = ('tdecl', tname, set_expr)
        return tr
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += rewrite_tdecls(t),
        return tr
        
'''
sconstr_in_set_expr: tuple -> bool
'''
def sconstr_in_set_expr(T):
    if T[0] in housekeeper.lexemes:
        return False
    elif T[0] == 'sconstr':
        return True
    else:
        for t in T[1:]:
            if sconstr_in_set_expr(t):
                return True
        return False
        
########## ########## ########## ########## ########## ########## ########## ##########
'''
qtLegacys_to_tvarS: From <every/some type Var> to <type Var>
ASP-like convention in L: <every> in head, <some> in sentence

qtLegacys_to_tvarS: tuple <->
'''
def qtLegacys_to_tvarS(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'qtLegacy':
        tname = T[2]
        var = T[3]
        tvar = ('tvar', tname, var)
        return tvar
    else:
        tr = T[0],
        for t in T[1:]:
            tr += qtLegacys_to_tvarS(t),
        return tr

'''
reform_rules: tuple <->
'''   
def reform_rules(T):
    if T[0] == 'iconstr':
        return T
    elif T[0] == 'fact':
        return ('fact', reform_head(T[1]))
    elif T[0] == 'fullRule':
        head = reform_head(T[1])
        body = ('body', T[2][1])
        return ('fullRule', head, body)
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += reform_rules(t),
        return tr
        
'''
reform_head: tuple <->
'''   
def reform_head(T):
    if T[0] == 'psent':
        return ('head', T[1])
    else: # 'mlit'
        patom = T[1]
        return ('head', ('disj', patom, ('strNeg', patom)))

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
aggr_rules: rules <->
'''
def aggr_rules(T):
    Tr = ('rules',)
    for rule in T[1:]:
        tr = rule
        if rule[1][0] == 'cconstr':
            tr = aggr_cconstr_rule(rule)
        Tr += (tr,)
    return Tr

'''
aggr_cconstr_rule: tuple <->
'''
def aggr_cconstr_rule(T):
    cconstr = T[1]
    b1 = cconstr[1]
    patom = cconstr[2]
    b2 = cconstr[3]
    
    aggr_tvarS = housekeeper.get_tvarS(patom) # set
    sent = None
    if T[0] == 'fullRule':
        sent = T[2]
        sent_tvarS = housekeeper.get_tvarS(sent) # set
        aggr_tvarS -= sent_tvarS
    aggr_satomS = typer.get_satomS_using_tvarS(aggr_tvarS)
    aggr_atoms = ('aggr_atoms', patom) + tuple(aggr_satomS)
    
    aggr_terms = 'aggr_terms', ('num', ('numeral', '0'))
    aggr_terms += tuple(aggr_tvarS)
    
    aggr_func = 'aggr_func', aggr_terms, aggr_atoms
    aggr_func = typer.detype_tvarS(aggr_func)
    
    aggr1 = 'aggr', b1, ('greater', '>'), aggr_func
    aggr2 = 'aggr', b2, ('less', '<'), aggr_func
    body = 'disj', aggr1, aggr2
    if sent != None:
        body = 'conj', body, sent[1]
    body = 'body', body
    iconstr = 'iconstr', body
    return iconstr
    
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
combine_tdecls: dict -> tuple
'''
def combine_tdecls(P):
    tr = P['tdecls']
    
    global added_tdecl_type_termS
    added_tdecl_type_termS = add_tdecl_type_termS(P['tdecls'])
    
    if added_tdecl_type_termS != ():
        tr += added_tdecl_type_termS,
        
    rule_termS = evaluator.get_evaluated_termS(P['rules'], expanded_tdecls)
    
    global added_tdecl_rule_termS
    added_tdecl_rule_termS = add_tdecl_rule_termS(rule_termS)

    if added_tdecl_rule_termS != ():
        tr += added_tdecl_rule_termS,
        
    added_tdecl_prog_termS = add_tdecl_prog_termS()
    if added_tdecl_prog_termS != ():
        tr += added_tdecl_prog_termS,
    return tr
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
Input: incomplete parsed ASP sort definitions:
['tdecls', ['tdecl',...],...]

Output: the parsed ASP sort definition of #types:
['tdecl', ['sname', ('id', 'types')], ['union', ['union',...],...]]

add_tdecl_type_termS: list -> list
'''
def add_tdecl_type_termS(T):
    if len(T) == 1:
        return ()
    else:
        tr = T[1][1]
        for t in T[2:]:
            tr = 'union', tr, t[1]
        tr = 'tdecl', ('tname', ('id', 'type_termS')), tr
        return tr

'''
Input: a set of tuple parsed ASP rule ground terms:
{('const',...), ('num',...), ('func',...),...}

Output: the parsed ASP sort definition of #rule_termS:
['tdecl', ['sname', ('id', 'rule_termS')],
    ['set', ['terms', ['const',...],...]]]
    
add_tdecl_rule_termS: set -> list
'''
def add_tdecl_rule_termS(S):
    if S == set():
        return ()
    else:
        tr = 'terms',
        for El in S:
            tr += El,
        tr = 'tdecl', ('tname', ('id', 'rule_termS')), ('set', tr)
        return tr

'''
Input: an incomplete dictionary parsed ASP program:
{'tdecls': ['tdecls', ['tdecl',...],...], 'rules': ['rules', ['rule',...],...]}

Output: the parsed ASP sort definition of #prog_termS:
['tdecl', ['sname', ('id', 'prog_termS')], ['union', 
    ['sname', ('id', 'types')], 
    ['sname', ('id', 'rule_termS')]]]
    
add_tdecl_prog_termS: dict -> list
'''
def add_tdecl_prog_termS():
    added_tdecls = (added_tdecl_type_termS, added_tdecl_rule_termS)
    tr = ()
    for added_tdecl in added_tdecls:
        if added_tdecl != ():
            tr += added_tdecl[1],
    if tr != ():
        if len(tr) == 1:
            tr = tr[0]
        else: # == 2
            tr = ('union',) + tr
        tr = 'tdecl', ('tname', ('id', 'prog_termS')), tr
    return tr
    
########## ########## ########## ########## ########## ########## ########## ##########
    
'''
Input: a set of found predS (pairs of predicate names and arities)
{('p0', 0), ('p1', 1), ('p2', 2),...}

Output: parsed ASP predicate declarations:
['pdecls', 
    ['pdecl', ('id', 'p0')], 
    ['pdecl', ('id', 'p1'), 
        ['snames', ['sname', ('id', 'prog_termS')]]],...]
        
introduce_pdecls: dict(pname: int) -> tuple
'''
def introduce_pdecls(D):
    tr = 'pdecls',
    for pname in D:
        arity = D[pname]
        pdecl = 'pdecl', pname
        if arity > 0:
            tnames = 'tnames',
            for i in range(arity):
                tnames += ('tname', ('id', 'prog_termS')),
            pdecl += tnames,
        tr += pdecl,
    return tr
'''
get_CWAS: dict(pname: int) -> set(tuple)
'''
def get_CWAS(D):
    rules = set()
    for pname in D:
        patom = 'patom', pname
        arity = D[pname]
        if arity > 0:
            terms = 'terms',
            for i in range(arity):
                tname = 'tname', ('id', 'prog_termS')
                var = 'var', ('variable', 'CWA' + str(i))
                tvar = 'tvar', tname, var
                terms += tvar,
            patom += terms,
        head = 'strNeg', patom
        head = 'head', head
        body = 'defNeg', patom
        body = 'body', body
        rule = 'fullRule', head, body
        rules |= {rule}
    return rules
    
'''
introduce_display: dict(pname: int) -> tuple
'''
def introduce_display(D):
    display = 'display',
    for pname in D:
        display += pname,
    return display

'''
Input: parsed ASP rules:
['rules', ['fact', ['head', ['disj', 
    [...['patom', ('id', 'p0')]], 
    [...['patom', ('id', 'p1'), 
        ['terms,...]]]]]],...]
        
Output: a set of pairs of predicate names and arities:
{('p0', 0), ('p1', 1),...}

get_predS: list -> set
'''
def get_predS(T):
    if T[0] in housekeeper.lexemes:
        return {}
    elif T[0] == 'patom':
        pname = T[1]
        if len(T) == 2:
            arity = 0
        else:
            arity = len(T[2]) - 1
        return {pname: arity}
    else:
        D = {}
        for t in T[1:]:
            D.update(get_predS(t))
        return D
