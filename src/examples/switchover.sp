
sorts

#mitigated_1_termS = {h1_1}.

predicates

switchover_safe().
mitigated(#mitigated_1_termS).
training_programs().
risks_mitigated().
risks_identified().
atmf_will_be_applied().
contingency_plan_in_place().
new_flight_crew_procedures().
aic_issued().
existing_standard_fuel_low_procedure().
detailed_switchover_plan().


rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-detailed_switchover_plan :- not detailed_switchover_plan.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-risks_mitigated :- not risks_mitigated.
-contingency_plan_in_place :- not contingency_plan_in_place.
-training_programs :- not training_programs.
-switchover_safe :- not switchover_safe.
-mitigated(CWA_Var_1) :- not mitigated(CWA_Var_1), #mitigated_1_termS(CWA_Var_1).
-atmf_will_be_applied :- not atmf_will_be_applied.
-aic_issued :- not aic_issued.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-risks_identified :- not risks_identified.

display

switchover_safe. mitigated. training_programs. risks_mitigated. risks_identified. atmf_will_be_applied. contingency_plan_in_place. new_flight_crew_procedures. aic_issued. existing_standard_fuel_low_procedure. detailed_switchover_plan. 
