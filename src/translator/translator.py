import preparer
import transformer
import unparser

# program: list -> str
def program(P):
    return u(t(p(P)))

# p: list -> list
def p(T):
    return preparer.program(T)

# t: list -> list
def t(T):
    return transformer.program(T)

#u: list -> str
def u(T):
    return unparser.program(T)

######################################################################

nullary = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p1')]]]]], ['rule', ['sent', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1')]]], ['unit', ['literal', ['patom', ('identifier', 'p2')]]]], ['unit', ['literal', ['patom', ('identifier', 'p3')]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['literal', ['patom', ('identifier', 'q1')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1')]]], ['literal', ['patom', ('identifier', 'q2')]]], ['literal', ['patom', ('identifier', 'q3')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['neg_literal', ['patom', ('identifier', 'r')]]]]]]
type_decls = [['tdecl', ('identifier', 't1'), ['terms', ['gterms', ['const', ('identifier', 'a')]]]], ['tdecl', ('identifier', 't3'), ['terms', ['gterms', ['num', ['pos', ('numeral', '1')]], ['num', ['pos', ('numeral', '2')]], ['num', ['pos', ('numeral', '3')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]]]]

Examples = [
            nullary,
            type_decls
            ]

# steps: list -> None
def steps(P):
    result = '\n\nParsed program (L): \n\n' + str(P) + \
             '\n\nPrepared program (L): \n\n' + str(p(P)) + \
             '\n\nTransformed program (ASP): \n\n' + str(t(p(P))) + \
             '\n\nUnparsed program (ASP): \n\n' + program(P)
    print(result)

# steps_short: list -> None
def steps_short(P):
    result = '\n\nParsed program (L): \n\n' + str(P) + \
             '\n\nUnparsed program (ASP): \n\n' + program(P)
    print(result)

# test: None -> None
def test():
    for ex in Examples:
        steps(ex)

# test_short: None -> None
def test_short():
    for ex in Examples:
        steps_short(ex)

test_short()
