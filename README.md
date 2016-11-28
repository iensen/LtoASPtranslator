<h6>top

# L SOLVER
- Description
  - Produces answer sets of programs written in logic programming language L
  - Combines
    - L-ASP translator (Evgenii Balai & [Vu Phan][vuCV])
    - Sparc (Evgenii Balai)
    - Clingo (Potassco)
- Example
  - [**_SOURCE L PROGRAM_**][.l]
  - [**_TRANSLATED ASP PROGRAM_**][.sp]
  - [**_OUTPUT MODELS_**][.txt]
- [Demo video][youtubeL]

## SOURCECODE
- Python 3.4 or higher
- Command-line syntax
  - Change current directory to `src`  
    *Example with Windows Command Prompt:*  
    `cd/d E:\git\LtoASPtranslator\src`
  - Specify where to read source L program and OVERWRITE translated ASP program  
    `python translator.py examples/ranking.l > examples/ranking.sp`
  - Choose mode
    - **Answer set mode**  
      Specify where to read translated ASP program  
      `java -jar sparc.jar -solver clingo examples/ranking.sp -A -loutput`
    - **Querying mode**  
      - Specify where to read translated ASP program  
        `java -jar sparc.jar -solver clingo examples/ranking.sp`
      - Query  
        `?- student_rank(S, R)`  
        (Press Enter until `?- ` reappears)
      - Quit  
        `exit`

## REFERENCES
- [L specification][Lspec]
- [L parser guide][parser]
- [L-ASP translator specification][translator_spec]
- [Sparc manual][Sparc]
- [Clingo guide][Clingo]

[vuCV]: 
https://www.myweb.ttu.edu/vuphan/

[.l]: 
https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
[.sp]: 
https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.sp
[.txt]: 
https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.txt

[youtubeL]:
https://youtu.be/VbqYOFqB3CQ?list=PLIJKsTidP3ztShBMVE3yybcoF8rhtf8HB

[Lspec]: 
https://github.com/iensen/LtoASPtranslator/blob/master/Lspec/Lspec.pdf
[parser]: 
https://github.com/iensen/LtoASPtranslator/blob/master/docs/Lparser_guide.md#top
[translator_spec]: 
https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_spec.md#top
[Sparc]: 
https://github.com/iensen/sparc/blob/master/User_Manual/Sparc_Manual.pdf
[Clingo]: 
http://sourceforge.net/projects/potassco/files/guide/2.0/guide-2.0.pdf
