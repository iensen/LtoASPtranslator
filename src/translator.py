'''
program: list -> str

The function 'program' converts a parsed L program into an ASP program.

For instance, if P =
[['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'h')]]]]], ['rule', ['sent', ['disj', ['unit', ['literal', ['patom', ('identifier', 'h1')]]], ['unit', ['literal', ['patom', ('identifier', 'h2')]]]]], ['sent', ['conj', ['unit', ['literal', ['patom', ('identifier', 'b1')]]], ['neg_literal', ['patom', ('identifier', 'b2')]]]]]]
Then program(P) =
h. h1 | h2 :- b1, not b2.
'''

from transformer import *
from unparser import *

def test():
    return t_test() and u_test()

def program(P):
    return u_program(t_program(P))
