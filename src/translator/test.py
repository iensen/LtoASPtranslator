from labels import *

from main import *
from transformer import *
from rewriter import *
from reassembler import *
from unparser import *

# Provide a parsed L program:
parsed = [['tdecl', ('identifier', 't1'), ['set', ['gterms', ['num', ['pos', ('numeral', '1')]]]]], ['tdecl', ('identifier', 't2'), ['set', ['gterms', ['const', ('identifier', 'a')], ['const', ('identifier', 'b')]]]], ['tdecl', ('identifier', 't3'), ['set', ['gterms', ['const', ('identifier','a')], ['const', ('identifier', 'b')], ['func', ('identifier', 'f1'), ['gterms', ['const', ('identifier', 'c')]]]]]], ['tdecl', ('identifier', 't4'), ['set', ['gterms', ['func', ('identifier', 'f2'), ['gterms', ['num', ['pos', ('numeral', '1')]], ['const', ('identifier', 'b')]]], ['num', ['pos', ('numeral', '2')]], ['func', ('identifier', 'f3'), ['gterms', ['const', ('identifier', 'a')], ['const', ('identifier', 'b')], ['num', ['pos', ('numeral', '3')]]]], ['const', ('identifier', 'd')]]]], ['tdecl', ('identifier', 't5'), ['union', ('identifier', 't1'), ['diff', ['inters', ('identifier', 't2'), ('identifier', 't3')], ['set', ['gterms', ['const', ('identifier', 'a')], ['num', ['pos', ('numeral', '5')]]]]]]], ['tdecl', ('identifier', 't6'), ['diff', ['set', ['gterms', ['func', ('identifier', 'f3'), ['gterms', ['const', ('identifier', 'a')], ['const', ('identifier', 'b')], ['const', ('identifier', 'c')]]], ['const', ('identifier', 'a')]]], ('identifier', 't2')]], ['tdecl', ('identifier', 't7'), ('identifier', 't3')], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p0')]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p1'), ['terms', ['bt', ['func', ('identifier', 'f1'), ['terms',['bt', ['num', ['pos', ('numeral', '1')]]]]]]]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p2'), ['terms', ['bt', ['const', ('identifier', 'a')]], ['bt', ['const', ('identifier', 'b')]]]]]]]], ['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'p3'), ['terms', ['bt', ['num', ['pos', ('numeral', '1')]]], ['bt', ['const', ('identifier', 'b')]], ['bt', ['func', ('identifier', 'f2'), ['terms', ['bt', ['const', ('identifier', 'a')]], ['bt', ['num', ['pos', ('numeral', '3')]]]]]]]]]]]], ['rule', ['sent', ['disj', ['disj', ['unit', ['literal', ['patom', ('identifier', 'p4')]]], ['unit', ['literal', ['patom', ('identifier', 'p5'), ['terms', ['bt', ['func', ('identifier', 'f1'), ['terms', ['bt', ['num', ['pos', ('numeral', '2')]]]]]], ['bt', ['const', ('identifier', 'b')]]]]]]], ['unit', ['literal', ['patom', ('identifier', 'p6'), ['terms', ['bt', ['const', ('identifier', 'a')]], ['bt', ['func', ('identifier', 'f2'), ['terms', ['bt', ['const', ('identifier', 'a')]], ['bt', ['num', ['pos', ('numeral', '3')]]]]]]]]]]]], ['sent', ['conj', ['conj', ['unit', ['literal', ['patom', ('identifier', 'p7'), ['terms', ['bt', ['func', ('identifier', 'f3'), ['terms', ['bt', ['const', ('identifier','a')]], ['bt', ['const', ('identifier', 'b')]], ['bt', ['const', ('identifier', 'd')]]]]]]]]],['literal', ['patom', ('identifier', 'p8'), ['terms', ['bt', ['num', ['pos', ('numeral', '1')]]]]]]], ['neg_literal', ['patom', ('identifier', 'p9')]]]]]]

# Assign values to nodes in the control flow:
def assign():
    global translated # is an ASP program
    global transformed # is a parsed ASP program
    global rewritten # is an incomplete dictionary parsed ASP program
    global reassembled # is a dictionary parsed ASP program
    translated = translate(parsed)
    transformed = transform(parsed)
    rewritten = rewrite(list_to_dict(parsed))
    reassembled = reassemble(rewritten)

########## ########## ########## ########## ########## ########## ########## ##########

assign()

print(translated)

# Write the ASP program to the file named file_translated:
file_translated = open('file_translated', 'w')
file_translated.write(translated)
file_translated.close()
