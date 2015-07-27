'''
The function 'program' translates a parsed L program into an ASP program.

For instance, running this module shows program(one_type), where one_type is
a parsed L program defined below.
'''

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

one_type = [['tdecl', ('identifier', 't'), ['terms', ['gterms', ['const', ('identifier', 'a')], ['const', ('identifier', 'b')], ['const', ('identifier', 'c')], ['num', ['pos', ('numeral', '1')]], ['num', ['pos', ('numeral', '2')]], ['num', ['pos', ('numeral', '3')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p0')]]]]], ['rule', ['sent', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1'), ['terms', ['bt', ['num', ['pos', ('numeral', '1')]]]]]]], ['unit', ['literal', ['patom', ('identifier', 'p2'), ['terms', ['bt', ['num', ['pos', ('numeral', '1')]]], ['bt', ['num', ['pos', ('numeral', '2')]]]]]]]], ['unit', ['literal', ['patom', ('identifier', 'p3'), ['terms', ['bt', ['num', ['pos', ('numeral', '1')]]], ['bt', ['num', ['pos', ('numeral', '2')]]], ['bt', ['num', ['pos', ('numeral', '3')]]]]]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'q0')]]]], ['sent', ['unit', ['literal', ['patom', ('identifier', 'p0')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'r0')]]]], ['sent', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1'), ['terms', ['bt', ['const', ('identifier', 'a')]]]]]], ['literal', ['patom', ('identifier', 'q2'), ['terms', ['bt', ['const', ('identifier', 'a')]], ['bt', ['const', ('identifier', 'b')]]]]]],['literal', ['patom', ('identifier', 'q3'), ['terms', ['bt', ['const', ('identifier', 'a')]], ['bt', ['const', ('identifier', 'b')]], ['bt', ['const', ('identifier', 'c')]]]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 's0')]]]], ['sent', ['unit', ['neg_literal', ['patom', ('identifier', 'r0')]]]]]]

Examples = [
            one_type
            ]

######################################################################

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

# show: None -> None
def show():
    for ex in Examples:
        steps(ex)

# show_short: None -> None
def show_short():
    for ex in Examples:
        steps_short(ex)

#show()
show_short()
