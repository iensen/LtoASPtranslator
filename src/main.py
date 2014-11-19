"""
Copyright (c) 2014, Evgenii Balai
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY EVGENII BALAI "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL EVGENII BALAI OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.
"""

from optparse import OptionParser

from preprocessor import *


def parse_arguments():
    """
    Returns the arguments passed to the program. The arguments are parsed from sys.argv.
    """
    parser = OptionParser()
    return parser.parse_args()[1]


def main():
    """
    Main entry point into the program.  Parse the command line arguments of the
    form  [program_file].
    Initialize the preprocessor with the contents of the file.
    Remove comments and print the list of program elements found in the file.
    """

    # read arguments
    args = parse_arguments()

    program_file = args[0]

    
    # create preprocessor instance
    preprocessor_instance = Preprocessor(program_file)

    # print the list of program elements
    print(preprocessor_instance.get_elements())


if __name__ == '__main__':
    main()