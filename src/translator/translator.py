import preparer
import transformer
import unparser

def test(P):
    P_p = preparer.program(P)
    P_t = transformer.program(P_p)
    P_u = unparser.program(P_t)
    
    print('Parsed program (L): \n')
    print(P)
    print('\n')
    
    print('Prepared program (L): \n')
    print(P_p)
    print('\n')
    
    print('Transformed program (ASP): \n')
    print(P_t)
    print('\n')
    
    print('Unparsed program (ASP): \n')
    print(P_u)

######################################################################

nullary = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p1')]]]]], ['rule', ['sent', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1')]]], ['unit', ['literal', ['patom', ('identifier', 'p2')]]]], ['unit', ['literal', ['patom', ('identifier', 'p3')]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['literal', ['patom', ('identifier', 'q1')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1')]]], ['literal', ['patom', ('identifier', 'q2')]]], ['literal', ['patom', ('identifier', 'q3')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['neg_literal', ['patom', ('identifier', 'r')]]]]]]
test(nullary)
