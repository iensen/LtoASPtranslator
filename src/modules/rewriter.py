from . import arithmetizer
from . import constrainer
from . import grounder
from . import normalizer
from . import housekeeper

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
def rewrite(D):
    D = arithmetizer.demodularize(D)
    D = arithmetizer.replace(D)
    D = arithmetizer.eval(D)
    
    global g_tdecls
    g_tdecls = grounder.ground_tdecls(D['tdecls'])
    g_rules = grounder.ground_rules(D['rules'], g_tdecls)

    rewritten = {'sdefs': rewrite_tdecls(D['tdecls']), 'rules': rewrite_rules(g_rules)}
    return rewritten

########## ########## ########## ########## ########## ########## ########## ##########
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
        satoms = housekeeper.tvars_to_satoms(t)
        
        t = housekeeper.detype_vars(t)
        tuple1 = reshape(t)
        
        tuple2 = ()
        if satoms == ():
            tuple2 += tuple1
        else:
            if tuple1[0] == 'iconstr':
                tuple2 += 'iconstr',
                
                body = tuple1[1][1]
                for satom in satoms:
                    body = 'conj', body, satom
                body = 'body', body
                
                tuple2 += body,
            elif tuple1[0] == 'fact':
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
        if tuple2[0] == 'iconstr':
            conjs = normalizer.flatten(normalizer.normalize(tuple2[1][1], 'DNF'), 'DNF')
            for conj in conjs:
                rewritten += ('iconstr', ('body', conj)),
        elif tuple2[0] == 'fact':
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
reshape: reshape a parsed L rule with typed variables into a parsed ASP rule without corresponding sort atoms
(such atoms are generated separately by the function: housekeeper.tvars_to_satoms)

Input: a parsed L rule with typed variables:
['rule',...['patom',...['tvar', ('identifier', 't1'), ('variable', 'X1')],...]]

Output: a parsed ASP rule without corresponding sort atoms:
['fact',...['patom',...['var', ('variable', 'X1')],...]]

reshape: list -> list
'''
def reshape(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] == 'mlit':
        patom = reshape(T[1])
        head = 'head', ('disj', patom, ('neg_class', patom))
        return head
    elif T[0] == 'psent':
        return 'head', reshape(T[1])
    elif T[0] == 'sent':
        return 'body', reshape(T[1])
    elif T[0] == 'rule':
        if T[1][0] == 'cconstr':
            iconstr = constrainer.rule_to_iconstr(T)
            return reshape(iconstr)
        elif len(T) == 2:
            return 'fact', reshape(T[1])
        else: # >= 3
            return 'rule', reshape(T[1]), reshape(T[2])
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += reshape(t),
        return tr
