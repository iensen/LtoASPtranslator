
sorts

#rule_termS = {h1_1}.
#prog_termS = #rule_termS.

predicates

risks_identified(). risks_mitigated(). switchover_safe(). aic_issued(). existing_standard_fuel_low_procedure(). new_flight_crew_procedures(). detailed_switchover_plan(). contingency_plan_in_place(). atmf_will_be_applied(). mitigated(#prog_termS). training_programs(). 

rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-switchover_safe :- not switchover_safe.
-atmf_will_be_applied :- not atmf_will_be_applied.
-risks_mitigated :- not risks_mitigated.
-training_programs :- not training_programs.
-aic_issued :- not aic_issued.
-detailed_switchover_plan :- not detailed_switchover_plan.
-contingency_plan_in_place :- not contingency_plan_in_place.
-mitigated(CWA0) :- not mitigated(CWA0), #prog_termS(CWA0).
-risks_identified :- not risks_identified.

display

risks_identified. risks_mitigated. switchover_safe. aic_issued. existing_standard_fuel_low_procedure. new_flight_crew_procedures. detailed_switchover_plan. contingency_plan_in_place. atmf_will_be_applied. mitigated. training_programs. 
