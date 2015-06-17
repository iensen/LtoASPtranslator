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

import re





class Preprocessor:
    """The preprocessor takes an L program, removes comments from it, and splits
    it into a list of substring each of which stores a rule
    (if the program has the right syntax)
    In case the program has syntax errors, either exception is thrown or
    some of the chunks may not store a valid rules
    """

    def __init__(self, program_file):
        """Read the program file; initialize lexer and parser instances
        """

        self.program_file = open(program_file)

        # the number of the line that contains the
        # first character that has not been read yet (by calling next_char function)
        self.line_number = 1

        # in_comment is true if /* was read from the file
        # but the corresponding matching end was not reached
        self.in_comment = False

        # a buffer that may store some characters in the set {/,*}
        # that have been read from the file
        # when next_char is called, it should first check
        # if the buffer is empty
        # if it is not, then it should return the first character
        # and remove it from the buffer
        self.buf = []



    def get_chunks(self):
        chunks = []
        chunk = self.next_chunk()
        while chunk is not None:
            chunks.append(chunk)
            chunk = self.next_chunk()
        return chunks

    def next_chunk(self):
        """
        :return: next chunk representing a rule (if it exists) or None if the part
        of file  that has not been read only contains comments and spaces
        throws syntax error if the file has some non-space characters left, but does not
        have a dot before the next comment or the end of the file.
        the function must be called when self.in_comment is False!

        """

        self.skip_comments()

        chunk = []
        char = self.next_nonspace_char()

        opened_curly_braces = 0
        while (char != '.' or opened_curly_braces !=0) and char != None:

           if char == '*' and chunk and chunk[-1] == '/':
               # comment starts inside a rule
               chunk = chunk[:-1]
               self.buf.append('/')
               self.buf.append('*')
               self.skip_comments()
           else:
               if char == '}':
                   opened_curly_braces-=1
               if char == '{':
                   opened_curly_braces+=1
               chunk.append(char)
           char = self.next_char()
        if char is not None:
            # append the last dot
            chunk.append(char)
        chunk = ''.join(chunk)
        spaces_regex = re.compile(r"^\s*\Z")
        if spaces_regex.match(chunk) is not None:
            return None
        else:
            return RuleChunk(chunk, self.line_number)


    def skip_comments(self):
        charb1 = self.next_nonspace_char()
        if charb1 == '/':
            comment_begin_line = self.line_number
            charb2 = self.next_char()
            if charb2 == '*':
                # find the matching end of the comment
                found = False
                while not found:
                    charf1 = self.next_char()
                    while charf1 != '*' and charf1 is not None:
                         charf1 = self.next_char()
                    charf2 = self.next_char()
                    # the comment may end with ***...***/;
                    # skip all stars before /,
                    while charf2 == '*' and charf1 is not None:
                         charf2 = self.next_char()
                    if charf1 is None or charf2 is None:
                        raise UnmatchedComment(comment_begin_line)
                    if charf2 == '/':
                        self.skip_comments()
                        found = True
        else:
            self.buf = [charb1]



    def next_char(self):
        """returns the next character in the file
        """
        if len(self.buf) == 0:
             char = self.program_file.read(1)
        else:
             char = self.buf[0]
             self.buf = self.buf[1:]

        if char == '':
            return None # end of file

        if char == '\n':
            self.line_number += 1

        return char

    def next_nonspace_char(self):
        char = self.next_char()
        if char is None :
            return None
        if char.isspace():
            return self.next_nonspace_char()
        return char









class UnmatchedComment(Exception):
    """
    Defines a class for representing exceptions which are thrown in the event of
    an invalid lexeme declaration in the lexicon file
    """

    def __init__(self, line_number):
        super(UnmatchedComment, self).__init__()
        self.line_number = line_number

    def __repr__(self):
        return "The program file contains an unmatched " \
               "comment starting from line " \
               "number " + str(self.line_number) + "."

    def __str__(self):
        return self.__repr__()


class InvalidProgramElement(Exception):
    """
    Defines a class for representing exceptions which are thrown in the event of
    a (syntactically) invalid program element in the program file
    """

    def __init__(self, contents, line_number):
        super(InvalidProgramElement, self).__init__()
        self.contents = contents
        self.line_number = line_number

    def __repr__(self):
        return "The program file contains an invalid program element " \
               + self.contents + " in the" \
                                 " region starting from line " \
                                 "number " + str(self.line_number) + "."

    def __str__(self):
        return self.__repr__()


class RuleChunk:
    """ the class represents a substring of the input file
        ending with a dot
        which stores a rule (given the has no syntax errors)
    """
    def __init__(self, text, line_number):
        self.text = text
        self.line_number = line_number




