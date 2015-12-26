%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#residual_risk = 
	{level_busts, asac_usage_risks, wake_vortices, mountain_waves, operational_errors}.

#hazard527 = 
	{ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}.

#risk527 = 
	{risk(ht_1_10), risk(ht_2_2), risk(ht_1_8), risk(ht_1_11), risk(ht_3_6)}.

#hazard537 = 
	{ht_3_5, hm_1_8, hm_2_2, hm_1_15}.

#hazard546 = 
	{ht_1_9, ht_3_5, hm_2_2, hm_1_6, hm_1_8, hm_1_15}.

#hazard556 = 
	{hm_1_3, hm_1_14}.

#risk556 = 
	{r(hm_1_3), r(hm_1_14)}.

#hazard565 = 
	{ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5, ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15, hm_2_17, hm_2_7, hm_2_9}.

#hazard575 = 
	{ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5, ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15, hm_2_17, hm_2_7, hm_2_9}.

#mod_to_identify_and_display_apprv_aircraft = 
	{ifps, rdps, fdps_fps, oldi, back_up_systems}.

#modification = 
	#mod_to_identify_and_display_apprv_aircraft + 
	{alert_on_adj_aircraft}.

#hazard5810 = 
	{hm_2_6, hm_2_5, hm_2_17, hm_1_2, hm_2_7, hm_2_8, hm_2_13, hm_2_10, hm_2_11, ht_1_9, hm_2_27}.

#hazard5910 = 
	{hm_2_2, hm_1_1}.

#types = 
	#residual_risk + 
	#hazard527 + 
	#risk527 + 
	#hazard537 + 
	#hazard546 + 
	#hazard556 + 
	#risk556 + 
	#hazard565 + 
	#hazard575 + 
	#mod_to_identify_and_display_apprv_aircraft + 
	#modification + 
	#hazard5810 + 
	#hazard5910.

#rule_gterms = 
	{asac_usage_risks, ht_1_10, hm_1_10, level_busts, hm_2_6, risk(ht_1_10), ht_1_2, hm_1_9, hm_2_9, wake_vortices, hm_2_5, oldi, hm_1_13, alert_on_adj_aircraft, hm_2_4, hm_2_13, hm_1_6, risk(ht_1_11), risk(ht_1_8), risk(hm_1_3), back_up_systems, risk(ht_3_6), ht_1_8, r(hm_1_3), hm_2_2, hm_2_8, hm_2_10, ht_1_5, hm_2_1, hm_2_7, fdps_fps, ht_2_2, hm_2_17, hm_1_1, hm_1_8, ht_1_1, hm_1_2, ht_1_9, rdps, ht_3_6, hm_2_11, risk(ht_2_2), risk(hm_1_14), ifps, operational_errors, risk(ht_1_11), ht_3_5, mountain_waves, hm_2_27, r(hm_1_14), hm_1_15}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

