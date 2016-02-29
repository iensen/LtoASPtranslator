'''
This module transforms an AST of an L program into an AST of an equivalent ASP program.

Beside calling submodules, *transformer* uses its own functions to 
do other tasks such as:
- converting L cardinality constraints into ASP body aggregates
- handling these special sections of an ASP program:
  - *sorts*
    - L types become ASP sorts
    - #type_termS is the union of the above sorts
    - #rule_termS contains evaluated terms collected from L rules
      - including subterms of functional terms
    - #prog_termS = #type_termS + #rule_termS
  - *predicates*
    - for example, declaring predicate p/2: p(#prog_termS, #prog_termS)
  - *display*
    - displaying only positive literals in answer sets
'''

########## ########## ########## ########## ########## ########## ########## ##########

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
    expanded_tdecls = evaluator.expand_tdecls(P['tdecls']) # tname_constSS
    P['rules'] = dequantifier.dequantify_rules(P['rules'], expanded_tdecls)
    P['rules'] = unconstrain_rules(P['rules'])
    P['tdecls'] = rewrite_tdecls(P['tdecls'])
    P['rules'] = reform_rules(P['rules'])
    P['rules'] = normalizer.normalize_rules(P['rules'])
    predS = get_predS(P['rules'], expanded_tdecls, {})
    P = combine_tdecls_in_prog(P, predS)
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
combine_tdecls_in_prog: prog * predS -> prog
'''
def combine_tdecls_in_prog(P, predS):
    tdecls = P['tdecls']
    pred_termS_tdeclS = get_pred_termS_tdeclS(predS) # set
    pred_termS_tdeclS = tuple(pred_termS_tdeclS)
    tdecls += pred_termS_tdeclS
    P['tdecls'] = tdecls
    return P
    
'''
get_pred_termS_tdeclS: {pname: (constS,...,constS),...} -> set(tdecl)
'''
def get_pred_termS_tdeclS(predS):
    tdeclS = set()
    for pname in predS:
        domain = predS[pname] # tuple(set)
        arity = len(domain)
        for ind in range(arity):
            tname = pname[1][1] + '_' + str(ind+1) + '_termS'
            tname = 'tname', ('id', tname)
            Set = domain[ind]
            Set = tuple(Set)
            Set = ('terms',) + Set
            Set = 'set', Set
            tdecl = 'tdecl', tname, Set
            tdeclS |= {tdecl}
    return tdeclS
    
########## ########## ########## ########## ########## ########## ########## ##########
    
'''
introduce_pdecls_via_predS: dict(pname: tuple(set)) -> tuple
'''
def introduce_pdecls_via_predS(D):
    tr = 'pdecls',
    for pname in D:
        arity = len(D[pname])
        pdecl = 'pdecl', pname
        if arity > 0:
            tnames = 'tnames',
            for ind in range(arity):
                tname = pname[1][1] + '_' + str(ind+1) + '_termS'
                tname = 'tname', ('id', tname)
                tnames += tname,
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
        arity = len(D[pname])
        if arity > 0:
            terms = 'terms',
            for ind in range(arity):
                tname = pname[1][1] + '_' + str(ind+1) + '_termS'
                tname = 'tname', ('id', tname)
                var = 'var', ('variable', 'CWA_Var_' + str(ind+1))
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
get_predS: tuple * tname_constSS * predS-> {pname: (constS,...,constS),...}
'''
def get_predS(T, tname_constSS, predS):
    if T[0] in housekeeper.lexemes:
        return {}
    elif T[0] == 'patom':
        pname = T[1]
        domain = ()
        if len(T) > 2:
            terms = T[2]
            for term in terms[1:]:
                evaluated_termS = evaluator.get_evaluated_termS(term, tname_constSS)
                domain += evaluated_termS,
        d = {pname: domain}
        return d
    else:
        D1 = {}
        for t in T[1:]:
            D2 = get_predS(t, tname_constSS, predS)
            D1 = housekeeper.union_dicts_of_tuples_of_sets(D1, D2)
        return D1
