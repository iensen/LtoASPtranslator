'''
This module extracts ground terms from rules to define #rule_gterms.
'''

########## ########## ########## ########## ########## ########## ########## ##########

from . import grounder
from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
extract_rule_gterms: extract ground terms from rules

Input: tuple parsed ASP rules:
('rules', ('fact', ('head',..., ('terms', ('bt', ('const',...)),...))),...)

Output: a set of tuple parsed ASP rule ground terms:
{('const',...), ('num',...), ('func',...),...}

extract_rule_gterms: rules * dict(sname: set(tuple)) -> set(tuple)
'''
def extract_rule_gterms(T, sort_sets):
    gterms = set()
    for rule in T[1:]:
        g_vars = extract_g_vars(rule, sort_sets)
        gterms |= extract_gterms_rule(rule, g_vars)
    return gterms
    
'''
extract_gterms_rule: tuple * dict(vname: set(tuple)) -> tuple
'''
def extract_gterms_rule(T, var_sets):
    if T[0] in {'const', 'numeral'}:
        return {T}
    elif T[0] in housekeeper.lexemes:
        return set()
    elif T[0] == 'func':
        return extract_gterms_func(T, var_sets)
    else:
        gterms = set()
        for t in T[1:]:
            gterms |= extract_gterms_rule(t, var_sets)
        return gterms

'''
extract_gterms_func: tuple * dict(vname: set(tuple)) -> tuple
'''
def extract_gterms_func(T, var_sets):
    if grounder.bfunc_is_ground(T):
        gterms = {T}
        terms = T[2][1:] # Extract subterms of T to make T a Sparc program term
        for term in terms:
            gterms |= extract_gterms_rule(term, var_sets)
        return gterms
    else:
        g_funcs = grounder.ground_bfunc(T, var_sets) # set(tuple)
        gterms = set()
        for g_func in g_funcs:
            gterms |= extract_gterms_rule(g_func, var_sets)
        return gterms

########## ########## ########## ########## ########## ########## ########## ##########
########## ########## ########## ########## ########## ########## ########## ##########

'''
extract_g_vars: rule * dict(sname: set(tuple)) -> dict(vname: set(tuple))
'''
def extract_g_vars(T, sort_sets):
    satoms = get_satoms(T)
    var_ss = satoms_to_var_ss(satoms)
    
    var_sets = {}
    for vname in var_ss:
        sname = var_ss[vname]
        set1 = sort_sets[sname]
        var_sets[vname] = set1
    return var_sets

########## ########## ########## ########## ########## ########## ########## ##########

'''
satoms_to_var_ss: set(tuple) -> dict(vname: sname)
'''
def satoms_to_var_ss(S):
    var_ss = {}
    for satom in S:
        sname = satom[1][1][1]
        vname = satom[2][1]
        var_ss[vname] = sname
    return var_ss

'''
get_satoms: rule -> set(tuple)
'''
def get_satoms(T):
    if T[0] in housekeeper.lexemes:
        return set()
    elif T[0] == 'satom':
        return {T}
    else:
        satoms = set()
        for t in T[1:]:
            satoms |= get_satoms(t)
        return satoms
