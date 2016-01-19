# L SOLVER
- Description
  - Produces answer sets of programs written in logic programming language L
  - Combines
    - L-ASP translator (Evgenii Balai & Vu Phan)
    - Sparc (Evgenii Balai)
    - Clingo (Potassco)
- Example
  - [**_SOURCE L PROGRAM_**][.l]
  - [**_TRANSLATED ASP PROGRAM_**][.sp]
  - [**_OUTPUT MODELS_**][.txt]

## [L SOLVER STANDALONE][exe]
For Windows

## [L SOLVER SOURCE CODE][py]
- Python 3.4 or higher
- Command-line syntax
  - Change current directory to `src`  
    *Example with Windows Command Prompt:*  
    `cd/d E:/LtoASPtranslator/src`
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
- [L specification][L]
- [L parser guide][parser]
- [L-ASP translator specification][translator]
- [Sparc manual][Sparc]
- [Clingo guide][Clingo]

[.l]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
[.sp]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.sp
[.txt]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.txt
[exe]:https://github.com/iensen/LtoASPtranslator/blob/master/Lsolver.zip?raw=true
[py]:https://github.com/iensen/LtoASPtranslator/blob/master/src.zip?raw=true
[L]:https://github.com/iensen/LtoASPtranslator/blob/master/Lspec/Lspec.pdf
[parser]:https://github.com/iensen/LtoASPtranslator/blob/master/docs/Lparser_guide.txt
[translator]:https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_spec.txt
[Sparc]:https://github.com/iensen/sparc/blob/master/User_Manual/Sparc_Manual.pdf
[Clingo]:http://sourceforge.net/projects/potassco/files/guide/2.0/guide-2.0.pdf
