
sorts

#mitigated_1_termS = {h1_1}.

predicates

contingency_plan_in_place().
new_flight_crew_procedures().
switchover_safe().
aic_issued().
risks_identified().
existing_standard_fuel_low_procedure().
mitigated(#mitigated_1_termS).
training_programs().
atmf_will_be_applied().
risks_mitigated().
detailed_switchover_plan().


rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-atmf_will_be_applied :- not atmf_will_be_applied.
-aic_issued :- not aic_issued.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-mitigated(CWA_Var_1) :- not mitigated(CWA_Var_1), #mitigated_1_termS(CWA_Var_1).
-contingency_plan_in_place :- not contingency_plan_in_place.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-switchover_safe :- not switchover_safe.
-risks_mitigated :- not risks_mitigated.
-training_programs :- not training_programs.
-risks_identified :- not risks_identified.
-detailed_switchover_plan :- not detailed_switchover_plan.

display

contingency_plan_in_place. new_flight_crew_procedures. switchover_safe. aic_issued. risks_identified. existing_standard_fuel_low_procedure. mitigated. training_programs. atmf_will_be_applied. risks_mitigated. detailed_switchover_plan. 
