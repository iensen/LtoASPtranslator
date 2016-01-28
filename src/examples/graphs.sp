
sorts

#node = 1..5.
#type_termS = #node.
#rule_termS = {3, 2, 4, 1, 5}.
#prog_termS = #type_termS + #rule_termS.

predicates

edge(#prog_termS, #prog_termS). reachable(#prog_termS, #prog_termS). removed(#prog_termS). disconnected(). 

rules

:- 0 > #count{0, N: removed(N), #node(N)}.
:- 1 < #count{0, N: removed(N), #node(N)}.
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 1) - 5 * (Y + 1) / 5), #node(Y), #node(X).
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 2) - 5 * (Y + 2) / 5), #node(Y), #node(X).
removed(N) | -removed(N) :- #node(N).
reachable(X, X) :- -removed(X), #node(X).
reachable(X, Y) :- edge(X, Y), -removed(X), -removed(Y), #node(Y), #node(X).
reachable(X, Y) :- reachable(X, Z), reachable(Z, Y), -removed(X), -removed(Y), -removed(Z), #node(Y), #node(Z), #node(X).
disconnected :- -reachable(X, Y), -removed(X), -removed(Y), #node(Y), #node(X).
:- 1 > #count{0: disconnected}.
:- 1 < #count{0: disconnected}.
-removed(CWA0) :- not removed(CWA0), #prog_termS(CWA0).
-reachable(CWA0, CWA1) :- not reachable(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-disconnected :- not disconnected.
-edge(CWA0, CWA1) :- not edge(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).

display

edge. reachable. removed. disconnected. 
