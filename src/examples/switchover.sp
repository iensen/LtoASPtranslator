
sorts

#rule_termS = {h1_1}.
#prog_termS = #rule_termS.

predicates

aic_issued(). risks_mitigated(). new_flight_crew_procedures(). risks_identified(). atmf_will_be_applied(). existing_standard_fuel_low_procedure(). training_programs(). mitigated(#prog_termS). detailed_switchover_plan(). switchover_safe(). contingency_plan_in_place(). 

rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-mitigated(CWA0) :- not mitigated(CWA0), #prog_termS(CWA0).
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-switchover_safe :- not switchover_safe.
-risks_mitigated :- not risks_mitigated.
-contingency_plan_in_place :- not contingency_plan_in_place.
-aic_issued :- not aic_issued.
-detailed_switchover_plan :- not detailed_switchover_plan.
-risks_identified :- not risks_identified.
-training_programs :- not training_programs.
-atmf_will_be_applied :- not atmf_will_be_applied.

display

aic_issued. risks_mitigated. new_flight_crew_procedures. risks_identified. atmf_will_be_applied. existing_standard_fuel_low_procedure. training_programs. mitigated. detailed_switchover_plan. switchover_safe. contingency_plan_in_place. 
