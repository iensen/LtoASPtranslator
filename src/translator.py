from transformer import *
from unparser import *

def test():
    return t_test() and u_test()

def program(P):
    return u_program(t_program(P))
