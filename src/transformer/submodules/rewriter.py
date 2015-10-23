import sys
sys.path.insert(0, '../..')
import labels
import grounder
import normalizer

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
    grounded_tdecls = grounder.ground_tdecls(T['tdecls'])
    grounded_rules = grounder.ground_rules(T['rules'], grounded_tdecls)
    
    return {    'sdefs': rewrite_tdecls(T['tdecls']), 
                'rules': rewrite_rules(grounded_rules)}

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
    if T[0] in labels.lexemes:
        return T
    elif T[0] == 'sconstr':
        Dict = {}
        for tvar in T[2][1:]:
            vname = tvar[1]
            tname = tvar[2]
            Dict[vname] = tname
        terms = ['terms']
        for bt in T[1][2][1:]:
            vname = bt[1][1]
            tname = Dict[vname]
            terms += [['bt', ['sname', tname]]]
        fname = T[1][1]
        return ['sconstr', ['func', fname, terms]]
    elif T[0] in labels.set_ops:
        tr = T[:1]
        for t in T[1:]:
            tr += \
                [['sname', rewrite_tdecls(t)]] \
                    if t[0] == 'identifier' else \
                [rewrite_tdecls(t)]
        return tr
    elif T[0] == 'tdecl':
        tr = ['sdef', ['sname', rewrite_tdecls(T[1])]]
        tr += \
            [['sname', rewrite_tdecls(T[2])]] \
                if T[2][0] == 'identifier' else \
            [rewrite_tdecls(T[2])]
        return tr
    elif T[0] == 'tdecls':
        tr = ['sdefs']
        for t in T[1:]:
            tr += [rewrite_tdecls(t)]
        return tr
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += [rewrite_tdecls(t)]
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
    rewritten = ['rules']
    for t in T[1:]:
        List = tvars_to_satoms(t)
        t = reshape(t)
        if List != []:
            if t[0] == 'fact':
                t[0] = 'rule'
                body = List[0]
                for l in List[1:]:
                    body = ['conj', body, l]
                body = ['body', body]
                t += [body]
            else:
                for l in List:
                    t[2][1] = ['conj', t[2][1], l]
                    
        # normalizer start
        if t[0] == 'fact':
            disjs = normalizer.flatten(normalizer.normalize(t[1][1], 'CNF'), 'CNF')
            for disj in disjs:
                rewritten += [['fact', ['head', disj]]]
        else: # 'rule'
            disjs = normalizer.flatten(normalizer.normalize(t[1][1], 'CNF'), 'CNF')
            conjs = normalizer.flatten(normalizer.normalize(t[2][1], 'DNF'), 'DNF')
            for disj in disjs:
                for conj in conjs:
                    rewritten += [['rule', ['head', disj], ['body', conj]]]
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
    if T[0] in labels.lexemes:
        return []
    elif T[0] == 'tvar':
        sname = ['sname', T[1]]
        vname = T[2]
        return [['literal', ['satom', sname, vname]]]
    else:
        tr = []
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
    if type(T) == tuple:
        return T
    elif T[0] == 'tvar':
        return ['var', T[2]]
    elif T[0] in labels.comp_ops:
        return T
    elif T[0] == 'neg_class':
        return ['neg_class', reshape(T[1])]
    elif T[0] == 'rule':
        if len(T) == 2:
            return ['fact', ['head', reshape(T[1][1])]]
        else: # >= 3
            return ['rule', \
                    ['head', reshape(T[1][1])], \
                    ['body', reshape(T[2][1])]]
    
    else:
        tr = T[:1]
        for t in T[1:]:
            # print(t)
            tr += [reshape(t)]
        return tr
