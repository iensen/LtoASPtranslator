from . import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
aggregate_rules: tuple <->
'''
def aggregate_rules(T):
    if T[0] in housekeeper.lexemes:
        return T
    if T[0] == 'rule' and T[1][0] == 'cconstr':
        iconstr = rule_to_iconstr(T)
        return iconstr
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += aggregate_rules(t),
        return tr

'''
rule_to_iconstr: tuple <->
'''
def rule_to_iconstr(T):
    cconstr = T[1]
    b1 = cconstr[1]
    b2 = cconstr[3]
    
    patom = cconstr[2]
    satoms = housekeeper.tvars_to_satoms(patom)
    patom = housekeeper.detype_vars(patom)

    atoms = 'atoms', patom
    atoms += satoms
    
    contained_vars = housekeeper.get_vars(cconstr) # set
    sent = ()
    if len(T) > 2:
        sent += T[2][1]
        sent_vars = housekeeper.get_vars(sent) # set
        contained_vars -= sent_vars
        
    bterms = 'bterms', ('numeral', '0')
    bterms += tuple(contained_vars)
    
    afunc = '#count', bterms, atoms
    aatom1 = 'aatom', b1, ('greater', '>'), afunc
    aatom2 = 'aatom', b2, ('less', '<'), afunc
    
    body = 'disj', aatom1, aatom2
    if sent != ():
        body = 'conj', body, sent
    
    body = 'body', body
    iconstr = 'iconstr', body
    return iconstr
