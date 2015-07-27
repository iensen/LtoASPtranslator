# program: list -> list
def program(P):
    progr = ['progr']
    
    Cdecls = Const_decls(P)
    if Cdecls != []:
        Cdecls = ['stmts'] + Cdecls
        progr = progr + [['cdecls', Cdecls]]
        
    Tdecls = Type_decls(P)
    if Tdecls != []:
        Tdecls = ['stmts'] + Tdecls
        progr = progr + [['tdecls', Tdecls]]

    Ruls = Rules(P)
    Ruls = ['stmts'] + Ruls
    progr = progr + [['rules', Ruls]]
    
    return progr

######################################################################

# Const_decls: list -> list
def Const_decls(P):
    Cdecls = []
    for p in P:
        if p[0] == 'cdecl':
            Cdecls = Cdecls + [p]
    return Cdecls

# Type_decls: list -> list
def Type_decls(P):
    Tdecls = []
    for p in P:
        if p[0] == 'tdecl':
            Tdecls = Tdecls + [p]
    return Tdecls

# Rules: list -> list
def Rules(P):
    Ruls = []
    for p in P:
        if p[0] == 'rule':
            Ruls = Ruls + [p]
    return Ruls
