import adjuster
import linker
import unparser

# Translate parsed L program into ASP
# Input: parsed L program: [['tdecl',...], ['rule',...],...]
# Output: ASP program: 'sorts ... predicates ... rules ...'
# translate: list -> str
def translate(T):
    adjusted = adjuster.program(T)
    linked = linker.program(adjusted)
    unparsed = unparser.program(linked)
    return unparsed

# Submodules of 'linker':
import transformer
import extractor
