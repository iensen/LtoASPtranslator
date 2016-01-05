
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts

#rule_gterms = 
	{h1_1}.

#universal = 
	#rule_gterms.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates

detailed_switchover_plan().
mitigated(#universal).
risks_mitigated().
atmf_will_be_applied().
existing_standard_fuel_low_procedure().
training_programs().
aic_issued().
switchover_safe().
new_flight_crew_procedures().
risks_identified().
contingency_plan_in_place().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules

-detailed_switchover_plan :-
	not detailed_switchover_plan.

-existing_standard_fuel_low_procedure :-
	not existing_standard_fuel_low_procedure.

-risks_mitigated :-
	not risks_mitigated.

-mitigated(CWA_Var0) :-
	not mitigated(CWA_Var0),
	#universal(CWA_Var0).

-atmf_will_be_applied :-
	not atmf_will_be_applied.

-contingency_plan_in_place :-
	not contingency_plan_in_place.

-aic_issued :-
	not aic_issued.

-training_programs :-
	not training_programs.

-switchover_safe :-
	not switchover_safe.

-risks_identified :-
	not risks_identified.

-new_flight_crew_procedures :-
	not new_flight_crew_procedures.

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


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display

detailed_switchover_plan.
mitigated.
risks_mitigated.
atmf_will_be_applied.
existing_standard_fuel_low_procedure.
training_programs.
aic_issued.
switchover_safe.
new_flight_crew_procedures.
risks_identified.
contingency_plan_in_place.

