
sorts

#t1 = 1..2.
#t2 = #t1.
#t3 = #t2.
#p1_2_termS = {1, 2}.
#p2_1_termS = {1, 2}.
#p1_1_termS = {1, 2}.
#p3_1_termS = {1, 2}.

predicates

p3(#p3_1_termS).
p1(#p1_1_termS, #p1_2_termS).
p2(#p2_1_termS).


rules

:- 1 > #count{0, V1: p1(V1, V2), #t1(V1)}, p2(V2), p3(V3), #t3(V3), #t2(V2).
:- 1 < #count{0, V1: p1(V1, V2), #t1(V1)}, p2(V2), p3(V3), #t3(V3), #t2(V2).
-p2(CWA_Var_1) :- not p2(CWA_Var_1), #p2_1_termS(CWA_Var_1).
-p1(CWA_Var_1, CWA_Var_2) :- not p1(CWA_Var_1, CWA_Var_2), #p1_1_termS(CWA_Var_1), #p1_2_termS(CWA_Var_2).
-p3(CWA_Var_1) :- not p3(CWA_Var_1), #p3_1_termS(CWA_Var_1).

display

p3. p1. p2. 
