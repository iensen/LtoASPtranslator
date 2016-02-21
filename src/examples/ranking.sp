
sorts

#student = {ann, bree, cher, dale, flo, gray}.
#quiz_num = 1..2.
#quiz = {q(2), q(1)}.
#exam_num = 1..3.
#exam = {e(2), e(1), e(3)}.
#assessment = #quiz + #exam.
#quiz_grade = {pass, fail}.
#exam_grade = {a, b, c, d, f}.
#grade = #quiz_grade + #exam_grade.
#acceptable_grade = #grade - {fail, f}.
#rank = {outstanding, above_average, average, below_average, inferior}.
#type_termS = #student + #quiz_num + #quiz + #exam_num + #exam + #assessment + #quiz_grade + #exam_grade + #grade + #acceptable_grade + #rank.
#rule_termS = {above_average, 2, e(1), inferior, q(2), cher, f, ann, 3, e(2), bree, gray, outstanding, 1, below_average, pass, dale, flo, b, d, q(1), average, a, e(3), fail, c}.
#prog_termS = #type_termS + #rule_termS.

predicates

student_remaining(#prog_termS). student_meets_criterion(#prog_termS, #prog_termS). student_rank(#prog_termS, #prog_termS). acceptable_assessment(#prog_termS, #prog_termS). higher_rank(#prog_termS, #prog_termS). assessment_score(#prog_termS, #prog_termS, #prog_termS). student_dropped(#prog_termS). 

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
acceptable_assessment(S, A) :- assessment_score(S, A, Some0), #student(S), #assessment(A), #acceptable_grade(Some0).
higher_rank(outstanding, above_average).
higher_rank(above_average, average).
higher_rank(average, below_average).
higher_rank(below_average, inferior).
higher_rank(R1, R3) :- higher_rank(R1, R2), higher_rank(R2, R3), #rank(R2), #rank(R1), #rank(R3).
student_meets_criterion(S, outstanding) :- acceptable_assessment(S, e(2)), acceptable_assessment(S, e(1)), acceptable_assessment(S, q(1)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(2)), assessment_score(S, e(2), a), assessment_score(S, e(1), a), assessment_score(S, e(3), a), #student(S).
student_meets_criterion(S, above_average) :- acceptable_assessment(S, e(2)), acceptable_assessment(S, e(1)), acceptable_assessment(S, q(1)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(2)), assessment_score(S, E1, a), assessment_score(S, E2, a), E1 != E2, #exam(E1), #exam(E2), #student(S).
student_meets_criterion(S, average) :- acceptable_assessment(S, e(2)), acceptable_assessment(S, e(1)), acceptable_assessment(S, q(1)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(2)), assessment_score(S, Some0, a), #student(S), #exam(Some0).
student_meets_criterion(S, below_average) :- acceptable_assessment(S, e(2)), acceptable_assessment(S, e(1)), acceptable_assessment(S, q(1)), acceptable_assessment(S, e(3)), acceptable_assessment(S, q(2)), #student(S).
student_meets_criterion(Every0, inferior) :- #student(Every0).
-student_rank(S, R2) :- -student_meets_criterion(S, R2), #rank(R2), #student(S).
-student_rank(S, R2) :- student_meets_criterion(S, R1), higher_rank(R1, R2), #rank(R2), #rank(R1), #student(S).
student_dropped(gray).
student_remaining(S) :- -student_dropped(S), #student(S).
student_rank(S, R) | -student_rank(S, R) :- student_remaining(S), #rank(R), #student(S).
:- 1 > #count{0, R: student_rank(S, R), #rank(R)}, student_remaining(S), #student(S).
:- 1 < #count{0, R: student_rank(S, R), #rank(R)}, student_remaining(S), #student(S).
-student_rank(CWA0, CWA1) :- not student_rank(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-assessment_score(CWA0, CWA1, CWA2) :- not assessment_score(CWA0, CWA1, CWA2), #prog_termS(CWA0), #prog_termS(CWA2), #prog_termS(CWA1).
-student_meets_criterion(CWA0, CWA1) :- not student_meets_criterion(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-acceptable_assessment(CWA0, CWA1) :- not acceptable_assessment(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-student_dropped(CWA0) :- not student_dropped(CWA0), #prog_termS(CWA0).
-student_remaining(CWA0) :- not student_remaining(CWA0), #prog_termS(CWA0).
-higher_rank(CWA0, CWA1) :- not higher_rank(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).

display

student_remaining. student_meets_criterion. student_rank. acceptable_assessment. higher_rank. assessment_score. student_dropped. 
