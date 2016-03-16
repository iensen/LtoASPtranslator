# L-EDITOR: 2016/03/15 FINAL REPORT

## [INTEGRATED L-EDITOR][certware-l-editor]
- is implemented by Dr. Barry
- is an Eclipse plugin
- [L-editor spec][leditorspec]
- [L-editor zip][leditorzip]
	- temporary
	- requires much Eclipse configuration before using

## [L-SOVER][LtoASPtranslator]
- is implemented by Evgenii and Vu
- is an Eclipse plugin fragment, with the L-editor being the host plugin
- [L spec][lspec]
- [L tutorial][ltutorial]

## EXAMPLES
14 syntactically correct [examples][exs]:
- source programs in L (.l), including:
  - 3 documented, semantically correct programs:
    - [ch5.l][ch5]
    - [graphs.l][graphs]
    - [ranking.l][ranking]
- translated programs in SPARC (.sp)
- output models (.txt)

## REFERENCES
- [L-solver issues][issues]
- [L-solver README][README]

[certware-l-editor]: https://github.com/mrbkt/certware-l-editor
[LtoASPtranslator]: https://github.com/iensen/LtoASPtranslator

[leditorspec]: https://github.com/mrbkt/certware-l-editor/blob/master/certware-l-editor-manual/LEditorSpec.pdf
[leditorzip]: https://github.com/mrbkt/certware-l-editor/archive/master.zip

[lspec]: https://github.com/iensen/LtoASPtranslator/blob/master/Lspec/Lspec.pdf
[ltutorial]: https://github.com/iensen/LtoASPtranslator/blob/master/Ltutorial/Ltutorial.pdf

[exs]: https://github.com/iensen/LtoASPtranslator/tree/master/src/examples

[ch5]: https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ch5.l
[graphs]: https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/graphs.l
[ranking]: https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l

[issues]: https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_issues.md
[README]: https://github.com/iensen/LtoASPtranslator/blob/master/README.md
