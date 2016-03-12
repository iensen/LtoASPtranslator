
sorts

#mitigated_1_termS = {h1_1}.

predicates

new_flight_crew_procedures().
atmf_will_be_applied().
risks_mitigated().
detailed_switchover_plan().
contingency_plan_in_place().
training_programs().
aic_issued().
existing_standard_fuel_low_procedure().
mitigated(#mitigated_1_termS).
switchover_safe().
risks_identified().


rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-contingency_plan_in_place :- not contingency_plan_in_place.
-training_programs :- not training_programs.
-risks_identified :- not risks_identified.
-mitigated(CWA_Var_1) :- not mitigated(CWA_Var_1), #mitigated_1_termS(CWA_Var_1).
-atmf_will_be_applied :- not atmf_will_be_applied.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-detailed_switchover_plan :- not detailed_switchover_plan.
-aic_issued :- not aic_issued.
-risks_mitigated :- not risks_mitigated.
-switchover_safe :- not switchover_safe.

display

new_flight_crew_procedures. atmf_will_be_applied. risks_mitigated. detailed_switchover_plan. contingency_plan_in_place. training_programs. aic_issued. existing_standard_fuel_low_procedure. mitigated. switchover_safe. risks_identified. 
