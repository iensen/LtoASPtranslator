
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#residual_risk = 
	{level_busts, asac_usage_risks, wake_vortices, mountain_waves, operational_errors}.

#hazard527 = 
	{ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}.

#risk527 = 
	{risk(ht_1_8), risk(ht_2_2), risk(ht_1_10), risk(ht_3_6), risk(ht_1_11)}.

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
	{ht_1_1, hm_2_27, hm_1_1, risk(ht_2_2), alert_on_adj_aircraft, ht_3_6, hm_2_7, risk(ht_1_11), level_busts, ht_1_5, ht_1_2, hm_2_1, hm_1_6, risk(hm_1_14), operational_errors, ht_3_5, ht_1_10, r(hm_1_3), hm_1_13, wake_vortices, risk(ht_1_8), hm_2_11, hm_2_13, hm_2_2, ifps, hm_1_8, asac_usage_risks, hm_1_15, fdps_fps, hm_2_10, hm_2_4, rdps, hm_2_6, ht_1_8, hm_1_10, hm_2_9, back_up_systems, r(hm_1_14), hm_2_8, oldi, hm_2_5, ht_2_2, hm_2_17, risk(ht_1_10), risk(hm_1_3), risk(ht_1_11), ht_1_9, hm_1_2, risk(ht_3_6), hm_1_9, mountain_waves}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

