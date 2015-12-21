/* 
This L program:

    Introduces a hypothetical method of evaluating students in a course as satisfactory or unsatisfactory
    
    Includes sample students, assessments, and scores.  
*/

/* EVALUATION MECHANISM */

type pass_fail_grade = {pass, fail}.
type letter_grade = {a, b, c, d, f}.
type grade = letter_grade + pass_fail_grade.
type acceptable_grade = {pass, a, b, c, d}.
type unacceptable_grade = grade \ acceptable_grade.

has_an_unacceptable_assessment(student S) if 
    has_score(S, assessment A, unacceptable_grade G).
has_all_acceptable_assessments(student S) if 
    not has_an_unacceptable_assessment(S).

has_an_excellent_exam(student S) if has_score(S, exam E, a).
has_a_good_exam(student S) if has_score(S, exam E, b).

ranked(student S, above_average) if 
    has_all_acceptable_assessments(S) and has_an_excellent_exam(S).
ranked(student S, average) if    
    has_all_acceptable_assessments(S) and not has_an_excellent_exam(S) and  has_a_good_exam(S).
ranked(student S, below_average) if
    has_an_unacceptable_assessment(S) and has_a_good_exam(S).
    
type satisfactory_rank = {above_average, average, below_average}.

evaluated(student S, satisfactory) if ranked(S, satisfactory_rank R).
evaluated(student S, unsatisfactory) if not evaluated(S, satisfactory).
    
/* SAMPLE DATA */

type student = {ann, bob, chris, dennis}.

type quiz = {q1, q2, q3}.
type exam = {e1, e2}.
type assessment = quiz + exam.

has_score(ann, q1, pass). has_score(ann, q2, pass). has_score(ann, q3, pass). 
has_score(ann, e1, a). has_score(ann, e2, b).

has_score(bob, q1, pass). has_score(bob, q2, pass). has_score(bob, q3, pass). 
has_score(bob, e1, b). has_score(bob, e2, b). 

has_score(chris, q1, fail). has_score(chris, q1, pass). has_score(chris, q1, pass). 
has_score(chris, e1, b). has_score(chris, e2, d).

has_score(dennis, q1, pass). has_score(dennis, q2, pass). has_score(dennis, q3, pass). 
has_score(dennis, e1, f). has_score(dennis, e2, c).

/*
This L program is translated into the ASP program student_evaluation.sp. Solving the ASP program with SPARC:

    SPARC  V2.46
    program translated
    
    ?- evaluated(S, E)
    S = ann E = satisfactory
    S = bob E = satisfactory
    S = chris E = satisfactory
    S = dennis E = unsatisfactory
    
    ?- ranked(S, R)
    R = above_average S = ann
    R = average S = bob
    R = below_average S = chris
    
    ?- exit
*/
