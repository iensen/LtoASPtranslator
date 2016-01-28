from . import housekeeper
from . import typer
from . import evaluator
from . import dequantifier
from . import normalizer

########## ########## ########## ########## ########## ########## ########## ##########

'''
transform: list -><
'''
def transform(P):
    P = housekeeper.list_to_dict(P)
    P = housekeeper.demodularize_prog(P)
    P = housekeeper.subbing_calculated_cnames_in_prog(P)
    P['rules'] = qtLegacy_to_tvar_R(P['rules'])
    P = typer.entype_prog(P)
    global expanded_tdecls
    expanded_tdecls = evaluator.expand_tdecls(P['tdecls'])
    P['rules'] = dequantifier.dequantify_rules(P['rules'], expanded_tdecls)
    P['rules'] = unconstrain_rules(P['rules'])
    P['tdecls'] = rewrite_tdecls(P['tdecls'])
    P['rules'] = reform_rules(P['rules'])
    P['rules'] = normalizer.normalize_rules(P['rules'])
    P['tdecls'] = combine_tdecls_in_prog(P)
    predS = get_predS(P['rules'])
    pdecls = introduce_pdecls_via_predS(predS)
    pdecls = typer.detype_tuple(pdecls)
    CWAS = get_CWAS_via_predS(predS)
    P['rules'] += tuple(CWAS)
    display = introduce_display(predS)
    sdefs = typer.detype_tuple(P['tdecls'])
    del P['tdecls']
    P['rules'] = typer.detype_tuple(P['rules'])
    P.update({'sdefs': sdefs, 'pdecls': pdecls, 'display': display})
    P = housekeeper.dict_to_list(P)
    return P
    
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
qtLegacy_to_tvar_R: From <every/some type Var> to <type Var>
ASP-like convention in L: <every> in predicate sentence, <some> in sentence

qtLegacy_to_tvar_R: tuple <->
'''
def qtLegacy_to_tvar_R(T):
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
            tr += qtLegacy_to_tvar_R(t),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

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

'''
unconstrain_rules: rules <->
'''
def unconstrain_rules(T):
    Tr = ('rules',)
    for rule in T[1:]:
        if rule[1][0] == 'cconstr':
            rule = unconstrain_cconstr_rule(rule)
        Tr += (rule,)
    return Tr

'''
unconstrain_cconstr_rule: tuple <->
'''
def unconstrain_cconstr_rule(T):
    cconstr = T[1]
    b1 = cconstr[1]
    patom = cconstr[2]
    b2 = cconstr[3]
    
    aggr_tvarS = housekeeper.get_tvarS_from_tuple(patom) # set
    sent = None
    if T[0] == 'fullRule':
        sent = T[2]
        sent_tvarS = housekeeper.get_tvarS_from_tuple(sent) # set
        aggr_tvarS -= sent_tvarS
    aggr_satomS = typer.get_satomS_using_tvarS(aggr_tvarS)
    aggr_atoms = ('aggr_atoms', patom) + tuple(aggr_satomS)
    
    aggr_terms = 'aggr_terms', ('num', ('numeral', '0'))
    aggr_terms += tuple(aggr_tvarS)
    
    aggr_func = 'aggr_func', aggr_terms, aggr_atoms
    aggr_func = typer.detype_tuple(aggr_func)
    
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
combine_tdecls_in_prog: dict -> tuple
'''
def combine_tdecls_in_prog(P):
    tdecls = P['tdecls']
    tr = tdecls
    
    global added_tdecl_type_termS
    added_tdecl_type_termS = add_tdecl_type_termS_via_tdecls(tdecls)
    if added_tdecl_type_termS != ():
        tr += added_tdecl_type_termS,
        
    constS = evaluator.get_evaluated_termS_in_tuple(P['rules'], expanded_tdecls)
    global added_tdecl_rule_termS
    added_tdecl_rule_termS = add_tdecl_rule_termS_via_constS(constS)
    if added_tdecl_rule_termS != ():
        tr += added_tdecl_rule_termS,
        
    added_tdecl_prog_termS = add_tdecl_prog_termS()
    if added_tdecl_prog_termS != ():
        tr += added_tdecl_prog_termS,
    
    return tr
    
'''
add_tdecl_type_termS_via_tdecls: tdecls -> tuple
'''
def add_tdecl_type_termS_via_tdecls(T):
    if len(T) == 1:
        return ()
    else:
        tr = T[1][1]
        for t in T[2:]:
            tr = 'union', tr, t[1]
        tr = 'tdecl', ('tname', ('id', 'type_termS')), tr
        return tr

'''
add_tdecl_rule_termS_via_constS: set -> tuple
'''
def add_tdecl_rule_termS_via_constS(S):
    if S == set():
        return ()
    else:
        tr = 'terms',
        for El in S:
            tr += El,
        tr = 'tdecl', ('tname', ('id', 'rule_termS')), ('set', tr)
        return tr

'''
add_tdecl_prog_termS: void -> tuple
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
introduce_pdecls_via_predS: dict(pname: int) -> tuple
'''
def introduce_pdecls_via_predS(D):
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
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
get_CWAS_via_predS: dict(pname: int) -> set(tuple)
'''
def get_CWAS_via_predS(D):
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
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
introduce_display: dict(pname: int) -> tuple
'''
def introduce_display(D):
    display = 'display',
    for pname in D:
        display += pname,
    return display

########## ########## ########## ########## ########## ########## ########## ##########

'''
get_predS: tuple -> dict(tuple: int)
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
