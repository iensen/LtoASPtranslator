import housekeeper

########## ########## ########## ########## ########## ########## ########## ##########

'''
demodularize: tuple -> tuple
'''
def demodularize(T):
    if T[0] in housekeeper.lexemes:
        return T
    elif T[0] in {'gar_term', 'ar_term', 'sum', 'product'}:
        a = demodularize(T[1])
        b = demodularize(T[3])
        if T[2][0] == 'mod':
            div = 'product', a, ('div', '/'), b
            mult = 'product', b, ('mult', '*'), div
            
            root =  T[0]    if T[0] in {'gar_term', 'ar_term'} else \
                    'sum'   #       == 'product'
            return root, a, ('minus', '-'), mult
        else:
            return T[0], a, T[2], b
    else:
        tr = T[:1]
        for t in T[1:]:
            tr += demodularize(t),
        return tr
