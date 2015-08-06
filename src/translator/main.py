import adjuster
import linker
import unparser

'''
Translate parsed L program into ASP

Input: parsed L program: 
[['tdecl',...], ['rule',...],...]

Output: ASP program: 
'sorts ... predicates ... rules ...'

translate: list -> str
'''
def translate(T):
    adjusted = adjuster.adjust(T)
    linked = linker.link(adjusted)
    unparsed = unparser.unparse(linked)
    return unparsed
