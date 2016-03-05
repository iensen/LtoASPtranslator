
sorts

#type1 = {1, 2, 5}.
#type2 = {1, 2}.
#t_2_termS = {2, 1}.
#q_1_termS = {2, 5, 1}.
#t_1_termS = {2, 5, 1}.
#p_2_termS = {2, 1}.
#p_1_termS = {2, 5, 1}.

predicates

t(#t_1_termS, #t_2_termS).
q(#q_1_termS).
p(#p_1_termS, #p_2_termS).


rules

p(X, Y) :- (X + Y) = 7, #type1(X), #type2(Y).
q(X) | -q(X) :- #type1(X).
:- 2 < #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
:- 1 > #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
-t(CWA_Var_1, CWA_Var_2) :- not t(CWA_Var_1, CWA_Var_2), #t_1_termS(CWA_Var_1), #t_2_termS(CWA_Var_2).
-p(CWA_Var_1, CWA_Var_2) :- not p(CWA_Var_1, CWA_Var_2), #p_1_termS(CWA_Var_1), #p_2_termS(CWA_Var_2).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).

display

t. q. p. 
