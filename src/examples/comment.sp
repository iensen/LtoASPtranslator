
sorts

#t = {1, 2, 3}.
#p_1_termS = {1, 3, 2}.
#q_1_termS = {1, 3, 2}.

predicates

q(#q_1_termS).
p(#p_1_termS).


rules

p(X) :- q(X), #t(X).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).
-p(CWA_Var_1) :- not p(CWA_Var_1), #p_1_termS(CWA_Var_1).

display

q. p. 
