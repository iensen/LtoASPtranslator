type requiredInspection = {epa_i_652_6B_714_A, epa_i_652_6B_714_B}.

safetyObligationsMet if
   requirementsCertified and
   validationProcessFollowed.

requirementsCertified if
   requirementsSound and
   requirementsComplete.

validationProcessFollowed if
   satisfied(code_825_A_6_A) and
   satisfied(code_825_A_6_B) and
   satisfied(code_825_A_6_C) and
   satisfied(code_825_A_6_D) and
   satisfied(code_825_A_6_E).

passed(epa_i_652_6B_714_A).

passed(epa_i_652_6B_714_B).
