
sorts

#node = 1..5.
#type_termS = #node.
#rule_termS = {5, 2, 4, 1, 3}.
#prog_termS = #type_termS + #rule_termS.

predicates

edge(#prog_termS, #prog_termS). removed(#prog_termS). reachable(#prog_termS, #prog_termS). disconnected(). 

rules

:- 0 > #count{0, N: removed(N), #node(N)}.
:- 1 < #count{0, N: removed(N), #node(N)}.
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 1) - 5 * (Y + 1) / 5), #node(X), #node(Y).
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 2) - 5 * (Y + 2) / 5), #node(X), #node(Y).
removed(N) | -removed(N) :- #node(N).
reachable(X, X) :- -removed(X), #node(X).
reachable(X, Y) :- edge(X, Y), -removed(X), -removed(Y), #node(X), #node(Y).
reachable(X, Y) :- reachable(X, Z), reachable(Z, Y), -removed(X), -removed(Y), -removed(Z), #node(X), #node(Y), #node(Z).
disconnected :- -reachable(X, Y), -removed(X), -removed(Y), #node(X), #node(Y).
:- 1 > #count{0: disconnected}.
:- 1 < #count{0: disconnected}.
-disconnected :- not disconnected.
-edge(CWA0, CWA1) :- not edge(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-removed(CWA0) :- not removed(CWA0), #prog_termS(CWA0).
-reachable(CWA0, CWA1) :- not reachable(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).

display

edge. removed. reachable. disconnected. 
