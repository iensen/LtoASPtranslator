
sorts

#node = 1..5.
#edge_2_termS = {5, 3, 2, 4, 1}.
#reachable_2_termS = {5, 3, 2, 4, 1}.
#removed_1_termS = {5, 3, 2, 4, 1}.
#edge_1_termS = {5, 3, 2, 4, 1}.
#reachable_1_termS = {5, 3, 2, 4, 1}.

predicates

removed(#removed_1_termS).
disconnected().
edge(#edge_1_termS, #edge_2_termS).
reachable(#reachable_1_termS, #reachable_2_termS).


rules

:- 0 > #count{0, N: removed(N), #node(N)}.
:- 1 < #count{0, N: removed(N), #node(N)}.
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 1) - 5 * (Y + 1) / 5), #node(Y), #node(X).
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 2) - 5 * (Y + 2) / 5), #node(Y), #node(X).
removed(N) | -removed(N) :- #node(N).
reachable(X, X) :- -removed(X), #node(X).
reachable(X, Y) :- edge(X, Y), -removed(X), -removed(Y), #node(Y), #node(X).
reachable(X, Y) :- reachable(X, Z), reachable(Z, Y), -removed(X), -removed(Y), -removed(Z), #node(Y), #node(X), #node(Z).
disconnected :- -reachable(X, Y), -removed(X), -removed(Y), #node(Y), #node(X).
:- 1 < #count{0: disconnected}.
:- 1 > #count{0: disconnected}.
-disconnected :- not disconnected.
-edge(CWA_Var_1, CWA_Var_2) :- not edge(CWA_Var_1, CWA_Var_2), #edge_2_termS(CWA_Var_2), #edge_1_termS(CWA_Var_1).
-reachable(CWA_Var_1, CWA_Var_2) :- not reachable(CWA_Var_1, CWA_Var_2), #reachable_2_termS(CWA_Var_2), #reachable_1_termS(CWA_Var_1).
-removed(CWA_Var_1) :- not removed(CWA_Var_1), #removed_1_termS(CWA_Var_1).

display

removed. disconnected. edge. reachable. 
