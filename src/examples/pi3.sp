
sorts

#t1 = {5, 6, 7}.
#t2 = {0, 1, 2}.
#q_1_termS = {7, 6, 5}.
#p_1_termS = {0, 1, 2}.

predicates

p(#p_1_termS).
q(#q_1_termS).


rules

p(N) :- q((N + 5)), #t2(N).
q(N) | -q(N) :- #t1(N).
:- 1 > #count{0, N: q(N), #t1(N)}.
:- 2 < #count{0, N: q(N), #t1(N)}.
-p(CWA_Var_1) :- not p(CWA_Var_1), #p_1_termS(CWA_Var_1).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).

display

p. q. 
