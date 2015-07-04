sorts

#requiredInspection = {epa_i_652_6B_714_A, epa_i_652_6B_714_B}.
#code_825_A_6 = {code_825_A_6_A, code_825_A_6_B, code_825_A_6_C, code_825_A_6_D, code_825_A_6_E}.

predicates

safetyObligationsMet().
requirementsCertified().
validationProcessFollowed().
requirementsSound().
requirementsComplete().
satisfied(#code_825_A_6).
passed(#requiredInspection).

rules

safetyObligationsMet :-
	requirementsCertified,
	validationProcessFollowed.

requirementsCertified :-
	requirementsSound,
	requirementsComplete.

validationProcessFollowed :-
	satisfied(code_825_A_6_A),
	satisfied(code_825_A_6_B),
	satisfied(code_825_A_6_C),
	satisfied(code_825_A_6_D),
	satisfied(code_825_A_6_E).

passed(epa_i_652_6B_714_A).

passed(epa_i_652_6B_714_B).