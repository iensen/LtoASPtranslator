[source L program]: https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
[translated ASP program]: https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.sp
[output models]: https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.txt
[L SOLVER STANDALONE]: https://github.com/iensen/LtoASPtranslator/blob/master/Lsolver.zip?raw=true
[L SOLVER SOURCE CODE]: https://github.com/iensen/LtoASPtranslator/archive/master.zip
[L specification]: https://github.com/iensen/LtoASPtranslator/blob/master/Lspec/Lspec.pdf
[L parser guide]: https://github.com/iensen/LtoASPtranslator/blob/master/docs/Lparser_guide.txt
[L-ASP translator specification]: https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_spec.txt
[Sparc manual]: https://github.com/iensen/sparc/blob/master/User_Manual/Sparc_Manual.pdf
[Clingo guide]: http://sourceforge.net/projects/potassco/files/guide/2.0/guide-2.0.pdf

# L SOLVER
- Description
  - Produces answer sets of programs written in logic programming language L
  - Combines
    - L-ASP translator (Evgenii Balai & Vu Phan)
    - Sparc (Evgenii Balai)
    - Clingo (Potassco)
- Example: [source L program], [translated ASP program], and [output models]

## [L SOLVER STANDALONE]
For Windows

## [L SOLVER SOURCE CODE]
- Python 3.4 or higher
- Command-line syntax
  - Change current directory to `src`  
    *Example with Windows Command Prompt:*  
    `cd/d E:/LtoASPtranslator/src`
  - Specify where to read source L program and OVERWRITE translated ASP program  
    `python translator.py examples/ranking.l > examples/ranking.sp`
  - Choose mode
    - *Answer set mode*  
      Specify where to read translated ASP program  
      `java -jar sparc.jar -solver clingo examples/ranking.sp -A -loutput`
    - *Querying mode*  
      - Specify where to read translated ASP program  
        `java -jar sparc.jar -solver clingo examples/ranking.sp`
      - Query  
        `?- student_rank(S, R)`  
        (Press Enter until `?- ` reappears)
      - Quit  
        `exit`

## REFERENCES
- [L specification]
- [L parser guide]
- [L-ASP translator specification]
- [Sparc manual]
- [Clingo guide]
