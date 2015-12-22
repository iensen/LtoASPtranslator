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

detailed_switchover_plan().
risks_identified().
risks_mitigated().
switchover_safe().
new_flight_crew_procedures().
aic_issued().
contingency_plan_in_place().
existing_standard_fuel_low_procedure().
atmf_will_be_applied().
mitigated(#universal).
training_programs().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-switchover_safe :-
	not switchover_safe.

% Closed-World Assumption:
-new_flight_crew_procedures :-
	not new_flight_crew_procedures.

% Closed-World Assumption:
-risks_mitigated :-
	not risks_mitigated.

% Closed-World Assumption:
-training_programs :-
	not training_programs.

% Closed-World Assumption:
-detailed_switchover_plan :-
	not detailed_switchover_plan.

% Closed-World Assumption:
-risks_identified :-
	not risks_identified.

% Closed-World Assumption:
-contingency_plan_in_place :-
	not contingency_plan_in_place.

% Closed-World Assumption:
-aic_issued :-
	not aic_issued.

% Closed-World Assumption:
-existing_standard_fuel_low_procedure :-
	not existing_standard_fuel_low_procedure.

% Closed-World Assumption:
-atmf_will_be_applied :-
	not atmf_will_be_applied.

% Closed-World Assumption:
-mitigated(AutoVar0) :-
	not mitigated(AutoVar0),
	#universal(AutoVar0).

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
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

detailed_switchover_plan.
risks_identified.
risks_mitigated.
switchover_safe.
new_flight_crew_procedures.
aic_issued.
contingency_plan_in_place.
existing_standard_fuel_low_procedure.
atmf_will_be_applied.
mitigated.
training_programs.

