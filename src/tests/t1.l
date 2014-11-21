
/*********************************************************************
Our safety obligations are met if
  (1) The system requirements have been certified
  (2) The process for insuring validation has been followed, and
  (3) The system has passed all required inspections.

The required inspections are of various sorts, and new ones are
added from time to time.

**********
**********
**********
**********
**********
**********
**********/


safetyObligationsMet if
   requirementsCertified and
   validationProcessFollowed and
   passed(every requiredInspection).

/* The requirements are certified if they are sound and complete */

requirementsCertified if
  requirementsSound and
  requirementsComplete.

/* etc. ... more Horn clauses */


/* The validation process has been followed if sections A-E of code
   825/A/6 have been satisfied */

validationProcessFollowed if
  satisfied(code_825_A_6_A) and
  satisfied(code_825_A_6_B) and
  satisfied(code_825_A_6_C) and
  satisfied(code_825_A_6_D) and
  satisfied(code_825_A_6_E).

/* etc. ... more Horn clauses */

/* EPA i/652/6B/714/A is a required inspection */

requiredInspection(epa_i_652_6B_714_A).

/* EPA inspection i/652/6B/714/A is passed if we have completed all 
   required forms and have no EPA safety hearings pending */

passed(epa_i_652_6B_714_A) if
   completed(every requiredFromEPA714) and
   not pending(any epaSafetyHearing).


/* EPA i/652/6B/714/B is a required inspection */

requiredInspection(epa_i_652_6B_714_B).

/* EPA inspection i/652/6B/714/B is passed if we have paid all fines 
required under previous infractions under EPA code j/652/6B/710/C. */

passed(epa_i_652_6B_714_B) if
  paid(every epaFine_j_652_6B_710_C).




















   
















  
