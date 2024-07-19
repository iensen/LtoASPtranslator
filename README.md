<h6>top

# L solver

## Description
- Given a program in the logic-programming language L, the L solver produces models and answers queries.
- This program combines
  - the L-to-ASP translator (by [Evgenii Balai][evgeniiProfile] & [Vu Phan][vuProfile]),
  - Sparc (by [Evgenii Balai][evgeniiProfile]), and
  - Clingo (by [Potassco](https://potassco.org)).

## Example
- [Source L program][l_file]
- [Translated ASP program][sp_file]
- [Output models][txt_file]
- [Demo video][demo_video]

## Requirement
Python 3.4 or higher

## Command-line interface
- Change current directory to `src`  
  *Example with Windows Command Prompt:*  
  `cd src`
- Specify where to read source L program and **overwrite** translated ASP program  
  `python3 translator.py examples/ranking.l > examples/ranking.sp`
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

## References
- [L language][l_spec]
- [L-to-ASP translator][translator_spec]
- [Sparc][sparc_manual]
- [Clingo][clingo_guide]

[evgeniiProfile]:https://scholar.google.com/citations?user=d6I2820AAAAJ
[vuProfile]:https://vuphan314.github.io/

[l_file]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
[sp_file]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.sp
[txt_file]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.txt
[demo_video]:https://youtu.be/VbqYOFqB3CQ?list=PLIJKsTidP3ztShBMVE3yybcoF8rhtf8HB

[l_spec]:https://github.com/iensen/LtoASPtranslator/blob/master/Lspec/Lspec.pdf
[translator_spec]:https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_spec.md
[sparc_manual]:https://github.com/iensen/sparc/blob/master/User_Manual/Sparc_Manual.pdf
[clingo_guide]:http://sourceforge.net/projects/potassco/files/guide/2.0/guide-2.0.pdf
