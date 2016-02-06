# L-ASP TRANSLATOR: 2016/02/06 MONTHLY REPORT

## PROGRESS
after 2016/01/05 monthly report:
- fixes:
  - corrected errors in program `brain.l`
  - now fully support arithmetic
  - collect and declare all program terms required in Sparc `sorts` section
    - including subterms of functional terms
  - no more redundant sort atoms after CNF/DNF transformation
  - when translating quantified terms, using variables when possible
    - instead of conjunctions/disjunctions of ground terms
      - to shorten target ASP program
    - making use of ASP implicit quantification:
      - universal in head
      - existential in body
- reorganized source code
- updated [translator spec][translator_spec]

## EXAMPLES
16 syntactically correct [examples][ex]:
- L source programs (.l), including:
  - 3 documented, semantically correct programs:
    - [ch5.l][ch5]
    - [graphs.l][graphs]
    - [ranking.l][ranking]
- Translated ASP programs (.sp)
- Output models (.txt)

## REFERENCES
- [Issues]
- [README]
- Zip downloads (including examples):
  - [L solver standalone][exe] (Windows)
  - [L solver source code][py]
  
[translator_spec]: https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_spec.md
[ex]:https://github.com/iensen/LtoASPtranslator/tree/master/src/examples
[ch5]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ch5.l
[graphs]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/graphs.l
[ranking]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
[issues]:https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_issues.md
[README]:https://github.com/iensen/LtoASPtranslator/blob/master/README.md
[exe]:https://github.com/iensen/LtoASPtranslator/blob/master/Lsolver.zip?raw=true
[py]:https://github.com/iensen/LtoASPtranslator/blob/master/src.zip?raw=true
