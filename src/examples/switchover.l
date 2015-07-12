/* The following is similar to St4.1 from diagram A-17 */

switchover_safe if 
   detailed_switchover_plan,
   risks_identified,
   risks_mitigated,
   contingency_plan_in_place,
   atmf_will_be_applied.
   
mitigated(h1_1) if
   aic_issued,
   new_flight_crew_procedures,
   training_programs,
   existing_standard_fuel_low_procedure.
 
 aic_issued.
 new_flight_crew_procedures.
