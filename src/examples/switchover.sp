
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#rule_gterms = 
	{h1_1}.

#universal = 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

mitigated(#universal).
risks_mitigated().
contingency_plan_in_place().
atmf_will_be_applied().
existing_standard_fuel_low_procedure().
switchover_safe().
aic_issued().
risks_identified().
new_flight_crew_procedures().
detailed_switchover_plan().
training_programs().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

switchover_safe :-
	detailed_switchover_plan,
	risks_identified,
	risks_mitigated,
	contingency_plan_in_place,
	atmf_will_be_applied.

mitigated(h1_1) :-
	aic_issued,
	new_flight_crew_procedures,
	training_programs,
	existing_standard_fuel_low_procedure.

aic_issued.

new_flight_crew_procedures.