fc_rvsm_procedures_validated().
height_keeping_requirements_covered().
contingency_facilities_validated_by_competent_staff().
complies_with_recommended_practice(#universal).
assumptions_about_alert_rate_validated().
contingency_facilities_produced_by_competent_staff().
atc_transition_procedures().
airspace_design_complies_with_SRs().
atc_contingency_procedures().
original_crm_validated_by_nat().
fc_contigency_training().
concept_meets_RVSM_safety_requirements().
crm_assumptions_are_valid().
overlap_frequency_verified().
crm_staff_competent().
fc_transition_procedures_produced().
hazards_mitigated().
modification_made(#universal).
transition_areas().
fc_flt_contigency_procedures_produced().
operation_error_rate_verified().
atc_training_design_complies_with_SRs().
fc_transition_procedures().
fc_rvsm_training().
fc_transition_training_produced().
atc_contingency_procedures_produced().
masps_height_keeping_accuracy_met().
thke_measured_by_monitors().
fc_procedure_design_complies_with_SRs().
transition_areas_validated_by_competent_staff().
tls_met().
tolerable(#universal).
total_vertical_risk_covered().
fc_flt_planning_procedures().
fc_flt_planning_training_produced().
six_new_RVSM_flight_levels().
fc_procedures().
fc_flt_planning_training_validated_in_NAT().
torerable(#universal).
atc_clearance_procedures_produced().
transition_areas_produced_by_competent_staff().
non_approved_aircraft_excluded().
system_monitoring_complies_with_SRs().
number_of_approved_aircraft_acceptable().
fc_flt_planning_training_validated().
monitors_validated().
all_atc_training_validated().
fc_training_design_complies_with_SRs().
fc_rvsm_procedures_proved_by_NAT().
modification_specified(#universal).
fc_flt_contigency_procedures().
all_atc_trainings().
safety_constraints_satisfied().
atc_transition_procedures_validated().
fc_contigency_training_validated().
fc_flt_planning_procedures_validated().
controlled(#universal).
atc_procedure_design_complies_with_SRs().
residual_risks_controlled().
fps_oldi_messaged_display_rfl().
fc_flt_contigency_procedures_validated().
fc_transition_training_validated_in_NAT().
aircraft_equipment_design_complies_with_SRs().
fc_contigency_training_produced().
fc_flt_planning_procedures_proved_by_NAT().
six_new_RVSM_flight_levels_validated_by_competent_staff().
fc_transition_training_validated().
all_atc_training_produced_by_competent_staff().
modifications_made_to_identify_and_display_apprv_aircraft().
validated(#universal).
fc_transition_training().
crm_scenarios_valid().
atc_rvsm_procedures().
rvsm_adapted_crm_validated().
atc_rvsm_procedures_validated().
six_new_RVSM_flight_levels_produced_by_competent_staff().
atc_transition_procedures_produced().
thke_complient_with_masps().
safety_proven_for_2001_levels().
safety_reqts_fully_realised().
fc_flt_planning_training().
fc_rvsm_training_validated().
fc_contigency_training_validated_in_NAT().
fc_rvsm_training_produced().
atc_clearance_procedures().
atc_equipment_design_complies_with_SRs().
number_of_non_approved_aircraft_acceptable().
crm_shows_tls_met().
risks_controlled().
fc_transition_procedures_verified().
safety_justified_for_2000plus_levels().
crm_valid().
operational_risk_requirements_covered().
fc_are_aware_of_EUR_RVSM().
fc_rvsm_procedures_produced().
states_will_be_required_to_institute_fc().
required_height_keeping_accuracy_met().
atc_contingency_procedures_validated().
srs_are_fully_traceable_to_concept().
fc_rvsm_procedures().
atc_rvsm_procedures_produced().
mitigated(#universal).
fc_rvsm_training_validated_in_NAT().
atc_clearance_procedures_validated().
contingency_facilities().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

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
	controlled(wake_vortices),
	controlled(level_busts),
	controlled(operational_errors),
	controlled(mountain_waves),
	controlled(asac_usage_risks).

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
	controlled(risk(ht_1_10)),
	controlled(risk(ht_1_8)),
	controlled(risk(ht_2_2)),
	controlled(risk(ht_3_6)),
	controlled(risk(ht_1_11)).

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
	mitigated(hm_1_8),
	mitigated(hm_1_15).

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
	mitigated(ht_3_5),
	mitigated(hm_1_8),
	mitigated(hm_1_6),
	mitigated(hm_1_15),
	mitigated(hm_2_2),
	mitigated(ht_1_9).

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
	controlled(risk(hm_1_3)),
	controlled(risk(hm_1_14)).

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
	mitigated(hm_2_17),
	mitigated(hm_2_1),
	mitigated(hm_1_9),
	mitigated(hm_2_5),
	mitigated(hm_1_15),
	mitigated(hm_2_7),
	mitigated(ht_2_2),
	mitigated(ht_1_9),
	mitigated(hm_1_13),
	mitigated(ht_1_1),
	mitigated(ht_1_8),
	mitigated(ht_3_6),
	mitigated(ht_3_5),
	mitigated(hm_2_4),
	mitigated(hm_2_9),
	mitigated(hm_1_10),
	mitigated(ht_1_2),
	mitigated(ht_1_5).

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
	mitigated(hm_2_17),
	mitigated(hm_2_1),
	mitigated(hm_1_9),
	mitigated(hm_2_5),
	mitigated(hm_1_15),
	mitigated(hm_2_7),
	mitigated(ht_2_2),
	mitigated(ht_1_9),
	mitigated(hm_1_13),
	mitigated(ht_1_1),
	mitigated(ht_1_8),
	mitigated(ht_3_6),
	mitigated(ht_3_5),
	mitigated(hm_2_4),
	mitigated(hm_2_9),
	mitigated(hm_1_10),
	mitigated(ht_1_2),
	mitigated(ht_1_5).

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
	modification_made(ifps),
	modification_made(fdps_fps),
	modification_made(rdps),
	modification_made(back_up_systems),
	modification_made(oldi).

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

complies_with_recommended_practice(back_up_systems).

complies_with_recommended_practice(fdps_fps).

complies_with_recommended_practice(rdps).

complies_with_recommended_practice(ifps).

complies_with_recommended_practice(alert_on_adj_aircraft).

complies_with_recommended_practice(oldi).

validated(back_up_systems).

validated(fdps_fps).

validated(rdps).

validated(ifps).

validated(alert_on_adj_aircraft).

validated(oldi).

fps_oldi_messaged_display_rfl.

hazards_mitigated :-
	mitigated(hm_2_17),
	mitigated(hm_2_7),
	mitigated(hm_2_5),
	mitigated(hm_1_2),
	mitigated(ht_1_9),
	mitigated(hm_2_27),
	mitigated(hm_2_6),
	mitigated(hm_2_11),
	mitigated(hm_2_13),
	mitigated(hm_2_8),
	mitigated(hm_2_10).

mitigated(hm_2_17).

mitigated(hm_2_7).

mitigated(hm_2_5).

mitigated(hm_1_2).

mitigated(ht_1_9).

mitigated(hm_2_27).

mitigated(hm_2_6).

mitigated(hm_2_11).

mitigated(hm_2_13).

mitigated(hm_2_8).

mitigated(hm_2_10).

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
	mitigated(hm_2_2),
	mitigated(hm_1_1).

mitigated(hm_2_2) :-
	non_approved_aircraft_excluded.

mitigated(hm_1_1) :-
	assumptions_about_alert_rate_validated.

safety_constraints_satisfied :-
	safety_proven_for_2001_levels,
	safety_justified_for_2000plus_levels.

safety_proven_for_2001_levels.

safety_justified_for_2000plus_levels.


