%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#student = 
	{ann, bree, cher, dale, flo, gray}.

#quiz_num = 
	1..2.

#quiz = 
	{q(2), q(1)}.

#exam_num = 
	1..3.

#exam = 
	{e(3), e(2), e(1)}.

#assessment = 
	#quiz + 
	#exam.

#quiz_grade = 
	{pass, fail}.

#exam_grade = 
	{a, b, c, d, f}.

#grade = 
	#quiz_grade + 
	#exam_grade.

#acceptable_grade = 
	#grade - 
	{fail, f}.

#rank = 
	{outstanding, above_average, average, below_average, inferior}.

#types = 
	#student + 
	#quiz_num + 
	#quiz + 
	#exam_num + 
	#exam + 
	#assessment + 
	#quiz_grade + 
	#exam_grade + 
	#grade + 
	#acceptable_grade + 
	#rank.

#rule_gterms = 
	{outstanding, average, b, d, inferior, q(2), gray, 1, c, f, cher, flo, fail, dale, q(1), e(2), e(3), below_average, above_average, bree, a, pass, 0, ann, e(1)}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

assessment_score(#universal, #universal, #universal).
student_remaining(#universal).
student_rank(#universal, #universal).
higher_rank(#universal, #universal).
acceptable_assessment(#universal, #universal).
student_dropped(#universal).
student_meets_criterion(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-higher_rank(AutoVar0, AutoVar1) :-
	not higher_rank(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-student_remaining(AutoVar0) :-
	not student_remaining(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-student_dropped(AutoVar0) :-
	not student_dropped(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-student_meets_criterion(AutoVar0, AutoVar1) :-
	not student_meets_criterion(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-assessment_score(AutoVar0, AutoVar1, AutoVar2) :-
	not assessment_score(AutoVar0, AutoVar1, AutoVar2),
	#universal(AutoVar0),
	#universal(AutoVar1),
	#universal(AutoVar2).

% Closed-World Assumption:
-student_rank(AutoVar0, AutoVar1) :-
	not student_rank(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-acceptable_assessment(AutoVar0, AutoVar1) :-
	not acceptable_assessment(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

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

acceptable_assessment(S, A) :-
	assessment_score(S, A, b),
	#student(S),
	#assessment(A).

acceptable_assessment(S, A) :-
	assessment_score(S, A, d),
	#student(S),
	#assessment(A).

acceptable_assessment(S, A) :-
	assessment_score(S, A, pass),
	#student(S),
	#assessment(A).

acceptable_assessment(S, A) :-
	assessment_score(S, A, c),
	#student(S),
	#assessment(A).

acceptable_assessment(S, A) :-
	assessment_score(S, A, a),
	#student(S),
	#assessment(A).

higher_rank(outstanding, above_average).

higher_rank(above_average, average).

higher_rank(average, below_average).

higher_rank(below_average, inferior).

higher_rank(R1, R3) :-
	higher_rank(R1, R2),
	higher_rank(R2, R3),
	#rank(R1),
	#rank(R3),
	#rank(R2).

student_meets_criterion(S, outstanding) :-
	acceptable_assessment(S, q(2)),
	acceptable_assessment(S, e(1)),
	acceptable_assessment(S, q(1)),
	acceptable_assessment(S, e(3)),
	acceptable_assessment(S, e(2)),
	assessment_score(S, e(1), a),
	assessment_score(S, e(3), a),
	assessment_score(S, e(2), a),
	#student(S).

student_meets_criterion(S, above_average) :-
	acceptable_assessment(S, q(2)),
	acceptable_assessment(S, e(1)),
	acceptable_assessment(S, q(1)),
	acceptable_assessment(S, e(3)),
	acceptable_assessment(S, e(2)),
	assessment_score(S, E1, a),
	assessment_score(S, E2, a),
	E1 != E2,
	#student(S),
	#exam(E1),
	#exam(E2).

student_meets_criterion(S, average) :-
	assessment_score(S, e(1), a),
	acceptable_assessment(S, q(2)),
	acceptable_assessment(S, e(1)),
	acceptable_assessment(S, q(1)),
	acceptable_assessment(S, e(3)),
	acceptable_assessment(S, e(2)),
	#student(S).

student_meets_criterion(S, average) :-
	assessment_score(S, e(3), a),
	acceptable_assessment(S, q(2)),
	acceptable_assessment(S, e(1)),
	acceptable_assessment(S, q(1)),
	acceptable_assessment(S, e(3)),
	acceptable_assessment(S, e(2)),
	#student(S).

student_meets_criterion(S, average) :-
	assessment_score(S, e(2), a),
	acceptable_assessment(S, q(2)),
	acceptable_assessment(S, e(1)),
	acceptable_assessment(S, q(1)),
	acceptable_assessment(S, e(3)),
	acceptable_assessment(S, e(2)),
	#student(S).

student_meets_criterion(S, below_average) :-
	acceptable_assessment(S, q(2)),
	acceptable_assessment(S, e(1)),
	acceptable_assessment(S, q(1)),
	acceptable_assessment(S, e(3)),
	acceptable_assessment(S, e(2)),
	#student(S).

student_meets_criterion(cher, inferior).

student_meets_criterion(dale, inferior).

student_meets_criterion(flo, inferior).

student_meets_criterion(gray, inferior).

student_meets_criterion(bree, inferior).

student_meets_criterion(ann, inferior).

-student_rank(S, R2) :-
	-student_meets_criterion(S, R2),
	#student(S),
	#rank(R2),
	#rank(R2),
	#rank(R1).

-student_rank(S, R2) :-
	student_meets_criterion(S, R1),
	higher_rank(R1, R2),
	#student(S),
	#rank(R2),
	#rank(R2),
	#rank(R1).

student_dropped(gray).

student_remaining(S) :-
	-student_dropped(S),
	#student(S).

student_rank(S, R) |
-student_rank(S, R) :-
	student_remaining(S),
	#student(S),
	#rank(R).

:-	1 > #count{0, R: student_rank(S, R), #student(S), #rank(R)},
	student_remaining(S).

:-	1 < #count{0, R: student_rank(S, R), #student(S), #rank(R)},
	student_remaining(S).


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

assessment_score.
student_remaining.
student_rank.
higher_rank.
acceptable_assessment.
student_dropped.
student_meets_criterion.

