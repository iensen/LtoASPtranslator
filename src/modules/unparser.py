from . import housekeeper
'''
Input: a parsed ASP program:
['prog', ['sdefs',...], ['pdecls',...], ['rules',...]]

Output: an ASP program:
'sorts... predS... rules...'

unparse: list -> str
'''
def unparse(T):
    prog = ''
    for t in T[1:]:
        if t[0] == 'sdefs':
            sdefs = unparse_sdefs(t)
            if sdefs != '':
                prog += comment + 'sorts\n\n' + sdefs
        elif t[0] == 'pdecls':
            pdecls = unparse_pdecls(t)
            if pdecls != '':
                prog += comment + 'predicates\n\n' + pdecls + '\n'
        elif t[0] == 'rules':
            rules = unparse_rules(t)
            if rules != '':
                prog += comment + 'rules\n\n' + rules
        else: # 'display'
            display = unparse_display(t)
            if display != '':
                prog += comment + 'display\n\n' + display
    return prog

########## ########## ########## ########## ########## ########## ########## ##########

'''
Input: parsed ASP sort definitions:
['sdefs', 
    ['sdef', ['sname', ('id', 't1')], 
        ['set', ['terms', ['const', ('id', 'a')]]]],...]
    
Output: ASP sort definitions:
'sorts 
    #t1 = {a}. ...'

unparse_sdefs: list -> str
'''
def unparse_sdefs(T):
    if T[0] in housekeeper.lexemes:
        return T[1]
    elif T[0] in housekeeper.cut_root_commas:
        st = unparse_sdefs(T[1])
        for t in T[2:]:
            st += ', ' + unparse_sdefs(t)
        return st
    elif T[0] == 'func':
        return unparse_sdefs(T[1]) + '(' + unparse_sdefs(T[2]) + ')'
    elif T[0] == 'set':
        return '{' + unparse_sdefs(T[1]) + '}'
    elif T[0] == 'range':
        return T[1][1][1] + '..' + T[2][1][1]
    elif T[0] in housekeeper.setOps:
        return  unparse_sdefs(T[1]) + housekeeper.setOps[T[0]] + unparse_sdefs(T[2])
    elif T[0] == 'sdef':
        return unparse_sdefs(T[1]) + ' = ' + unparse_sdefs(T[2]) + '.\n'
    else:
        st = ''
        for t in T[1:]:
            st += unparse_sdefs(t)
        return st

'''
Input: parsed ASP predicate declarations:
['pdecls', 
    ['pdecl', ('id', 'p')],...]
    
Output: predicate declarations:
'predS 
    p(). ...'

unparse_pdecls: list -> str
'''
def unparse_pdecls(T):
    if T[0] in housekeeper.lexemes:
        return T[1]
    elif T[0] in housekeeper.cut_root_commas:
        st = unparse_pdecls(T[1])
        for t in T[2:]:
            st += ', ' + unparse_pdecls(t)
        return st
    elif T[0] == 'pdecl':
        st = unparse_pdecls(T[1]) + '('
        if len(T) > 2:
            st += unparse_pdecls(T[2])
        st += '). '
        return st
    else:
        st = ''
        for t in T[1:]:
            st += unparse_pdecls(t)
        return st

'''
Input: parsed ASP rules:
['rules', 
    ['rule', 
        ['head', ['literal', ['patom', ('id', 'p1')]]], 
        ['body', ['literal', ['patom', ('id', 'p2')]]]],...]
    
Output: ASP rules:
'rules 
    p1 :- p2. ...'
    
unparse_rules: list -> str
'''
def unparse_rules(T):
    if T[0] in housekeeper.arOps:
        return T[1]
    elif T[0] in {'ar', 'sum', 'prod'}:
        st =    '(' + unparse_rules(T[1]) + ' ' + unparse_rules(T[2]) + ' ' + \
                unparse_rules(T[3]) + ')'
        return st
    elif T[0] in housekeeper.compOps:
        return ' ' + T[1] + ' '
    elif T[0] in housekeeper.lexemes:
        return T[1]
    elif T[0] in housekeeper.cut_root_commas:
        st = unparse_rules(T[1])
        for t in T[2:]:
            st += ', ' + unparse_rules(t)
        return st
    elif T[0] == 'func':
        return unparse_rules(T[1]) + '(' + unparse_rules(T[2]) + ')'
    elif T[0] == 'aggr_func':
        aggr_terms = T[1]
        aggr_atoms = T[2]
        st =    '#count{' + unparse_rules(aggr_terms) + ': ' + \
                unparse_rules(aggr_atoms) + '}'
        return st
    elif T[0] == 'satom':
        return unparse_rules(T[1]) + '(' + unparse_rules(T[2]) + ')'
    elif T[0] == 'patom':
        st = unparse_rules(T[1])
        if len(T) > 2:
            st += '(' + unparse_rules(T[2]) + ')'
        return st
    elif T[0] == 'defNeg':
        return 'not ' + unparse_rules(T[1])
    elif T[0] == 'strNeg':
        return '-' + unparse_rules(T[1])
    elif T[0] == 'conj':
        return unparse_rules(T[1]) + ', ' + unparse_rules(T[2])
    elif T[0] == 'disj':
        return unparse_rules(T[1]) + ' | ' + unparse_rules(T[2])
    elif T[0] == 'iconstr':
        return ':- ' + unparse_rules(T[1]) + '.\n'
    elif T[0] == 'fact':
        return unparse_rules(T[1]) + '.\n'
    elif T[0] == 'fullRule':
        return unparse_rules(T[1]) + ' :- ' + unparse_rules(T[2]) + '.\n'
    else:
        st = ''
        for t in T[1:]:
            st += unparse_rules(t)
        return st

'''
def unparse_display: list -> str
'''
def unparse_display(T):
    if T[0] == 'id':
        return T[1] + '. '
    else: # 'display'
        st = ''
        for t in T[1:]:
            st += unparse_display(t)
        return st

########## ########## ########## ########## ########## ########## ########## ##########

comment = '\n%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% \
%%%%%%%%%% %%%%%%%%%%\n'
comment = '\n'