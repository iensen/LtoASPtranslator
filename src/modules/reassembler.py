import grounder

import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
reassemble: reassemble an incomplete dictionary parsed ASP program into a dictionary parsed ASP program
(The "ASP program" is now complete with: (1) the added sort definition of #rule_gterms; and (2) introduced predicate declarations.)

Input: an incomplete dictionary parsed ASP program:
{'sdefs': ['sdefs', ['sdef',...],...], 'rules': ['rules', ['rule',...],...]}

Output: a dictionary parsed ASP program:
{
    'sdefs': ['sdefs', ['sdef',...],...],
    'pdecls': ['pdecls', ['pdecl',...],...],
    'rules': ['rules', ['rule',...],...]}

reassemble: dict -> dict
'''
def reassemble(T):
    return {    'cdefs': T['cdefs'],
                'sdefs': combine_sdefs(T), 
                'pdecls': introduce_pdecls(find_predicates(T['rules'])), 
                'rules': T['rules']}

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
combine_sdefs: combine the definitions of: (1) defined sorts rewritten from declared types; with (2) the added sorts #types, #rule_gterms, and #universal

Input: an incomplete dictionary parsed ASP program:
{'sdefs': ['sdefs', ['sdef',...],...], 'rules': ['rules', ['rule',...],...]}

Output: parsed ASP sort definitions:
['sdefs', 
    ['sdef',...],...,
    ['sdef', ['sname', ('identifier', 'types')],...],
    ['sdef', ['sname', ('identifier', 'rule_gterms')],...],
    ['sdef', ['sname', ('identifier', 'universal')],...]]
    
combine_sdefs: dict -> list
'''
def combine_sdefs(T):
    tr = 'sdefs',
    for t in T['sdefs'][1:]:
        tr += t,
    types = add_sdef_types(T['sdefs'])
    if types != ():
        tr += types,
    rule_gterms = add_sdef_rule_gterms(extract_rule_gterms(T['rules']))
    if rule_gterms != ():
        tr += rule_gterms,
    universal = add_sdef_universal(T)
    if universal != ():
        tr += universal,
    return tr
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
add_sdef_types: add the sort definition of #types, which is the union of defined sorts rewritten from declared types

Input: incomplete parsed ASP sort definitions:
['sdefs', ['sdef',...],...]

Output: the parsed ASP sort definition of #types:
['sdef', ['sname', ('identifier', 'types')], ['union', ['union',...],...]]

add_sdef_types: list -> list
'''
def add_sdef_types(T):
    if len(T) == 1:
        return ()
    else:
        tr = T[1][1]
        for t in T[2:]:
            tr = 'union', tr, t[1]
        tr = 'sdef', ('sname', ('identifier', 'types')), tr
        return tr

'''
add_sdef_rule_gterms: add the sort definition of #rule_gterms, whose members are ground terms extracted from rules

Input: a set of tuple parsed ASP rule ground terms:
{('const',...), ('num',...), ('func',...),...}

Output: the parsed ASP sort definition of #rule_gterms:
['sdef', ['sname', ('identifier', 'rule_gterms')],
    ['set', ['gterms', ['const',...],...]]]
    
add_sdef_rule_gterms: set -> list
'''
def add_sdef_rule_gterms(T):
    if T == set():
        return ()
    else:
        tr = 'gterms',
        for t in T:
            tr += t,
        tr = 'sdef', ('sname', ('identifier', 'rule_gterms')), ('set', tr)
        return tr

'''
add_sdef_universal: add the sort definition of #universal, which is the union of the sorts #types and #rule_gterms

Input: an incomplete dictionary parsed ASP program:
{'sdefs': ['sdefs', ['sdef',...],...], 'rules': ['rules', ['rule',...],...]}

Output: the parsed ASP sort definition of #universal:
['sdef', ['sname', ('identifier', 'universal')], ['union', 
    ['sname', ('identifier', 'types')], 
    ['sname', ('identifier', 'rule_gterms')]]]
    
add_sdef_universal: dict -> list
'''
def add_sdef_universal(T):
    types = add_sdef_types(T['sdefs'])
    rule_gterms = add_sdef_rule_gterms(extract_rule_gterms(T['rules']))
    pair = (types, rule_gterms)
    tr = ()
    for s in pair:
        if s != ():
            tr += s[1],
    if tr != ():
        if len(tr) == 1:
            tr = tr[0]
        else:
            tr = ('union',) + tr
        tr = 'sdef', ('sname', ('identifier', 'universal')), tr
    return tr
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
    
'''
introduce_pdecls: introduce predicate declarations from predicates found in rules

Input: a set of found prediacates (pairs of predicate names and arities)
{('p0', 0), ('p1', 1), ('p2', 2),...}

Output: parsed ASP predicate declarations:
['pdecls', 
    ['pdecl', ('identifier', 'p0')], 
    ['pdecl', ('identifier', 'p1'), 
        ['snames', ['sname', ('identifier', 'universal')]]],...]
        
introduce_pdecls: set -> list
'''
def introduce_pdecls(T):
    tr = 'pdecls',
    for t in T:
        pname = t[0]
        arity = t[1]
        pdecl = 'pdecl', ('identifier', pname)
        if arity > 0:
            snames = 'snames',
            for i in range(arity):
                snames += ('sname', ('identifier', 'universal')),
            pdecl += snames,
        tr += pdecl,
    return tr
    
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
extract_rule_gterms: extract ground terms from rules

Input: tuple parsed ASP rules:
('rules', ('fact', ('head',..., ('terms', ('bt', ('const',...)),...))),...)

Output: a set of tuple parsed ASP rule ground terms:
{('const',...), ('num',...), ('func',...),...}

extract_rule_gterms: tuple -> set
'''
def extract_rule_gterms(T):
    if T[0] in housekeeper.lexemes:
        return set()
    elif T[0] in {'const', 'num'}:
        return {T}
    elif T[0] == 'func':
        gr = grounder.bfunc_is_ground(T)
        return  {T} if gr else \
                set()
    else:
        Set = set()
        for t in T[1:]:
            Set |= extract_rule_gterms(t)
        return Set

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
find_predicates: find predicate names and arities from rules

Input: parsed ASP rules:
['rules', ['fact', ['head', ['disj', 
    [...['patom', ('identifier', 'p0')]], 
    [...['patom', ('identifier', 'p1'), 
        ['terms,...]]]]]],...]
        
Output: a set of pairs of predicate names and arities:
{('p0', 0), ('p1', 1),...}

find_predicates: list -> set
'''
def find_predicates(T):
    if T[0] in housekeeper.lexemes:
        return set()
    elif T[0] == 'patom':
        pname = T[1][1]
        if len(T) == 2:
            arity = 0
        else:
            arity = len(T[2]) - 1
        return {(pname, arity)}
    else:
        Set = set()
        for t in T[1:]:
            Set |= find_predicates(t)
        return Set