all_atc_training_produced_by_competent_staff().
height_keeping_requirements_covered().
controlled(#universal).
crm_shows_tls_met().
transition_areas_validated_by_competent_staff().
fc_rvsm_procedures_produced().
system_monitoring_complies_with_SRs().
fc_flt_planning_procedures_validated().
assumptions_about_alert_rate_validated().
total_vertical_risk_covered().
transition_areas().
six_new_RVSM_flight_levels_produced_by_competent_staff().
atc_rvsm_procedures_validated().
six_new_RVSM_flight_levels().
fc_flt_planning_training().
fc_training_design_complies_with_SRs().
atc_equipment_design_complies_with_SRs().
fc_transition_training_produced().
transition_areas_produced_by_competent_staff().
modifications_made_to_identify_and_display_apprv_aircraft().
fc_flt_planning_procedures_proved_by_NAT().
fc_rvsm_procedures_validated().
fc_flt_planning_training_produced().
complies_with_recommended_practice(#universal).
fc_transition_training().
fc_rvsm_training_validated().
fc_contigency_training_validated_in_NAT().
overlap_frequency_verified().
fc_contigency_training().
fc_transition_training_validated_in_NAT().
atc_procedure_design_complies_with_SRs().
atc_contingency_procedures().
hazards_mitigated().
atc_clearance_procedures().
fc_transition_procedures_verified().
residual_risks_controlled().
thke_measured_by_monitors().
masps_height_keeping_accuracy_met().
all_atc_training_validated().
fps_oldi_messaged_display_rfl().
concept_meets_RVSM_safety_requirements().
atc_rvsm_procedures_produced().
operation_error_rate_verified().
tls_met().
atc_training_design_complies_with_SRs().
fc_rvsm_procedures_proved_by_NAT().
atc_clearance_procedures_validated().
fc_flt_contigency_procedures_produced().
all_atc_trainings().
safety_proven_for_2001_levels().
aircraft_equipment_design_complies_with_SRs().
atc_clearance_procedures_produced().
risks_controlled().
atc_transition_procedures_produced().
safety_constraints_satisfied().
rvsm_adapted_crm_validated().
atc_contingency_procedures_validated().
six_new_RVSM_flight_levels_validated_by_competent_staff().
required_height_keeping_accuracy_met().
fc_contigency_training_produced().
contingency_facilities_produced_by_competent_staff().
fc_rvsm_training().
fc_flt_planning_procedures().
crm_valid().
modification_made(#universal).
fc_transition_procedures_produced().
fc_flt_contigency_procedures().
fc_rvsm_procedures().
fc_transition_procedures().
torerable(#universal).
atc_contingency_procedures_produced().
fc_rvsm_training_produced().
fc_flt_planning_training_validated_in_NAT().
number_of_non_approved_aircraft_acceptable().
fc_contigency_training_validated().
mitigated(#universal).
fc_are_aware_of_EUR_RVSM().
crm_assumptions_are_valid().
atc_rvsm_procedures().
original_crm_validated_by_nat().
airspace_design_complies_with_SRs().
fc_flt_contigency_procedures_validated().
modification_specified(#universal).
fc_procedures().
safety_justified_for_2000plus_levels().
fc_flt_planning_training_validated().
monitors_validated().
contingency_facilities().
crm_staff_competent().
thke_complient_with_masps().
atc_transition_procedures().
fc_transition_training_validated().
validated(#universal).
number_of_approved_aircraft_acceptable().
non_approved_aircraft_excluded().
fc_procedure_design_complies_with_SRs().
contingency_facilities_validated_by_competent_staff().
srs_are_fully_traceable_to_concept().
crm_scenarios_valid().
atc_transition_procedures_validated().
operational_risk_requirements_covered().
safety_reqts_fully_realised().
tolerable(#universal).
states_will_be_required_to_institute_fc().
fc_rvsm_training_validated_in_NAT().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-non_approved_aircraft_excluded :-
	not non_approved_aircraft_excluded.

% Closed-World Assumption:
-contingency_facilities :-
	not contingency_facilities.

% Closed-World Assumption:
-crm_staff_competent :-
	not crm_staff_competent.

% Closed-World Assumption:
-concept_meets_RVSM_safety_requirements :-
	not concept_meets_RVSM_safety_requirements.

% Closed-World Assumption:
-assumptions_about_alert_rate_validated :-
	not assumptions_about_alert_rate_validated.

% Closed-World Assumption:
-atc_equipment_design_complies_with_SRs :-
	not atc_equipment_design_complies_with_SRs.

% Closed-World Assumption:
-modifications_made_to_identify_and_display_apprv_aircraft :-
	not modifications_made_to_identify_and_display_apprv_aircraft.

% Closed-World Assumption:
-six_new_RVSM_flight_levels_validated_by_competent_staff :-
	not six_new_RVSM_flight_levels_validated_by_competent_staff.

% Closed-World Assumption:
-number_of_approved_aircraft_acceptable :-
	not number_of_approved_aircraft_acceptable.

% Closed-World Assumption:
-crm_scenarios_valid :-
	not crm_scenarios_valid.

% Closed-World Assumption:
-fc_transition_procedures_verified :-
	not fc_transition_procedures_verified.

% Closed-World Assumption:
-airspace_design_complies_with_SRs :-
	not airspace_design_complies_with_SRs.

% Closed-World Assumption:
-fc_flt_contigency_procedures_validated :-
	not fc_flt_contigency_procedures_validated.

% Closed-World Assumption:
-monitors_validated :-
	not monitors_validated.

% Closed-World Assumption:
-all_atc_training_produced_by_competent_staff :-
	not all_atc_training_produced_by_competent_staff.

% Closed-World Assumption:
-crm_shows_tls_met :-
	not crm_shows_tls_met.

% Closed-World Assumption:
-six_new_RVSM_flight_levels :-
	not six_new_RVSM_flight_levels.

% Closed-World Assumption:
-fc_transition_training :-
	not fc_transition_training.

% Closed-World Assumption:
-fc_rvsm_training_validated :-
	not fc_rvsm_training_validated.

% Closed-World Assumption:
-atc_training_design_complies_with_SRs :-
	not atc_training_design_complies_with_SRs.

% Closed-World Assumption:
-atc_transition_procedures :-
	not atc_transition_procedures.

% Closed-World Assumption:
-fc_rvsm_training_validated_in_NAT :-
	not fc_rvsm_training_validated_in_NAT.

% Closed-World Assumption:
-operation_error_rate_verified :-
	not operation_error_rate_verified.

% Closed-World Assumption:
-thke_complient_with_masps :-
	not thke_complient_with_masps.

% Closed-World Assumption:
-safety_justified_for_2000plus_levels :-
	not safety_justified_for_2000plus_levels.

% Closed-World Assumption:
-fc_flt_planning_training :-
	not fc_flt_planning_training.

% Closed-World Assumption:
-fc_transition_training_produced :-
	not fc_transition_training_produced.

% Closed-World Assumption:
-fps_oldi_messaged_display_rfl :-
	not fps_oldi_messaged_display_rfl.

% Closed-World Assumption:
-fc_flt_planning_procedures :-
	not fc_flt_planning_procedures.

% Closed-World Assumption:
-crm_valid :-
	not crm_valid.

% Closed-World Assumption:
-modification_made(AutoVar0) :-
	not modification_made(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-fc_procedures :-
	not fc_procedures.

% Closed-World Assumption:
-tolerable(AutoVar0) :-
	not tolerable(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-fc_rvsm_training_produced :-
	not fc_rvsm_training_produced.

% Closed-World Assumption:
-fc_flt_planning_training_validated_in_NAT :-
	not fc_flt_planning_training_validated_in_NAT.

% Closed-World Assumption:
-torerable(AutoVar0) :-
	not torerable(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-fc_procedure_design_complies_with_SRs :-
	not fc_procedure_design_complies_with_SRs.

% Closed-World Assumption:
-contingency_facilities_validated_by_competent_staff :-
	not contingency_facilities_validated_by_competent_staff.

% Closed-World Assumption:
-masps_height_keeping_accuracy_met :-
	not masps_height_keeping_accuracy_met.

% Closed-World Assumption:
-all_atc_training_validated :-
	not all_atc_training_validated.

% Closed-World Assumption:
-fc_contigency_training_validated_in_NAT :-
	not fc_contigency_training_validated_in_NAT.

% Closed-World Assumption:
-overlap_frequency_verified :-
	not overlap_frequency_verified.

% Closed-World Assumption:
-tls_met :-
	not tls_met.

% Closed-World Assumption:
-complies_with_recommended_practice(AutoVar0) :-
	not complies_with_recommended_practice(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-system_monitoring_complies_with_SRs :-
	not system_monitoring_complies_with_SRs.

% Closed-World Assumption:
-fc_flt_planning_procedures_validated :-
	not fc_flt_planning_procedures_validated.

% Closed-World Assumption:
-safety_proven_for_2001_levels :-
	not safety_proven_for_2001_levels.

% Closed-World Assumption:
-atc_contingency_procedures_validated :-
	not atc_contingency_procedures_validated.

% Closed-World Assumption:
-hazards_mitigated :-
	not hazards_mitigated.

% Closed-World Assumption:
-thke_measured_by_monitors :-
	not thke_measured_by_monitors.

% Closed-World Assumption:
-atc_contingency_procedures :-
	not atc_contingency_procedures.

% Closed-World Assumption:
-residual_risks_controlled :-
	not residual_risks_controlled.

% Closed-World Assumption:
-fc_training_design_complies_with_SRs :-
	not fc_training_design_complies_with_SRs.

% Closed-World Assumption:
-atc_transition_procedures_produced :-
	not atc_transition_procedures_produced.

% Closed-World Assumption:
-crm_assumptions_are_valid :-
	not crm_assumptions_are_valid.

% Closed-World Assumption:
-atc_rvsm_procedures :-
	not atc_rvsm_procedures.

% Closed-World Assumption:
-fc_rvsm_procedures_produced :-
	not fc_rvsm_procedures_produced.

% Closed-World Assumption:
-fc_contigency_training :-
	not fc_contigency_training.

% Closed-World Assumption:
-all_atc_trainings :-
	not all_atc_trainings.

% Closed-World Assumption:
-number_of_non_approved_aircraft_acceptable :-
	not number_of_non_approved_aircraft_acceptable.

% Closed-World Assumption:
-operational_risk_requirements_covered :-
	not operational_risk_requirements_covered.

% Closed-World Assumption:
-fc_contigency_training_validated :-
	not fc_contigency_training_validated.

% Closed-World Assumption:
-srs_are_fully_traceable_to_concept :-
	not srs_are_fully_traceable_to_concept.

% Closed-World Assumption:
-safety_constraints_satisfied :-
	not safety_constraints_satisfied.

% Closed-World Assumption:
-fc_transition_training_validated_in_NAT :-
	not fc_transition_training_validated_in_NAT.

% Closed-World Assumption:
-height_keeping_requirements_covered :-
	not height_keeping_requirements_covered.

% Closed-World Assumption:
-fc_rvsm_procedures_validated :-
	not fc_rvsm_procedures_validated.

% Closed-World Assumption:
-fc_flt_planning_training_produced :-
	not fc_flt_planning_training_produced.

% Closed-World Assumption:
-atc_contingency_procedures_produced :-
	not atc_contingency_procedures_produced.

% Closed-World Assumption:
-atc_clearance_procedures :-
	not atc_clearance_procedures.

% Closed-World Assumption:
-total_vertical_risk_covered :-
	not total_vertical_risk_covered.

% Closed-World Assumption:
-transition_areas :-
	not transition_areas.

% Closed-World Assumption:
-fc_flt_contigency_procedures_produced :-
	not fc_flt_contigency_procedures_produced.

% Closed-World Assumption:
-aircraft_equipment_design_complies_with_SRs :-
	not aircraft_equipment_design_complies_with_SRs.

% Closed-World Assumption:
-atc_clearance_procedures_produced :-
	not atc_clearance_procedures_produced.

% Closed-World Assumption:
-required_height_keeping_accuracy_met :-
	not required_height_keeping_accuracy_met.

% Closed-World Assumption:
-fc_transition_procedures_produced :-
	not fc_transition_procedures_produced.

% Closed-World Assumption:
-original_crm_validated_by_nat :-
	not original_crm_validated_by_nat.

% Closed-World Assumption:
-fc_are_aware_of_EUR_RVSM :-
	not fc_are_aware_of_EUR_RVSM.

% Closed-World Assumption:
-atc_procedure_design_complies_with_SRs :-
	not atc_procedure_design_complies_with_SRs.

% Closed-World Assumption:
-controlled(AutoVar0) :-
	not controlled(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-rvsm_adapted_crm_validated :-
	not rvsm_adapted_crm_validated.

% Closed-World Assumption:
-fc_transition_training_validated :-
	not fc_transition_training_validated.

% Closed-World Assumption:
-transition_areas_produced_by_competent_staff :-
	not transition_areas_produced_by_competent_staff.

% Closed-World Assumption:
-fc_rvsm_procedures_proved_by_NAT :-
	not fc_rvsm_procedures_proved_by_NAT.

% Closed-World Assumption:
-atc_clearance_procedures_validated :-
	not atc_clearance_procedures_validated.

% Closed-World Assumption:
-fc_rvsm_procedures :-
	not fc_rvsm_procedures.

% Closed-World Assumption:
-modification_specified(AutoVar0) :-
	not modification_specified(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-states_will_be_required_to_institute_fc :-
	not states_will_be_required_to_institute_fc.

% Closed-World Assumption:
-contingency_facilities_produced_by_competent_staff :-
	not contingency_facilities_produced_by_competent_staff.

% Closed-World Assumption:
-fc_rvsm_training :-
	not fc_rvsm_training.

% Closed-World Assumption:
-transition_areas_validated_by_competent_staff :-
	not transition_areas_validated_by_competent_staff.

% Closed-World Assumption:
-fc_flt_planning_procedures_proved_by_NAT :-
	not fc_flt_planning_procedures_proved_by_NAT.

% Closed-World Assumption:
-fc_flt_contigency_procedures :-
	not fc_flt_contigency_procedures.

% Closed-World Assumption:
-fc_transition_procedures :-
	not fc_transition_procedures.

% Closed-World Assumption:
-fc_flt_planning_training_validated :-
	not fc_flt_planning_training_validated.

% Closed-World Assumption:
-atc_transition_procedures_validated :-
	not atc_transition_procedures_validated.

% Closed-World Assumption:
-risks_controlled :-
	not risks_controlled.

% Closed-World Assumption:
-safety_reqts_fully_realised :-
	not safety_reqts_fully_realised.

% Closed-World Assumption:
-mitigated(AutoVar0) :-
	not mitigated(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-validated(AutoVar0) :-
	not validated(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-fc_contigency_training_produced :-
	not fc_contigency_training_produced.

% Closed-World Assumption:
-atc_rvsm_procedures_produced :-
	not atc_rvsm_procedures_produced.

% Closed-World Assumption:
-six_new_RVSM_flight_levels_produced_by_competent_staff :-
	not six_new_RVSM_flight_levels_produced_by_competent_staff.

% Closed-World Assumption:
-atc_rvsm_procedures_validated :-
	not atc_rvsm_procedures_validated.

safety_reqts_fully_realised :-
	airspace_design_complies_with_SRs,
	fc_procedure_design_complies_with_SRs,
	fc_training_design_complies_with_SRs,
	aircraft_equipment_design_complies_with_SRs,
	atc_procedure_design_complies_with_SRs,
	atc_training_design_complies_with_SRs,
	atc_equipment_design_complies_with_SRs,
	system_monitoring_complies_with_SRs,
	safety_constraints_satisfied,
	srs_are_fully_traceable_to_concept,
	residual_risks_controlled,
	concept_meets_RVSM_safety_requirements.

srs_are_fully_traceable_to_concept.

residual_risks_controlled :-
	controlled(level_busts),
	controlled(wake_vortices),
	controlled(asac_usage_risks),
	controlled(operational_errors),
	controlled(mountain_waves).

controlled(R) :-
	mitigated(R),
	#residual_risk(R).

controlled(R) :-
	tolerable(R),
	#residual_risk(R).

mitigated(level_busts).

mitigated(asac_usage_risks).

tolerable(wake_vortices).

tolerable(mountain_waves).

tolerable(operational_errors).

concept_meets_RVSM_safety_requirements :-
	height_keeping_requirements_covered,
	operational_risk_requirements_covered,
	total_vertical_risk_covered.

height_keeping_requirements_covered.

operational_risk_requirements_covered.

total_vertical_risk_covered.

airspace_design_complies_with_SRs :-
	transition_areas,
	six_new_RVSM_flight_levels,
	risks_controlled,
	contingency_facilities.

transition_areas :-
	transition_areas_produced_by_competent_staff,
	transition_areas_validated_by_competent_staff.

transition_areas_produced_by_competent_staff.

transition_areas_validated_by_competent_staff.

six_new_RVSM_flight_levels :-
	six_new_RVSM_flight_levels_produced_by_competent_staff,
	six_new_RVSM_flight_levels_validated_by_competent_staff.

six_new_RVSM_flight_levels_produced_by_competent_staff.

six_new_RVSM_flight_levels_validated_by_competent_staff.

risks_controlled :-
	controlled(risk(ht_1_11)),
	controlled(risk(ht_3_6)),
	controlled(risk(ht_1_10)),
	controlled(risk(ht_1_8)),
	controlled(risk(ht_2_2)).

controlled(R) :-
	mitigated(H),
	R = risk(H),
	#risk527(R),
	#hazard527(H).

controlled(R) :-
	tolerable(R),
	#risk527(R).

mitigated(ht_1_8).

mitigated(ht_1_10).

mitigated(ht_2_2).

mitigated(ht_3_6).

tolerable(risk(ht_1_11)).

contingency_facilities :-
	contingency_facilities_produced_by_competent_staff,
	contingency_facilities_validated_by_competent_staff.

contingency_facilities_produced_by_competent_staff.

contingency_facilities_validated_by_competent_staff.

fc_procedure_design_complies_with_SRs :-
	fc_procedures,
	states_will_be_required_to_institute_fc,
	fc_are_aware_of_EUR_RVSM,
	hazards_mitigated.

fc_procedures :-
	fc_transition_procedures,
	fc_rvsm_procedures,
	fc_flt_planning_procedures,
	fc_flt_contigency_procedures.

fc_transition_procedures :-
	fc_transition_procedures_produced,
	fc_transition_procedures_verified.

fc_transition_procedures_produced.

fc_transition_procedures_verified.

fc_rvsm_procedures :-
	fc_rvsm_procedures_produced,
	fc_rvsm_procedures_validated.

fc_rvsm_procedures_produced.

fc_rvsm_procedures_validated :-
	fc_rvsm_procedures_proved_by_NAT.

fc_rvsm_procedures_proved_by_NAT.

fc_flt_contigency_procedures :-
	fc_flt_contigency_procedures_produced,
	fc_flt_contigency_procedures_validated.

fc_flt_contigency_procedures_produced.

fc_flt_contigency_procedures_validated.

fc_flt_planning_procedures :-
	fc_transition_procedures_produced,
	fc_flt_planning_procedures_validated.

fc_flt_planning_procedures.

fc_flt_planning_procedures_validated :-
	fc_flt_planning_procedures_proved_by_NAT.

fc_flt_planning_procedures_proved_by_NAT.

states_will_be_required_to_institute_fc.

fc_are_aware_of_EUR_RVSM.

hazards_mitigated :-
	mitigated(hm_2_2),
	mitigated(ht_3_5),
	mitigated(hm_1_15),
	mitigated(hm_1_8).

mitigated(ht_3_5).

mitigated(hm_1_8).

mitigated(hm_2_2).

mitigated(hm_1_15).

aircraft_equipment_design_complies_with_SRs :-
	fc_training_design_complies_with_SRs,
	fc_transition_training.

fc_training_design_complies_with_SRs :-
	fc_transition_training,
	fc_rvsm_training,
	fc_contigency_training,
	fc_flt_planning_training,
	hazards_mitigated.

fc_transition_training :-
	fc_transition_training_produced,
	fc_transition_training_validated.

fc_transition_training_produced.

fc_transition_training_validated :-
	fc_transition_training_validated_in_NAT.

fc_transition_training_validated_in_NAT.

fc_rvsm_training :-
	fc_rvsm_training_produced,
	fc_rvsm_training_validated.

fc_rvsm_training_produced.

fc_rvsm_training_validated :-
	fc_rvsm_training_validated_in_NAT.

fc_rvsm_training_validated_in_NAT.

fc_contigency_training :-
	fc_contigency_training_produced,
	fc_contigency_training_validated.

fc_contigency_training_produced.

fc_contigency_training_validated :-
	fc_contigency_training_validated_in_NAT.

fc_contigency_training_validated_in_NAT.

fc_flt_planning_training :-
	fc_flt_planning_training_produced,
	fc_flt_planning_training_validated.

fc_flt_planning_training_produced.

fc_flt_planning_training_validated :-
	fc_flt_planning_training_validated_in_NAT.

fc_flt_planning_training_validated_in_NAT.

hazards_mitigated :-
	mitigated(hm_2_2),
	mitigated(hm_1_15),
	mitigated(ht_1_9),
	mitigated(ht_3_5),
	mitigated(hm_1_6),
	mitigated(hm_1_8).

mitigated(ht_1_9).

mitigated(ht_3_5).

mitigated(hm_2_2).

mitigated(hm_1_6).

mitigated(hm_1_8).

mitigated(hm_1_15).

aircraft_equipment_design_complies_with_SRs :-
	tls_met,
	risks_controlled.

tls_met :-
	required_height_keeping_accuracy_met.

required_height_keeping_accuracy_met :-
	masps_height_keeping_accuracy_met.

masps_height_keeping_accuracy_met :-
	crm_valid.

crm_valid.

risks_controlled :-
	controlled(risk(hm_1_14)),
	controlled(risk(hm_1_3)).

controlled(R) :-
	mitigated(H),
	R = r(H),
	#risk556(R),
	#hazard556(H).

controlled(R) :-
	tolerable(R),
	#risk556(R).

tolerable(r(hm_1_14)).

torerable(r(hm_1_3)).

atc_procedure_design_complies_with_SRs :-
	atc_transition_procedures,
	atc_rvsm_procedures,
	atc_contingency_procedures,
	atc_clearance_procedures,
	hazards_mitigated.

atc_transition_procedures :-
	atc_transition_procedures_produced,
	atc_transition_procedures_validated.

atc_transition_procedures_produced.

atc_transition_procedures_validated.

atc_rvsm_procedures :-
	atc_rvsm_procedures_produced,
	atc_rvsm_procedures_validated.

atc_rvsm_procedures_produced.

atc_rvsm_procedures_validated.

atc_contingency_procedures :-
	atc_contingency_procedures_produced,
	atc_contingency_procedures_validated.

atc_contingency_procedures_produced.

atc_contingency_procedures_validated.

atc_clearance_procedures :-
	atc_clearance_procedures_produced,
	atc_clearance_procedures_validated.

atc_clearance_procedures_produced.

atc_clearance_procedures_validated.

hazards_mitigated :-
	mitigated(hm_1_10),
	mitigated(hm_2_1),
	mitigated(hm_1_9),
	mitigated(ht_2_2),
	mitigated(hm_1_15),
	mitigated(hm_2_7),
	mitigated(ht_1_8),
	mitigated(hm_2_9),
	mitigated(hm_2_4),
	mitigated(hm_2_5),
	mitigated(ht_3_6),
	mitigated(ht_1_2),
	mitigated(ht_1_5),
	mitigated(ht_1_9),
	mitigated(ht_1_1),
	mitigated(ht_3_5),
	mitigated(hm_1_13),
	mitigated(hm_2_17).

mitigated(ht_1_1).

mitigated(ht_1_2).

mitigated(ht_1_5).

mitigated(ht_1_8).

mitigated(ht_1_9).

mitigated(ht_2_2).

mitigated(ht_3_5).

mitigated(ht_3_6).

mitigated(hm_1_10).

mitigated(hm_1_13).

mitigated(hm_2_1).

mitigated(hm_2_4).

mitigated(hm_2_5).

mitigated(hm_1_9).

mitigated(hm_1_15).

mitigated(hm_2_17).

mitigated(hm_2_7).

mitigated(hm_2_9).

atc_training_design_complies_with_SRs :-
	all_atc_trainings,
	hazards_mitigated.

all_atc_trainings :-
	all_atc_training_produced_by_competent_staff,
	all_atc_training_validated.

all_atc_training_produced_by_competent_staff.

all_atc_training_validated.

hazards_mitigated :-
	mitigated(hm_1_10),
	mitigated(hm_2_1),
	mitigated(hm_1_9),
	mitigated(ht_2_2),
	mitigated(hm_1_15),
	mitigated(hm_2_7),
	mitigated(ht_1_8),
	mitigated(hm_2_9),
	mitigated(hm_2_4),
	mitigated(hm_2_5),
	mitigated(ht_3_6),
	mitigated(ht_1_2),
	mitigated(ht_1_5),
	mitigated(ht_1_9),
	mitigated(ht_1_1),
	mitigated(ht_3_5),
	mitigated(hm_1_13),
	mitigated(hm_2_17).

mitigated(ht_1_1).

mitigated(ht_1_2).

mitigated(ht_1_5).

mitigated(ht_1_8).

mitigated(ht_1_9).

mitigated(ht_2_2).

mitigated(ht_3_5).

mitigated(ht_3_6).

mitigated(hm_1_10).

mitigated(hm_1_13).

mitigated(hm_2_1).

mitigated(hm_2_4).

mitigated(hm_2_5).

mitigated(hm_1_9).

mitigated(hm_1_15).

mitigated(hm_2_17).

mitigated(hm_2_7).

mitigated(hm_2_9).

atc_equipment_design_complies_with_SRs :-
	modification_made(alert_on_adj_aircraft),
	modifications_made_to_identify_and_display_apprv_aircraft,
	fps_oldi_messaged_display_rfl,
	hazards_mitigated.

modifications_made_to_identify_and_display_apprv_aircraft :-
	modification_made(fdps_fps),
	modification_made(rdps),
	modification_made(oldi),
	modification_made(back_up_systems),
	modification_made(ifps).

modification_made(X) :-
	modification_specified(X),
	complies_with_recommended_practice(X),
	validated(X),
	#modification(X).

modification_specified(alert_on_adj_aircraft).

modification_specified(ifps).

modification_specified(rdps).

modification_specified(fdps_fps).

modification_specified(oldi).

modification_specified(back_up_systems).

complies_with_recommended_practice(alert_on_adj_aircraft).

complies_with_recommended_practice(ifps).

complies_with_recommended_practice(fdps_fps).

complies_with_recommended_practice(rdps).

complies_with_recommended_practice(oldi).

complies_with_recommended_practice(back_up_systems).

validated(alert_on_adj_aircraft).

validated(ifps).

validated(fdps_fps).

validated(rdps).

validated(oldi).

validated(back_up_systems).

fps_oldi_messaged_display_rfl.

hazards_mitigated :-
	mitigated(hm_2_7),
	mitigated(hm_2_5),
	mitigated(hm_2_27),
	mitigated(hm_1_2),
	mitigated(hm_2_13),
	mitigated(hm_2_11),
	mitigated(hm_2_6),
	mitigated(hm_2_8),
	mitigated(hm_2_10),
	mitigated(ht_1_9),
	mitigated(hm_2_17).

mitigated(hm_2_7).

mitigated(hm_2_5).

mitigated(hm_2_27).

mitigated(hm_1_2).

mitigated(hm_2_13).

mitigated(hm_2_11).

mitigated(hm_2_6).

mitigated(hm_2_8).

mitigated(hm_2_10).

mitigated(ht_1_9).

mitigated(hm_2_17).

system_monitoring_complies_with_SRs :-
	thke_complient_with_masps,
	operation_error_rate_verified,
	non_approved_aircraft_excluded,
	tls_met,
	hazards_mitigated,
	assumptions_about_alert_rate_validated.

thke_complient_with_masps :-
	thke_measured_by_monitors,
	monitors_validated.

thke_measured_by_monitors.

monitors_validated.

operation_error_rate_verified.

crm_assumptions_are_valid :-
	overlap_frequency_verified,
	original_crm_validated_by_nat,
	rvsm_adapted_crm_validated,
	crm_scenarios_valid,
	crm_staff_competent.

overlap_frequency_verified.

original_crm_validated_by_nat.

rvsm_adapted_crm_validated.

crm_scenarios_valid.

crm_staff_competent.

non_approved_aircraft_excluded :-
	number_of_non_approved_aircraft_acceptable,
	number_of_approved_aircraft_acceptable.

number_of_non_approved_aircraft_acceptable.

number_of_approved_aircraft_acceptable.

tls_met :-
	crm_shows_tls_met,
	crm_assumptions_are_valid.

crm_shows_tls_met.

assumptions_about_alert_rate_validated.

hazards_mitigated :-
	mitigated(hm_1_1),
	mitigated(hm_2_2).

mitigated(hm_2_2) :-
	non_approved_aircraft_excluded.

mitigated(hm_1_1) :-
	assumptions_about_alert_rate_validated.

safety_constraints_satisfied :-
	safety_proven_for_2001_levels,
	safety_justified_for_2000plus_levels.

safety_proven_for_2001_levels.

safety_justified_for_2000plus_levels.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

all_atc_training_produced_by_competent_staff.
height_keeping_requirements_covered.
controlled.
crm_shows_tls_met.
transition_areas_validated_by_competent_staff.
fc_rvsm_procedures_produced.
system_monitoring_complies_with_SRs.
fc_flt_planning_procedures_validated.
assumptions_about_alert_rate_validated.
total_vertical_risk_covered.
transition_areas.
six_new_RVSM_flight_levels_produced_by_competent_staff.
atc_rvsm_procedures_validated.
six_new_RVSM_flight_levels.
fc_flt_planning_training.
fc_training_design_complies_with_SRs.
atc_equipment_design_complies_with_SRs.
fc_transition_training_produced.
transition_areas_produced_by_competent_staff.
modifications_made_to_identify_and_display_apprv_aircraft.
fc_flt_planning_procedures_proved_by_NAT.
fc_rvsm_procedures_validated.
fc_flt_planning_training_produced.
complies_with_recommended_practice.
fc_transition_training.
fc_rvsm_training_validated.
fc_contigency_training_validated_in_NAT.
overlap_frequency_verified.
fc_contigency_training.
fc_transition_training_validated_in_NAT.
atc_procedure_design_complies_with_SRs.
atc_contingency_procedures.
hazards_mitigated.
atc_clearance_procedures.
fc_transition_procedures_verified.
residual_risks_controlled.
thke_measured_by_monitors.
masps_height_keeping_accuracy_met.
all_atc_training_validated.
fps_oldi_messaged_display_rfl.
concept_meets_RVSM_safety_requirements.
atc_rvsm_procedures_produced.
operation_error_rate_verified.
tls_met.
atc_training_design_complies_with_SRs.
fc_rvsm_procedures_proved_by_NAT.
atc_clearance_procedures_validated.
fc_flt_contigency_procedures_produced.
all_atc_trainings.
safety_proven_for_2001_levels.
aircraft_equipment_design_complies_with_SRs.
atc_clearance_procedures_produced.
risks_controlled.
atc_transition_procedures_produced.
safety_constraints_satisfied.
rvsm_adapted_crm_validated.
atc_contingency_procedures_validated.
six_new_RVSM_flight_levels_validated_by_competent_staff.
required_height_keeping_accuracy_met.
fc_contigency_training_produced.
contingency_facilities_produced_by_competent_staff.
fc_rvsm_training.
fc_flt_planning_procedures.
crm_valid.
modification_made.
fc_transition_procedures_produced.
fc_flt_contigency_procedures.
fc_rvsm_procedures.
fc_transition_procedures.
torerable.
atc_contingency_procedures_produced.
fc_rvsm_training_produced.
fc_flt_planning_training_validated_in_NAT.
number_of_non_approved_aircraft_acceptable.
fc_contigency_training_validated.
mitigated.
fc_are_aware_of_EUR_RVSM.
crm_assumptions_are_valid.
atc_rvsm_procedures.
original_crm_validated_by_nat.
airspace_design_complies_with_SRs.
fc_flt_contigency_procedures_validated.
modification_specified.
fc_procedures.
safety_justified_for_2000plus_levels.
fc_flt_planning_training_validated.
monitors_validated.
contingency_facilities.
crm_staff_competent.
thke_complient_with_masps.
atc_transition_procedures.
fc_transition_training_validated.
validated.
number_of_approved_aircraft_acceptable.
non_approved_aircraft_excluded.
fc_procedure_design_complies_with_SRs.
contingency_facilities_validated_by_competent_staff.
srs_are_fully_traceable_to_concept.
crm_scenarios_valid.
atc_transition_procedures_validated.
operational_risk_requirements_covered.
safety_reqts_fully_realised.
tolerable.
states_will_be_required_to_institute_fc.
fc_rvsm_training_validated_in_NAT.

