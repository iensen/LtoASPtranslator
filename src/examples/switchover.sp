
sorts

#rule_termS = {h1_1}.
#prog_termS = #rule_termS.

predicates

risks_identified(). atmf_will_be_applied(). aic_issued(). training_programs(). contingency_plan_in_place(). risks_mitigated(). detailed_switchover_plan(). mitigated(#prog_termS). existing_standard_fuel_low_procedure(). switchover_safe(). new_flight_crew_procedures(). 

rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.
-aic_issued :- not aic_issued.
-contingency_plan_in_place :- not contingency_plan_in_place.
-risks_identified :- not risks_identified.
-atmf_will_be_applied :- not atmf_will_be_applied.
-risks_mitigated :- not risks_mitigated.
-mitigated(CWA0) :- not mitigated(CWA0), #prog_termS(CWA0).
-training_programs :- not training_programs.
-existing_standard_fuel_low_procedure :- not existing_standard_fuel_low_procedure.
-switchover_safe :- not switchover_safe.
-new_flight_crew_procedures :- not new_flight_crew_procedures.
-detailed_switchover_plan :- not detailed_switchover_plan.

display

risks_identified. atmf_will_be_applied. aic_issued. training_programs. contingency_plan_in_place. risks_mitigated. detailed_switchover_plan. mitigated. existing_standard_fuel_low_procedure. switchover_safe. new_flight_crew_procedures. 
