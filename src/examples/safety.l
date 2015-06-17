
requiredInspection = {epa_i_652_6B_714_A, epa_i_652_6B_714_B}.
epaSafetyHearing = {}.
requiredFromEPA714 = {} .
epaFine_j_652_6B_710_C = {}.


safetyObligationsMet if
   requirementsCertified and
   validationProcessFollowed and
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
