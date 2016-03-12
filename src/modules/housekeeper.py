'''
This file contains miscellaneous constructs used by most other files
'''

########## ########## ########## ########## ########## ########## ########## ##########

'''
Frequently referred labels
'''

arOp1s = {'plus', 'minus'}
arOp2s = {'mult', 'div', 'mod'}
arOps = arOp1s | arOp2s
compOps = {'less', 'greater', 'lessoreq', 'greateroreq', 'noteq', 'eq'}
lexemes = arOps | compOps | {'pound_id', 'id', 'numeral', 'variable', 'every', 'some'}

ground_terms = {'num',
                'cname', 'tname', 'pname', 'fname',
                'ar',   # possibly non-ground
                'func'} # possibly non-basic
basic_terms = ground_terms | {'tvar', 'var'}
terms = basic_terms | {'qtLegacy', 'qt'}

cut_root_commas = { 'terms', 
                    'aggr_terms', 'aggr_atoms', 'snames'} # ASP

setOps = {'union': ' + ', 'inters': ' * ', 'diff': ' - '} # {L_label: ASP_token}

ruleForms = {'iconstr', 'fact', 'fullRule'}

########## ########## ########## ########## ########## ########## ########## ##########

'''
tuple_is_ground: tuple -> bool
'''
def tuple_is_ground(T):
    if T[0] in {'var', 'tvar'}:
        return False
    elif T[0] in lexemes:
        return True
    else:
        for t in T[1:]:
            if not tuple_is_ground(t):
                return False
        return True

########## ########## ########## ########## ########## ########## ########## ##########

'''
get_tvarS_from_tuple: tuple -> set
'''
def get_tvarS_from_tuple(T):
    if T[0] in lexemes | {'aggr'}:
        return set()
    elif T[0] == 'tvar':
        return {T}
    else:
        S = set()
        for t in T[1:]:
            S |= get_tvarS_from_tuple(t)
        return S
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
subbing_tuple: tuple * dict(tuple1: tuple2) -> tuple
'''
def subbing_tuple(T, D):
    if T in D:
        return D[T]
    elif T[0] in lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (subbing_tuple(t, D),)
        return tr
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
demodularize_prog: dict -><
'''
def demodularize_prog(prog):
    for k in prog:
        prog[k] = demodularize_tuple(prog[k])
    return prog

