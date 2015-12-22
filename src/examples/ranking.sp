%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#pass_fail_grade = 
	{pass, fail}.

#letter_grade = 
	{a, b, c, d, f}.

#grade = 
	#letter_grade + 
	#pass_fail_grade.

#acceptable_grade = 
	{pass, a, b, c, d}.

#unacceptable_grade = 
	#grade - 
	#acceptable_grade.

#satisfactory_rank = 
	{above_average, average, below_average}.

#student = 
	{ann, bob, chris, dennis}.

#quiz = 
	{q1, q2, q3}.

#exam = 
	{e1, e2}.

#assessment = 
	#quiz + 
	#exam.

#types = 
	#pass_fail_grade + 
	#letter_grade + 
	#grade + 
	#acceptable_grade + 
	#unacceptable_grade + 
	#satisfactory_rank + 
	#student + 
	#quiz + 
	#exam + 
	#assessment.

#rule_gterms = 
	{below_average, dennis, q1, above_average, chris, f, average, unsatisfactory, satisfactory, d, bob, ann, q2, fail, pass, b, a, e2, q3, c, e1}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

ranked(#universal, #universal).
evaluated(#universal, #universal).
has_score(#universal, #universal, #universal).
has_all_acceptable_assessments(#universal).
has_an_unacceptable_assessment(#universal).
has_an_excellent_exam(#universal).
has_a_good_exam(#universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-has_all_acceptable_assessments(AutoVar0) :-
	not has_all_acceptable_assessments(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-has_an_unacceptable_assessment(AutoVar0) :-
	not has_an_unacceptable_assessment(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-evaluated(AutoVar0, AutoVar1) :-
	not evaluated(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-has_a_good_exam(AutoVar0) :-
	not has_a_good_exam(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-has_score(AutoVar0, AutoVar1, AutoVar2) :-
	not has_score(AutoVar0, AutoVar1, AutoVar2),
	#universal(AutoVar0),
	#universal(AutoVar1),
	#universal(AutoVar2).

% Closed-World Assumption:
-has_an_excellent_exam(AutoVar0) :-
	not has_an_excellent_exam(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-ranked(AutoVar0, AutoVar1) :-
	not ranked(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

has_an_unacceptable_assessment(S) :-
	has_score(S, A, G),
	#student(S),
	#assessment(A),
	#unacceptable_grade(G).

has_all_acceptable_assessments(S) :-
	-has_an_unacceptable_assessment(S),
	#student(S).

has_an_excellent_exam(S) :-
	has_score(S, E, a),
	#student(S),
	#exam(E).

has_a_good_exam(S) :-
	has_score(S, E, b),
	#student(S),
	#exam(E).

ranked(S, above_average) :-
	has_all_acceptable_assessments(S),
	has_an_excellent_exam(S),
	#student(S).

ranked(S, average) :-
	has_all_acceptable_assessments(S),
	-has_an_excellent_exam(S),
	has_a_good_exam(S),
	#student(S).

ranked(S, below_average) :-
	has_an_unacceptable_assessment(S),
	has_a_good_exam(S),
	#student(S).

evaluated(S, satisfactory) :-
	ranked(S, R),
	#student(S),
	#satisfactory_rank(R).

evaluated(S, unsatisfactory) :-
	-evaluated(S, satisfactory),
	#student(S).

has_score(ann, q1, pass).

has_score(ann, q2, pass).

has_score(ann, q3, pass).

has_score(ann, e1, a).

has_score(ann, e2, b).

has_score(bob, q1, pass).

has_score(bob, q2, pass).

has_score(bob, q3, pass).

has_score(bob, e1, b).

has_score(bob, e2, b).

has_score(chris, q1, fail).

has_score(chris, q1, pass).

has_score(chris, q1, pass).

has_score(chris, e1, b).

has_score(chris, e2, d).

has_score(dennis, q1, pass).

has_score(dennis, q2, pass).

has_score(dennis, q3, pass).

has_score(dennis, e1, f).

has_score(dennis, e2, c).


