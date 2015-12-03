import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
unparse: write an ASP program

Input: a parsed ASP program:
['prog', ['sdefs',...], ['pdecls',...], ['rules',...]]

Output: an ASP program:
'sorts... predicates... rules...'

unparse: list -> str
'''
def unparse(T):
    prog = ''
    for t in T[1:]:
        if t[0] == 'cdefs':
            cdefs = unparse_cdefs(t)
            prog += cdefs
        if t[0] == 'sdefs':
            sdefs = unparse_sdefs(t)
            if sdefs != '':
                prog +=     '\n' + comment_line + '\nsorts\n' + comment_line + \
                            '\n\n' + sdefs
        if t[0] == 'pdecls':
            pdecls = unparse_pdecls(t)
            if pdecls != '':
                prog += comment_line + '\npredicates\n' + comment_line + '\n\n' + pdecls
        if t[0] == 'rules':
            rules = unparse_rules(t)
            if rules != '':
                prog +=     '\n' + comment_line + '\nrules\n' + comment_line + \
                            '\n\n' + rules
    return prog

########## ########## ########## ########## ########## ########## ########## ##########

'''
unparse_cdefs: list -> str
'''
def unparse_cdefs(T):
    st = ''
    cdefs = T[1:]
    for cdef in cdefs:
        cname = cdef[1][1]
        val = cdef[2][1]
        st += '#const ' + cname + ' = ' + val + '.\n'
    return st

########## ########## ########## ########## ########## ########## ########## ##########

'''
unpare_sdefs: write ASP sort definitions

Input: parsed ASP sort definitions:
['sdefs', 
    ['sdef', ['sname', ('identifier', 't1')], 
        ['set', ['gterms', ['const', ('identifier', 'a')]]]],...]
    
Output: ASP sort definitions:
'sorts 
    #t1 = {a}. ...'

unparse_sdefs: list -> str
'''
def unparse_sdefs(T):
    if T[0] in housekeeper.lexemes:
        return T[1]
    elif T[0] in housekeeper.cut_root_comma:
        st = unparse_sdefs(T[1])
        for t in T[2:]:
            st += ', ' + unparse_sdefs(t)
        return st
    elif T[0] == 'func':
        return unparse_sdefs(T[1]) + '(' + unparse_sdefs(T[2]) + ')'
    elif T[0] == 'set':
        return '{' + unparse_sdefs(T[1]) + '}'
    elif T[0] == 'range':
        return T[1][1] + '..' + T[2][1]
    elif T[0] == 'sname':
        return '#' + unparse_sdefs(T[1])
    elif T[0] in housekeeper.set_ops:
        return  unparse_sdefs(T[1]) + housekeeper.set_ops[T[0]] + '\n\t' + \
                unparse_sdefs(T[2])
    elif T[0] == 'sdef':
        return unparse_sdefs(T[1]) + ' = \n\t' + unparse_sdefs(T[2]) + '.\n\n'
    else:
        st = ''
        for t in T[1:]:
            st += unparse_sdefs(t)
        return st

'''
unparse_pdecls: write ASP predicate declarations

Input: parsed ASP predicate declarations:
['pdecls', 
    ['pdecl', ('identifier', 'p')],...]
    
Output: predicate declarations:
'predicates 
    p(). ...'

unparse_pdecls: list -> str
'''
def unparse_pdecls(T):
    if T[0] in housekeeper.lexemes:
        return T[1]
    elif T[0] == 'sname':
        return '#' + unparse_pdecls(T[1])
    elif T[0] in housekeeper.cut_root_comma:
        st = unparse_pdecls(T[1])
        for t in T[2:]:
            st += ', ' + unparse_pdecls(t)
        return st
    elif T[0] == 'pdecl':
        st = unparse_pdecls(T[1]) + '('
        if len(T) > 2:
            st += unparse_pdecls(T[2])
        st += ').\n'
        return st
    else:
        st = ''
        for t in T[1:]:
            st += unparse_pdecls(t)
        return st

'''
unparse_rules: write ASP rules

Input: parsed ASP rules:
['rules', 
    ['rule', 
        ['head', ['literal', ['patom', ('identifier', 'p1')]]], 
        ['body', ['literal', ['patom', ('identifier', 'p2')]]]],...]
    
Output: ASP rules:
'rules 
    p1 :- p2. ...'
    
unparse_rules: list -> str
'''
def unparse_rules(T):
    if T[0] == 'mod':
        return '\\'
    elif T[0] in housekeeper.ar_ops:
        return T[1]
    elif T[0] in {'gar_term', 'ar_term', 'sum', 'product'}:
        st =    '(' + unparse_rules(T[1]) + ' ' + unparse_rules(T[2]) + ' ' + \
                unparse_rules(T[3]) + ')'
        return st
        
    elif T[0] in housekeeper.comp_ops:
        return ' ' + T[1][0] + ' '
    elif T[0] in housekeeper.lexemes:
        return T[1]
    elif T[0] == 'sname':
        return '#' + unparse_rules(T[1])
    elif T[0] in housekeeper.cut_root_comma:
        st = unparse_rules(T[1])
        for t in T[2:]:
            st += ', ' + unparse_rules(t)
        return st
    elif T[0] == 'func':
        return unparse_rules(T[1]) + '(' + unparse_rules(T[2]) + ')'
    elif T[0] == 'satom':
        return unparse_rules(T[1]) + '(' + unparse_rules(T[2]) + ')'
    elif T[0] == 'patom':
        st = unparse_rules(T[1])
        if len(T) > 2:
            st += '(' + unparse_rules(T[2]) + ')'
        return st
    elif T[0] == 'neg_def':
        return 'not ' + unparse_rules(T[1])
    elif T[0] == 'neg_class':
        return '-' + unparse_rules(T[1])
    elif T[0] == 'conj':
        return unparse_rules(T[1]) + ',\n\t' + unparse_rules(T[2])
    elif T[0] == 'disj':
        return unparse_rules(T[1]) + ' |\n' + unparse_rules(T[2])
    elif T[0] == 'iconstr':
        return ':- ' + unparse_rules(T[1]) + '.\n\n'
    elif T[0] == 'fact':
        return unparse_rules(T[1]) + '.\n\n'
    elif T[0] == 'rule':
        return unparse_rules(T[1]) + ' :-\n\t' + unparse_rules(T[2]) + '.\n\n'
    else:
        st = ''
        for t in T[1:]:
            st += unparse_rules(t)
        return st

########## ########## ########## ########## ########## ########## ########## ##########

comment_line = '\
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%'