'''
demodularize_tuple: tuple -> tuple
'''
def demodularize_tuple(T):
    if T[0] == 'numeral':
        formattedNum = str(int(T[1]))
        formattedNum = 'numeral', formattedNum
        return formattedNum
    elif T[0] in lexemes:
        return T
    elif T[0] in {'ar', 'sum', 'product'}:
        a = demodularize_tuple(T[1])
        b = demodularize_tuple(T[3])
        if T[2][0] == 'mod': # T[0] in {'ar', 'product'}
            root = 'sum' if T[0] == 'product' else 'ar'
            div = 'product', a, ('div', '/'), b
            mult = 'product', div, ('mult', '*'), b
            return root, a, ('minus', '-'), mult
        else:
            return T[0], a, T[2], b
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += demodularize_tuple(t),
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
subbing_calculated_cnames_in_prog: dict(str: tuple) <->
'''
def subbing_calculated_cnames_in_prog(P):
    cdecls = P['cdecls']
    tdecls = P['tdecls']
    rules = P['rules']
    if len(cdecls) > 1:
        global calculated_cnames
        calculated_cnames = {} # {tuple: int}
        update_calculated_cnames_via_cdecls(cdecls)
        for cname in calculated_cnames:
            Int = calculated_cnames[cname]
            calculated_cnames[cname] = int_to_num(Int) # {tuple: tuple}
        tdecls = subbing_tuple(tdecls, calculated_cnames)
        tdecls = eval_tuple(tdecls)
        rules = subbing_tuple(rules, calculated_cnames)
        rules = eval_tuple(rules)
    return {'tdecls': tdecls, 'rules': rules}

'''
update_calculated_cnames_via_cdecls: tuple -> void
'''
def update_calculated_cnames_via_cdecls(T):
    for cdecl in T[1:]:
        cname = cdecl[1]
        Int = calc_ground_ar(cdecl[2])
        global calculated_cnames
        calculated_cnames[cname] = Int

########## ########## ########## ########## ########## ########## ########## ##########

'''
eval_tuple: tuple <->
'''
def eval_tuple(T):
    if T[0] == 'ar':
        if tuple_is_ground(T):
            Int = calc_ground_ar(T)
            return int_to_num(Int)
        else:
            return T
    elif T[0] in lexemes:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += eval_tuple(t),
        return tr

'''
calc_ground_ar: tuple -> int
'''
def calc_ground_ar(T):
    if T[0] == 'cname':
        return calculated_cnames[T]
    elif T[0] == 'num':
        return num_to_int(T)
    else: # in {'ar', 'sum', 'product'}
        a = calc_ground_ar(T[1])
        b = calc_ground_ar(T[3])
        arOp = T[2]
        if arOp[0] == 'plus':
            return a + b
        elif arOp[0] == 'minus':
            return a - b
        elif arOp[0] == 'mult':
            return a * b
        else: # 'div'
            return a // b

########## ########## ########## ########## ########## ########## ########## ##########

'''
num_to_int: tuple -> int
'''
def num_to_int(T):
    return int(T[1][1])

'''
int_to_num: int -> tuple
'''
def int_to_num(I):
    return ('num', ('numeral', str(I)))
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
list_to_tuple: convert a tree and its subtrees from lists to tuples
(to make the tree hashable to be a member of a set)

list_to_tuple: list -> tuple
'''
def list_to_tuple(T):
    if T == []:
        return ()
    if T[0] in lexemes:
        return T
    else: 
        tr = (T[0],)
        for t in T[1:]:
            tr += (list_to_tuple(t),)
        return tr

'''
tuple_to_list: convert a tuple tree and its tuple non-leaf subtrees to lists
(for consistency with the spec of the generic parser)

tuple_to_list: tuple -> list
'''
def tuple_to_list(T):
    if T[0] in lexemes:
        return T
    else: # non-terminal label
        tr = [T[0]]
        for t in T[1:]:
            tr += [tuple_to_list(t)]
        return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
list_to_dict: change the data type of a program from list to dictionary
(for convenient handling)

list_to_dict: list -> dict
'''
def list_to_dict(T):
    T = ['prog'] + T
    T = list_to_tuple(T)
    prog = {'cdecls': ('cdecls',), 'tdecls': ('tdecls',), 'rules': ('rules',)}
    for t in T[1:]:
        if t[0] == 'cdecl':
            prog['cdecls'] += (t,)
        elif t[0] == 'tdecl':
            prog['tdecls'] += (t,)
        else: # in ruleForms
            prog['rules'] += (t,)
    return prog

'''
dict_to_list: change the data type of a program from dictionary to list
(for consistency with the spec of the generic parser)
    
dict_to_list: dict -> list
'''
def dict_to_list(T):
    prog = 'prog',
    for keyw in ('sdefs', 'pdecls', 'rules', 'display'):
        prog += T[keyw],
    prog = tuple_to_list(prog)
    return prog
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
union_dicts_of_sets: {tuple: set} * // -> //
'''
def union_dicts_of_sets(D1, D2):
    for k2 in D2:
        if k2 in D1:
            D1[k2] |= D2[k2]
        else:
            D1[k2] = D2[k2]
    return D1
    
########## ########## ########## ########## ########## ########## ########## ##########

'''
union_dicts_of_tuples_of_sets: {key: tuple(set)} * // -> //
'''
def union_dicts_of_tuples_of_sets(D1, D2):
    for k2 in D2:
        if k2 in D1:
            D1[k2] = union_tuples_of_sets(D1[k2], D2[k2])
        else:
            D1[k2] = D2[k2]
    return D1
    
'''
union_tuples_of_sets: tuple(set) * // -> //
'''
def union_tuples_of_sets(T1, T2):
    T3 = ()
    for i in range(len(T1)):
        T3 += (T1[i] | T2[i]),
    return T3
