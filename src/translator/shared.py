# P is a parsed L program:
P = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p1')]]]]], ['rule', ['sent', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p1')]]], ['unit', ['literal', ['patom', ('identifier', 'p2')]]]], ['unit', ['literal', ['patom', ('identifier', 'p3')]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['literal', ['patom', ('identifier', 'q1')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'q1')]]], ['literal', ['patom', ('identifier', 'q2')]]], ['literal', ['patom', ('identifier', 'q3')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p')]]]], ['sent', ['unit', ['neg_literal', ['patom', ('identifier', 'r')]]]]]]

lexemes = {'variable', 'identifier', 'numeral'}

same_labels = {'unit', 'literal', 'patom', 'disj', 'conj'}

unwritten_labels = {'body', 'head', 'unit', 'literal', 'patom'}
