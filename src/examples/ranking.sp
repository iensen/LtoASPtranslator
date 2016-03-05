
sorts

#student = {ann, bree, cher, dale, flo, gray}.
#quiz_num = 1..2.
#quiz = {q(1), q(2)}.
#exam_num = 1..3.
#exam = {e(3), e(1), e(2)}.
#assessment = #quiz + #exam.
#quiz_grade = {pass, fail}.
#exam_grade = {a, b, c, d, f}.
#grade = #quiz_grade + #exam_grade.
#acceptable_grade = #grade - {fail, f}.
#rank = {outstanding, above_average, average, below_average, inferior}.
#student_meets_criterion_2_termS = {below_average, outstanding, average, above_average, inferior}.
#higher_rank_2_termS = {below_average, outstanding, average, above_average, inferior}.
#acceptable_assessment_1_termS = {cher, gray, bree, flo, ann, dale}.
#student_meets_criterion_1_termS = {cher, gray, bree, flo, ann, dale}.
#student_rank_2_termS = {below_average, outstanding, average, above_average, inferior}.
#higher_rank_1_termS = {below_average, outstanding, average, above_average, inferior}.
#assessment_score_3_termS = {pass, a, d, fail, c, b, f}.
#assessment_score_2_termS = {q(1), e(3), 2, q(2), 3, e(1), e(2), 1}.
#student_dropped_1_termS = {ann, cher, gray, dale, bree, flo}.
#acceptable_assessment_2_termS = {q(1), e(3), 2, q(2), 3, e(1), e(2), 1}.
#student_remaining_1_termS = {cher, gray, bree, flo, ann, dale}.
#assessment_score_1_termS = {cher, gray, bree, flo, ann, dale}.
#student_rank_1_termS = {cher, gray, bree, flo, ann, dale}.

predicates

student_meets_criterion(#student_meets_criterion_1_termS, #student_meets_criterion_2_termS).
acceptable_assessment(#acceptable_assessment_1_termS, #acceptable_assessment_2_termS).
student_rank(#student_rank_1_termS, #student_rank_2_termS).
student_remaining(#student_remaining_1_termS).
assessment_score(#assessment_score_1_termS, #assessment_score_2_termS, #assessment_score_3_termS).
higher_rank(#higher_rank_1_termS, #higher_rank_2_termS).
student_dropped(#student_dropped_1_termS).


rules

assessment_score(ann, q(1), pass).
assessment_score(ann, q(2), pass).
assessment_score(ann, e(1), a).
assessment_score(ann, e(2), a).
assessment_score(ann, e(3), a).
assessment_score(bree, q(1), pass).
assessment_score(bree, q(2), pass).
assessment_score(bree, e(1), a).
assessment_score(bree, e(2), a).
assessment_score(bree, e(3), b).
assessment_score(cher, q(1), pass).
assessment_score(cher, q(2), pass).
assessment_score(cher, e(1), a).
assessment_score(cher, e(2), b).
assessment_score(cher, e(3), b).
assessment_score(dale, q(1), pass).
assessment_score(dale, q(2), pass).
assessment_score(dale, e(1), b).
assessment_score(dale, e(2), b).
assessment_score(dale, e(3), b).
assessment_score(flo, q(1), pass).
assessment_score(flo, q(2), fail).
assessment_score(flo, e(1), d).
assessment_score(flo, e(2), d).
assessment_score(flo, e(3), f).
assessment_score(gray, q(1), fail).
assessment_score(gray, e(1), f).
acceptable_assessment(S, A) :- assessment_score(S, A, Some0), #acceptable_grade(Some0), #assessment(A), #student(S).
higher_rank(outstanding, above_average).
higher_rank(above_average, average).
higher_rank(average, below_average).
higher_rank(below_average, inferior).
higher_rank(R1, R3) :- higher_rank(R1, R2), higher_rank(R2, R3), #rank(R3), #rank(R2), #rank(R1).
student_meets_criterion(S, outstanding) :- acceptable_assessment(S, e(1)), acceptable_assessment(S, e(2)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(1)), acceptable_assessment(S, q(2)), assessment_score(S, e(3), a), assessment_score(S, e(1), a), assessment_score(S, e(2), a), #student(S).
student_meets_criterion(S, above_average) :- acceptable_assessment(S, e(1)), acceptable_assessment(S, e(2)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(1)), acceptable_assessment(S, q(2)), assessment_score(S, E1, a), assessment_score(S, E2, a), E1 != E2, #exam(E2), #exam(E1), #student(S).
student_meets_criterion(S, average) :- acceptable_assessment(S, e(1)), acceptable_assessment(S, e(2)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(1)), acceptable_assessment(S, q(2)), assessment_score(S, Some0, a), #exam(Some0), #student(S).
student_meets_criterion(S, below_average) :- acceptable_assessment(S, e(1)), acceptable_assessment(S, e(2)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(1)), acceptable_assessment(S, q(2)), #student(S).
student_meets_criterion(Every0, inferior) :- #student(Every0).
-student_rank(S, R2) :- -student_meets_criterion(S, R2), #rank(R2), #student(S).
-student_rank(S, R2) :- student_meets_criterion(S, R1), higher_rank(R1, R2), #rank(R2), #rank(R1), #student(S).
student_dropped(gray).
student_remaining(S) :- -student_dropped(S), #student(S).
student_rank(S, R) | -student_rank(S, R) :- student_remaining(S), #rank(R), #student(S).
:- 1 > #count{0, R: student_rank(S, R), #rank(R)}, student_remaining(S), #student(S).
:- 1 < #count{0, R: student_rank(S, R), #rank(R)}, student_remaining(S), #student(S).
-student_dropped(CWA_Var_1) :- not student_dropped(CWA_Var_1), #student_dropped_1_termS(CWA_Var_1).
-student_meets_criterion(CWA_Var_1, CWA_Var_2) :- not student_meets_criterion(CWA_Var_1, CWA_Var_2), #student_meets_criterion_2_termS(CWA_Var_2), #student_meets_criterion_1_termS(CWA_Var_1).
-student_rank(CWA_Var_1, CWA_Var_2) :- not student_rank(CWA_Var_1, CWA_Var_2), #student_rank_2_termS(CWA_Var_2), #student_rank_1_termS(CWA_Var_1).
-assessment_score(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not assessment_score(CWA_Var_1, CWA_Var_2, CWA_Var_3), #assessment_score_3_termS(CWA_Var_3), #assessment_score_2_termS(CWA_Var_2), #assessment_score_1_termS(CWA_Var_1).
-higher_rank(CWA_Var_1, CWA_Var_2) :- not higher_rank(CWA_Var_1, CWA_Var_2), #higher_rank_2_termS(CWA_Var_2), #higher_rank_1_termS(CWA_Var_1).
-acceptable_assessment(CWA_Var_1, CWA_Var_2) :- not acceptable_assessment(CWA_Var_1, CWA_Var_2), #acceptable_assessment_2_termS(CWA_Var_2), #acceptable_assessment_1_termS(CWA_Var_1).
-student_remaining(CWA_Var_1) :- not student_remaining(CWA_Var_1), #student_remaining_1_termS(CWA_Var_1).

display

student_meets_criterion. acceptable_assessment. student_rank. student_remaining. assessment_score. higher_rank. student_dropped. 
