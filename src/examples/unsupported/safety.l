/*
2015/12/19
EMPTY SORT IS UNSUPPORTED IN SPARC 2.47.2
*/

type requiredInspection = {epa_i_652_6B_714_A, epa_i_652_6B_714_B}.
type epaSafetyHearing = {}.
type requiredFromEPA714 = {} .
type epaFine_j_652_6B_710_C = {}.


safetyObligationsMet if

   passed(every requiredInspection).

requirementsCertified if
   requirementsSound and
   requirementsComplete.

validationProcessFollowed if
   satisfied(code_825_A_6_A) and
   satisfied(code_825_A_6_B) and
   satisfied(code_825_A_6_C) and
   satisfied(code_825_A_6_D) and
   satisfied(code_825_A_6_E).


passed(epa_i_652_6B_714_A) if
   completed(every requiredFromEPA714) and
   not pending(every epaFine_j_652_6B_710_C).


passed(epa_i_652_6B_714_B) if
   paid(every epaFine_j_652_6B_710_C).
