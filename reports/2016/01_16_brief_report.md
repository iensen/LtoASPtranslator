# L-ASP TRANSLATOR: 2016/01/16 BRIEF REPORT

## PROGRESS
After 2016/01/05 monthly report:
- Fixes:
  - Full arithmetic support
  - Collecting all program terms as required by Sparc
  - No more redundant terms after grounding
  - No more redundant sort atoms after CNF/DNF transformation
- Improvement:  
  When translating quantified terms, using variables when possible  
  (instead of conjunctions/disjunctions of ground terms)
  
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
- [README][README]
- Zip downloads (including examples):
  - [L solver standalone][exe] (Windows)
  - [L solver source code][py]

[ex]:https://github.com/iensen/LtoASPtranslator/tree/master/src/examples
[ch5]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ch5.l
[graphs]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/graphs.l
[ranking]:https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
[issues]:https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_issues.txt
[README]:https://github.com/iensen/LtoASPtranslator/blob/master/README.md
[exe]:https://github.com/iensen/LtoASPtranslator/blob/master/Lsolver.zip?raw=true
[py]:https://github.com/iensen/LtoASPtranslator/blob/master/src.zip?raw=true
