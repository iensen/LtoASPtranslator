
sorts

#rule_termS = {h1_1}.
#prog_termS = #rule_termS.

predicates

mitigated(#prog_termS). aic_issued(). detailed_switchover_plan(). risks_mitigated(). contingency_plan_in_place(). existing_standard_fuel_low_procedure(). new_flight_crew_procedures(). atmf_will_be_applied(). training_programs(). switchover_safe(). risks_identified(). 

rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-aic_issued :- not aic_issued.
-risks_identified :- not risks_identified.
-atmf_will_be_applied :- not atmf_will_be_applied.
-switchover_safe :- not switchover_safe.
-mitigated(CWA0) :- not mitigated(CWA0), #prog_termS(CWA0).
-training_programs :- not training_programs.
-detailed_switchover_plan :- not detailed_switchover_plan.
-risks_mitigated :- not risks_mitigated.
-contingency_plan_in_place :- not contingency_plan_in_place.

display

mitigated. aic_issued. detailed_switchover_plan. risks_mitigated. contingency_plan_in_place. existing_standard_fuel_low_procedure. new_flight_crew_procedures. atmf_will_be_applied. training_programs. switchover_safe. risks_identified. 
