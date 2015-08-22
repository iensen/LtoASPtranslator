import transformer
import unparser

'''
translate: translate a parsed L program into an ASP program

Input: a parsed L program:
[['tdecl',...], ['rule',...],...]

Output: an ASP program:
'sorts... predicates... rules...'

translate: list -> str
'''
def translate(T):
    return unparser.unparse(transformer.transform(T))
