
sorts

#mitigated_1_termS = {h1_1}.

predicates

risks_identified().
detailed_switchover_plan().
risks_mitigated().
aic_issued().
switchover_safe().
contingency_plan_in_place().
mitigated(#mitigated_1_termS).
atmf_will_be_applied().
new_flight_crew_procedures().
training_programs().
existing_standard_fuel_low_procedure().


rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-mitigated(CWA_Var_1) :- not mitigated(CWA_Var_1), #mitigated_1_termS(CWA_Var_1).
-atmf_will_be_applied :- not atmf_will_be_applied.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-training_programs :- not training_programs.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-detailed_switchover_plan :- not detailed_switchover_plan.
-risks_mitigated :- not risks_mitigated.
-risks_identified :- not risks_identified.
-contingency_plan_in_place :- not contingency_plan_in_place.
-switchover_safe :- not switchover_safe.
-aic_issued :- not aic_issued.

display

risks_identified. detailed_switchover_plan. risks_mitigated. aic_issued. switchover_safe. contingency_plan_in_place. mitigated. atmf_will_be_applied. new_flight_crew_procedures. training_programs. existing_standard_fuel_low_procedure. 
