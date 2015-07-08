def root(T):
    return T[0]

def cut_root(T):
    return T[1:]

def translator_program(P):
    P_translated = []
    for S in P:
        P_translated = P_translated + [translator_statement(S)]
    return P_translated

def translator_statement(S):    
    if root(S) == 'rule':
        return translator_rule(S)

def translator_rule(R):
    R_translated = ['rule']
    if root(R[1]) == 'sent':
        if root root(R[1][1]) == 'disj':
            if root(R[1][1]) == 'unit':
                R_translated = R_translated + [translator_head(R[1])]
    if len(R) == 3:
        if root(R[2]) == 'sent':
            if root(R[2][1]) == 'conj':

#######
