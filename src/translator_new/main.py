import adjuster
import linker
import unparser

# Convert a parsed L program into an ASP program
# translate: list -> str
def translate(P):
    adjusted = adjuster.program(P)
    linked = linker.program(adjusted)
    unparsed = unparser.program(linked)
    return unparsed

########## ########## ########## ########## ########## ########## ########## ##########

# Submodules of linker (unnecessary for running 'main', but added for testing):
import transformer
import extractor
