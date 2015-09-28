sorts

#rule_gterms = {h1_1}.
#universal = #rule_gterms.

predicates

mitigated(#universal).
new_flight_crew_procedures().
risks_mitigated().
contingency_plan_in_place().
existing_standard_fuel_low_procedure().
atmf_will_be_applied().
risks_identified().
training_programs().
detailed_switchover_plan().
switchover_safe().
aic_issued().

rules

switchover_safe :- detailed_switchover_plan, risks_identified, risks_mitigated, contingency_plan_in_place, atmf_will_be_applied.
mitigated(h1_1) :- aic_issued, new_flight_crew_procedures, training_programs, existing_standard_fuel_low_procedure.
aic_issued.
new_flight_crew_procedures.

