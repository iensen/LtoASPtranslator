stoppers = {'aggr', 'strNeg', 'batom', 'patom'}

AND = 'conj'
OR = 'disj'
princ_ops = {'CNF': AND, 'DNF': OR}

neg_compOps = { 'less': ('greateroreq', '>='), 'greateroreq': ('less', '<'),
                'greater': ('lessoreq', '<='), 'lessoreq': ('greater', '>'),
                'noteq': ('eq', '='), 'eq': ('noteq', '!=')}

########## ########## ########## ########## ########## ########## ########## ##########

'''
normalize_rules: rules <->
'''
def normalize_rules(rules):
    tr = ('rules',)
    for rule in rules[1:]:
        if rule[0] == 'iconstr':
            body = rule[1][1]
            body = normalize_using_mode(body, 'DNF')
            n_bodys = get_normalized_clauses(body, 'DNF')
            for n_body in n_bodys:
                n_body = 'body', n_body
                n_rule = ('iconstr', n_body)
                tr += (n_rule,)
        elif rule[0] == 'fact':
            head = rule[1][1]
            head = normalize_using_mode(head, 'CNF')
            n_heads = get_normalized_clauses(head, 'CNF')
            for n_head in n_heads:
                n_head = ('head', n_head)
                n_rule = ('fact', n_head)
                tr += (n_rule,)
        else: # 'fullRule'
            head = rule[1][1]
            head = normalize_using_mode(head, 'CNF')
            n_heads = get_normalized_clauses(head, 'CNF')
            body = rule[2][1]
            body = normalize_using_mode(body, 'DNF')
            n_bodys = get_normalized_clauses(body, 'DNF')
            for n_head in n_heads:
                for n_body in n_bodys:
                    n_head = 'head', n_head
                    n_body = 'body', n_body
                    n_rule = ('fullRule', n_head, n_body)
                    tr += (n_rule,)
    return tr

########## ########## ########## ########## ########## ########## ########## ##########

'''
normalize_using_mode: tuple * str -> tuple
'''
def normalize_using_mode(T, mode):
    T = negate_batoms(T)
    global bad_conn_pushed_out
    bad_conn_pushed_out = True
    while bad_conn_pushed_out:
        bad_conn_pushed_out = False
        if mode == 'CNF':
            T = push_in_OR(T)
        else: # 'DNF'
            T = push_in_AND(T)
    return T
    
'''
get_normalized_clauses: tuple * str -> set
'''
def get_normalized_clauses(T, mode):
    if T[0] == princ_ops[mode]:
        return get_normalized_clauses(T[1], mode) | get_normalized_clauses(T[2], mode)
    else:
        return {T}

########## ########## ########## ########## ########## ########## ########## ##########

'''
DNF

push_in_AND: tuple -> tuple
'''
def push_in_AND(T):
    if T[0] == AND:
        if T[1][0] == OR:
            tr = OR, (AND, T[1][1], T[2]), (AND, T[1][2], T[2])
            global bad_conn_pushed_out
            bad_conn_pushed_out = True
            return push_in_AND(tr)
        elif T[2][0] == OR:
            return push_in_AND((AND, T[2], T[1]))
        else:
            return AND, push_in_AND(T[1]), push_in_AND(T[2])
    elif T[0] == OR:
        return OR, push_in_AND(T[1]), push_in_AND(T[2])
    elif T[0] in stoppers:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (push_in_AND(t),)
        return tr
        
'''
CNF

push_in_OR: tuple -> tuple
'''
def push_in_OR(T):
    if T[0] == AND:
        return AND, push_in_OR(T[1]), push_in_OR(T[2])
    elif T[0] == OR:
        if T[1][0] == AND:
            tr = AND, (OR, T[1][1], T[2]), (OR, T[1][2], T[2])
            global bad_conn_pushed_out
            bad_conn_pushed_out = True
            return push_in_OR(tr)
        elif T[2][0] == AND:
            return push_in_OR((OR, T[2], T[1]))
        else:
            return OR, push_in_OR(T[1]), push_in_OR(T[2])
    elif T[0] in stoppers:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (push_in_AND(t),)
        return tr
        
########## ########## ########## ########## ########## ########## ########## ##########

'''
negate_batoms: tuple <->
'''
def negate_batoms(T):
    if T[0] == 'strNeg':
        if T[1][0] == 'batom':
            term1 = T[1][1]
            op = T[1][2][0]
            neg_compOp = neg_compOps[op]
            term2 = T[1][3]
            return ('batom', term1, neg_compOp, term2)
        else: # Allow only: basic predicate patom
            return T
    elif T[0] in stoppers:
        return T
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += (negate_batoms(t),)
        return tr