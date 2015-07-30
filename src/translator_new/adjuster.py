'''
In this adjuster module, an input of each function is a parsed L program
'''

# Rearrange L statements in three groups: constant/type declarations and rules
# program: list -> list
def program(P):
    ruls = rules(P)
    
    if ruls == []:
        return []
    
    ruls = ['stmts'] + ruls
    ruls = ['rules', ruls]
    progr = ['progr', ruls]
    return progr

########## ########## ########## ########## ########## ########## ########## ########## 

# Collect L rules and put them in a group. Ignore constant/type declarations
# rules: list -> list
def rules(P):
    ruls = []
    for p in P:
        if p[0] == 'rule':
            ruls += [p]
    return ruls
