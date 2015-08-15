'''
Put parsed L statements in 3 groups: constant/type declarations and rules

Input: a parsed L program: 
[['tdecl',...], ['rule',...],...]

Output: an adjusted L program: 
['progr', ['tdecls',...], ['cdecls',...], ['rules', ['rule',...], ['rule',...],...]]

adjust: list -> list
'''
def adjust(T):
    progr = []
    
    tdecls = type_decls(T)
    if tdecls != []:
        tdecls = ['tdecls'] + tdecls
        progr += [tdecls]
    
    ruls = rules(T)
    if ruls != []:
        ruls = ['rules'] + ruls
        progr += [ruls]

    if progr != []:
        progr = ['progr'] + progr

    return progr
    
########## ########## ########## ########## ########## ########## ########## ##########

def type_decls(T):
    tdecls = []
    for t in T:
        if t[0] == 'tdecl':
            tdecls += [t]
    return tdecls

########## ########## ########## ########## ########## ########## ########## ##########

'''
Collect parsed L rules and put them in a group. Ignore constant/type declarations

Input: a parsed L program: 
[['tdecl',...], ['cdecl',...], ['rule',...],...]

Output: a group of parsed L rules: 
[['rule',...], ['rule',...],...]

rules: list -> list
'''
def rules(T):
    ruls = []
    for t in T:
        if t[0] == 'rule':
            ruls += [t]
    return ruls
