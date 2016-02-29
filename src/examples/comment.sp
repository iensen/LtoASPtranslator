
sorts

#t = {1, 2, 3}.
#p_1_termS = {3, 1, 2}.
#q_1_termS = {3, 1, 2}.

predicates

p(#p_1_termS).
q(#q_1_termS).


rules

p(X) :- q(X), #t(X).
-p(CWA_Var_1) :- not p(CWA_Var_1), #p_1_termS(CWA_Var_1).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).

display

p. q. 
