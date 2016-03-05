
sorts

#residual_risk = {level_busts, asac_usage_risks, wake_vortices, mountain_waves, operational_errors}.
#hazard527 = {ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}.
#risk527 = {risk(ht_1_11), risk(ht_3_6), risk(ht_2_2), risk(ht_1_8), risk(ht_1_10)}.
#hazard537 = {ht_3_5, hm_1_8, hm_2_2, hm_1_15}.
#hazard546 = {ht_1_9, ht_3_5, hm_2_2, hm_1_6, hm_1_8, hm_1_15}.
#hazard556 = {hm_1_3, hm_1_14}.
#risk556 = {r(hm_1_3), r(hm_1_14)}.
#hazard565 = {ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5, ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15, hm_2_17, hm_2_7, hm_2_9}.
#hazard575 = {ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5, ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15, hm_2_17, hm_2_7, hm_2_9}.
#mod_to_identify_and_display_apprv_aircraft = {ifps, rdps, fdps_fps, oldi, back_up_systems}.
#modification = #mod_to_identify_and_display_apprv_aircraft + {alert_on_adj_aircraft}.
#hazard5810 = {hm_2_6, hm_2_5, hm_2_17, hm_1_2, hm_2_7, hm_2_8, hm_2_13, hm_2_10, hm_2_11, ht_1_9, hm_2_27}.
#hazard5910 = {hm_2_2, hm_1_1}.
#tolerable_1_termS = {operational_errors, risk(ht_2_2), level_busts, mountain_waves, r(hm_1_14), risk(ht_1_8), hm_1_3, asac_usage_risks, risk(ht_1_11), risk(ht_1_10), wake_vortices, ht_1_11, r(hm_1_3), risk(ht_3_6), hm_1_14}.
#complies_with_recommended_practice_1_termS = {ifps, fdps_fps, rdps, oldi, alert_on_adj_aircraft, back_up_systems}.
#modification_made_1_termS = {ifps, fdps_fps, rdps, oldi, alert_on_adj_aircraft, back_up_systems}.
#mitigated_1_termS = {hm_2_13, hm_2_4, hm_2_1, hm_2_11, ht_3_6, asac_usage_risks, hm_2_2, ht_1_10, hm_2_6, ht_1_1, hm_2_27, hm_2_10, level_busts, mountain_waves, ht_1_5, hm_1_8, wake_vortices, hm_1_14, ht_2_2, hm_1_13, hm_2_8, hm_1_6, hm_1_3, hm_1_10, ht_1_2, hm_1_2, ht_1_11, ht_3_5, hm_1_1, hm_2_9, ht_1_9, ht_1_8, hm_1_15, operational_errors, hm_2_5, hm_2_7, hm_1_9, hm_2_17}.
#controlled_1_termS = {ht_2_2, risk(ht_2_2), ht_3_6, hm_1_3, asac_usage_risks, risk(ht_1_11), ht_1_11, risk(ht_1_10), ht_1_10, ht_1_8, risk(hm_1_14), operational_errors, level_busts, mountain_waves, r(hm_1_14), risk(ht_1_8), r(hm_1_3), wake_vortices, risk(ht_3_6), risk(hm_1_3), hm_1_14}.
#validated_1_termS = {ifps, fdps_fps, rdps, oldi, alert_on_adj_aircraft, back_up_systems}.
#modification_specified_1_termS = {ifps, fdps_fps, oldi, rdps, alert_on_adj_aircraft, back_up_systems}.

predicates

masps_height_keeping_accuracy_met().
concept_meets_RVSM_safety_requirements().
contingency_facilities_validated_by_competent_staff().
all_atc_training_validated().
fc_transition_training_produced().
atc_equipment_design_complies_with_SRs().
crm_staff_competent().
overlap_frequency_verified().
atc_contingency_procedures_produced().
atc_transition_procedures_produced().
fc_rvsm_training_produced().
fc_rvsm_procedures().
atc_rvsm_procedures_produced().
fc_flt_planning_procedures_validated().
atc_contingency_procedures_validated().
fc_transition_training_validated_in_NAT().
fc_are_aware_of_EUR_RVSM().
residual_risks_controlled().
six_new_RVSM_flight_levels_produced_by_competent_staff().
fps_oldi_messaged_display_rfl().
monitors_validated().
transition_areas().
fc_transition_training_validated().
modification_made(#modification_made_1_termS).
required_height_keeping_accuracy_met().
contingency_facilities_produced_by_competent_staff().
atc_rvsm_procedures().
fc_transition_procedures_verified().
fc_flt_planning_procedures().
states_will_be_required_to_institute_fc().
srs_are_fully_traceable_to_concept().
crm_valid().
fc_contigency_training_produced().
fc_rvsm_training().
number_of_approved_aircraft_acceptable().
atc_transition_procedures().
fc_contigency_training_validated_in_NAT().
airspace_design_complies_with_SRs().
atc_transition_procedures_validated().
fc_flt_contigency_procedures_produced().
atc_contingency_procedures().
safety_justified_for_2000plus_levels().
safety_reqts_fully_realised().
crm_assumptions_are_valid().
thke_complient_with_masps().
fc_procedure_design_complies_with_SRs().
atc_rvsm_procedures_validated().
operation_error_rate_verified().
fc_rvsm_procedures_validated().
fc_training_design_complies_with_SRs().
atc_clearance_procedures_validated().
atc_clearance_procedures().
fc_flt_planning_procedures_proved_by_NAT().
fc_contigency_training_validated().
thke_measured_by_monitors().
six_new_RVSM_flight_levels().
safety_proven_for_2001_levels().
operational_risk_requirements_covered().
crm_scenarios_valid().
six_new_RVSM_flight_levels_validated_by_competent_staff().
number_of_non_approved_aircraft_acceptable().
validated(#validated_1_termS).
fc_transition_training().
mitigated(#mitigated_1_termS).
complies_with_recommended_practice(#complies_with_recommended_practice_1_termS).
fc_flt_planning_training_validated().
fc_flt_planning_training_validated_in_NAT().
safety_constraints_satisfied().
aircraft_equipment_design_complies_with_SRs().
fc_rvsm_training_validated_in_NAT().
fc_transition_procedures_produced().
crm_shows_tls_met().
fc_rvsm_training_validated().
modification_specified(#modification_specified_1_termS).
all_atc_training_produced_by_competent_staff().
transition_areas_produced_by_competent_staff().
risks_controlled().
fc_rvsm_procedures_produced().
contingency_facilities().
hazards_mitigated().
atc_clearance_procedures_produced().
rvsm_adapted_crm_validated().
non_approved_aircraft_excluded().
original_crm_validated_by_nat().
total_vertical_risk_covered().
all_atc_trainings().
assumptions_about_alert_rate_validated().
atc_procedure_design_complies_with_SRs().
system_monitoring_complies_with_SRs().
controlled(#controlled_1_termS).
fc_rvsm_procedures_proved_by_NAT().
transition_areas_validated_by_competent_staff().
fc_procedures().
height_keeping_requirements_covered().
fc_flt_planning_training().
fc_contigency_training().
tolerable(#tolerable_1_termS).
fc_flt_contigency_procedures().
fc_transition_procedures().
tls_met().
fc_flt_contigency_procedures_validated().
modifications_made_to_identify_and_display_apprv_aircraft().
atc_training_design_complies_with_SRs().
fc_flt_planning_training_produced().


rules

safety_reqts_fully_realised :- airspace_design_complies_with_SRs, fc_procedure_design_complies_with_SRs, fc_training_design_complies_with_SRs, aircraft_equipment_design_complies_with_SRs, atc_procedure_design_complies_with_SRs, atc_training_design_complies_with_SRs, atc_equipment_design_complies_with_SRs, system_monitoring_complies_with_SRs, safety_constraints_satisfied, srs_are_fully_traceable_to_concept, residual_risks_controlled, concept_meets_RVSM_safety_requirements.
srs_are_fully_traceable_to_concept.
residual_risks_controlled :- controlled(asac_usage_risks), controlled(level_busts), controlled(mountain_waves), controlled(operational_errors), controlled(wake_vortices).
controlled(R) :- mitigated(R), #residual_risk(R).
controlled(R) :- tolerable(R), #residual_risk(R).
mitigated(level_busts).
mitigated(asac_usage_risks).
tolerable(wake_vortices).
tolerable(mountain_waves).
tolerable(operational_errors).
concept_meets_RVSM_safety_requirements :- height_keeping_requirements_covered, operational_risk_requirements_covered, total_vertical_risk_covered.
height_keeping_requirements_covered.
operational_risk_requirements_covered.
total_vertical_risk_covered.
airspace_design_complies_with_SRs :- transition_areas, six_new_RVSM_flight_levels, risks_controlled, contingency_facilities.
transition_areas :- transition_areas_produced_by_competent_staff, transition_areas_validated_by_competent_staff.
transition_areas_produced_by_competent_staff.
transition_areas_validated_by_competent_staff.
six_new_RVSM_flight_levels :- six_new_RVSM_flight_levels_produced_by_competent_staff, six_new_RVSM_flight_levels_validated_by_competent_staff.
six_new_RVSM_flight_levels_produced_by_competent_staff.
six_new_RVSM_flight_levels_validated_by_competent_staff.
risks_controlled :- controlled(risk(ht_3_6)), controlled(risk(ht_1_11)), controlled(risk(ht_1_8)), controlled(risk(ht_2_2)), controlled(risk(ht_1_10)).
controlled(R) :- mitigated(H), R = risk(H), #hazard527(H), #risk527(R).
controlled(R) :- tolerable(R), #risk527(R).
mitigated(ht_1_8).
mitigated(ht_1_10).
mitigated(ht_2_2).
mitigated(ht_3_6).
tolerable(risk(ht_1_11)).
contingency_facilities :- contingency_facilities_produced_by_competent_staff, contingency_facilities_validated_by_competent_staff.
contingency_facilities_produced_by_competent_staff.
contingency_facilities_validated_by_competent_staff.
fc_procedure_design_complies_with_SRs :- fc_procedures, states_will_be_required_to_institute_fc, fc_are_aware_of_EUR_RVSM, hazards_mitigated.
fc_procedures :- fc_transition_procedures, fc_rvsm_procedures, fc_flt_planning_procedures, fc_flt_contigency_procedures.
fc_transition_procedures :- fc_transition_procedures_produced, fc_transition_procedures_verified.
fc_transition_procedures_produced.
fc_transition_procedures_verified.
fc_rvsm_procedures :- fc_rvsm_procedures_produced, fc_rvsm_procedures_validated.
fc_rvsm_procedures_produced.
fc_rvsm_procedures_validated :- fc_rvsm_procedures_proved_by_NAT.
fc_rvsm_procedures_proved_by_NAT.
fc_flt_contigency_procedures :- fc_flt_contigency_procedures_produced, fc_flt_contigency_procedures_validated.
fc_flt_contigency_procedures_produced.
fc_flt_contigency_procedures_validated.
fc_flt_planning_procedures :- fc_transition_procedures_produced, fc_flt_planning_procedures_validated.
fc_flt_planning_procedures.
fc_flt_planning_procedures_validated :- fc_flt_planning_procedures_proved_by_NAT.
fc_flt_planning_procedures_proved_by_NAT.
states_will_be_required_to_institute_fc.
fc_are_aware_of_EUR_RVSM.
hazards_mitigated :- mitigated(hm_1_8), mitigated(hm_2_2), mitigated(ht_3_5), mitigated(hm_1_15).
mitigated(ht_3_5).
mitigated(hm_1_8).
mitigated(hm_2_2).
mitigated(hm_1_15).
aircraft_equipment_design_complies_with_SRs :- fc_training_design_complies_with_SRs, fc_transition_training.
fc_training_design_complies_with_SRs :- fc_transition_training, fc_rvsm_training, fc_contigency_training, fc_flt_planning_training, hazards_mitigated.
fc_transition_training :- fc_transition_training_produced, fc_transition_training_validated.
fc_transition_training_produced.
fc_transition_training_validated :- fc_transition_training_validated_in_NAT.
fc_transition_training_validated_in_NAT.
fc_rvsm_training :- fc_rvsm_training_produced, fc_rvsm_training_validated.
fc_rvsm_training_produced.
fc_rvsm_training_validated :- fc_rvsm_training_validated_in_NAT.
fc_rvsm_training_validated_in_NAT.
fc_contigency_training :- fc_contigency_training_produced, fc_contigency_training_validated.
fc_contigency_training_produced.
fc_contigency_training_validated :- fc_contigency_training_validated_in_NAT.
fc_contigency_training_validated_in_NAT.
fc_flt_planning_training :- fc_flt_planning_training_produced, fc_flt_planning_training_validated.
fc_flt_planning_training_produced.
fc_flt_planning_training_validated :- fc_flt_planning_training_validated_in_NAT.
fc_flt_planning_training_validated_in_NAT.
hazards_mitigated :- mitigated(ht_1_9), mitigated(hm_1_15), mitigated(hm_1_6), mitigated(hm_2_2), mitigated(hm_1_8), mitigated(ht_3_5).
mitigated(ht_1_9).
mitigated(ht_3_5).
mitigated(hm_2_2).
mitigated(hm_1_6).
mitigated(hm_1_8).
mitigated(hm_1_15).
aircraft_equipment_design_complies_with_SRs :- tls_met, risks_controlled.
tls_met :- required_height_keeping_accuracy_met.
required_height_keeping_accuracy_met :- masps_height_keeping_accuracy_met.
masps_height_keeping_accuracy_met :- crm_valid.
crm_valid.
risks_controlled :- controlled(risk(hm_1_3)), controlled(risk(hm_1_14)).
controlled(R) :- mitigated(H), R = r(H), #risk556(R), #hazard556(H).
controlled(R) :- tolerable(R), #risk556(R).
tolerable(r(hm_1_14)).
tolerable(r(hm_1_3)).
atc_procedure_design_complies_with_SRs :- atc_transition_procedures, atc_rvsm_procedures, atc_contingency_procedures, atc_clearance_procedures, hazards_mitigated.
atc_transition_procedures :- atc_transition_procedures_produced, atc_transition_procedures_validated.
atc_transition_procedures_produced.
atc_transition_procedures_validated.
atc_rvsm_procedures :- atc_rvsm_procedures_produced, atc_rvsm_procedures_validated.
atc_rvsm_procedures_produced.
atc_rvsm_procedures_validated.
atc_contingency_procedures :- atc_contingency_procedures_produced, atc_contingency_procedures_validated.
atc_contingency_procedures_produced.
atc_contingency_procedures_validated.
atc_clearance_procedures :- atc_clearance_procedures_produced, atc_clearance_procedures_validated.
atc_clearance_procedures_produced.
atc_clearance_procedures_validated.
hazards_mitigated :- mitigated(hm_2_5), mitigated(ht_3_6), mitigated(ht_1_8), mitigated(hm_2_17), mitigated(hm_1_15), mitigated(hm_1_9), mitigated(ht_1_1), mitigated(ht_2_2), mitigated(hm_1_13), mitigated(hm_2_1), mitigated(ht_1_9), mitigated(hm_2_7), mitigated(ht_1_2), mitigated(ht_1_5), mitigated(hm_2_4), mitigated(hm_1_10), mitigated(hm_2_9), mitigated(ht_3_5).
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
atc_training_design_complies_with_SRs :- all_atc_trainings, hazards_mitigated.
all_atc_trainings :- all_atc_training_produced_by_competent_staff, all_atc_training_validated.
all_atc_training_produced_by_competent_staff.
all_atc_training_validated.
hazards_mitigated :- mitigated(hm_2_5), mitigated(ht_3_6), mitigated(ht_1_8), mitigated(hm_2_17), mitigated(hm_1_15), mitigated(hm_1_9), mitigated(ht_1_1), mitigated(ht_2_2), mitigated(hm_1_13), mitigated(hm_2_1), mitigated(ht_1_9), mitigated(hm_2_7), mitigated(ht_1_2), mitigated(ht_1_5), mitigated(hm_2_4), mitigated(hm_1_10), mitigated(hm_2_9), mitigated(ht_3_5).
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
atc_equipment_design_complies_with_SRs :- modification_made(alert_on_adj_aircraft), modifications_made_to_identify_and_display_apprv_aircraft, fps_oldi_messaged_display_rfl, hazards_mitigated.
modifications_made_to_identify_and_display_apprv_aircraft :- modification_made(back_up_systems), modification_made(rdps), modification_made(ifps), modification_made(fdps_fps), modification_made(oldi).
modification_made(X) :- modification_specified(X), complies_with_recommended_practice(X), validated(X), #modification(X).
modification_specified(alert_on_adj_aircraft).
modification_specified(ifps).
modification_specified(rdps).
modification_specified(fdps_fps).
modification_specified(oldi).
modification_specified(back_up_systems).
complies_with_recommended_practice(Every0) :- #modification(Every0).
validated(Every0) :- #modification(Every0).
fps_oldi_messaged_display_rfl.
hazards_mitigated :- mitigated(hm_2_5), mitigated(hm_2_6), mitigated(hm_2_17), mitigated(hm_2_27), mitigated(hm_2_13), mitigated(hm_1_2), mitigated(ht_1_9), mitigated(hm_2_7), mitigated(hm_2_11), mitigated(hm_2_10), mitigated(hm_2_8).
mitigated(Every0) :- #hazard5810(Every0).
system_monitoring_complies_with_SRs :- thke_complient_with_masps, operation_error_rate_verified, non_approved_aircraft_excluded, tls_met, hazards_mitigated, assumptions_about_alert_rate_validated.
thke_complient_with_masps :- thke_measured_by_monitors, monitors_validated.
thke_measured_by_monitors.
monitors_validated.
operation_error_rate_verified.
crm_assumptions_are_valid :- overlap_frequency_verified, original_crm_validated_by_nat, rvsm_adapted_crm_validated, crm_scenarios_valid, crm_staff_competent.
overlap_frequency_verified.
original_crm_validated_by_nat.
rvsm_adapted_crm_validated.
crm_scenarios_valid.
crm_staff_competent.
non_approved_aircraft_excluded :- number_of_non_approved_aircraft_acceptable, number_of_approved_aircraft_acceptable.
number_of_non_approved_aircraft_acceptable.
number_of_approved_aircraft_acceptable.
tls_met :- crm_shows_tls_met, crm_assumptions_are_valid.
crm_shows_tls_met.
assumptions_about_alert_rate_validated.
hazards_mitigated :- mitigated(hm_2_2), mitigated(hm_1_1).
mitigated(hm_2_2) :- non_approved_aircraft_excluded.
mitigated(hm_1_1) :- assumptions_about_alert_rate_validated.
safety_constraints_satisfied :- safety_proven_for_2001_levels, safety_justified_for_2000plus_levels.
safety_proven_for_2001_levels.
safety_justified_for_2000plus_levels.
-fc_rvsm_training_validated :- not fc_rvsm_training_validated.
-fc_flt_planning_procedures :- not fc_flt_planning_procedures.
-atc_transition_procedures_validated :- not atc_transition_procedures_validated.
-thke_measured_by_monitors :- not thke_measured_by_monitors.
-crm_shows_tls_met :- not crm_shows_tls_met.
-assumptions_about_alert_rate_validated :- not assumptions_about_alert_rate_validated.
-monitors_validated :- not monitors_validated.
-safety_justified_for_2000plus_levels :- not safety_justified_for_2000plus_levels.
-controlled(CWA_Var_1) :- not controlled(CWA_Var_1), #controlled_1_termS(CWA_Var_1).
-atc_contingency_procedures_produced :- not atc_contingency_procedures_produced.
-fc_rvsm_procedures_validated :- not fc_rvsm_procedures_validated.
-atc_procedure_design_complies_with_SRs :- not atc_procedure_design_complies_with_SRs.
-crm_valid :- not crm_valid.
-atc_contingency_procedures :- not atc_contingency_procedures.
-fc_rvsm_training_produced :- not fc_rvsm_training_produced.
-fc_transition_training :- not fc_transition_training.
-fc_contigency_training :- not fc_contigency_training.
-fps_oldi_messaged_display_rfl :- not fps_oldi_messaged_display_rfl.
-airspace_design_complies_with_SRs :- not airspace_design_complies_with_SRs.
-crm_scenarios_valid :- not crm_scenarios_valid.
-validated(CWA_Var_1) :- not validated(CWA_Var_1), #validated_1_termS(CWA_Var_1).
-transition_areas_produced_by_competent_staff :- not transition_areas_produced_by_competent_staff.
-total_vertical_risk_covered :- not total_vertical_risk_covered.
-fc_transition_procedures_verified :- not fc_transition_procedures_verified.
-fc_transition_procedures_produced :- not fc_transition_procedures_produced.
-modification_specified(CWA_Var_1) :- not modification_specified(CWA_Var_1), #modification_specified_1_termS(CWA_Var_1).
-all_atc_training_produced_by_competent_staff :- not all_atc_training_produced_by_competent_staff.
-atc_rvsm_procedures_validated :- not atc_rvsm_procedures_validated.
-fc_contigency_training_validated :- not fc_contigency_training_validated.
-safety_constraints_satisfied :- not safety_constraints_satisfied.
-risks_controlled :- not risks_controlled.
-atc_clearance_procedures_produced :- not atc_clearance_procedures_produced.
-fc_flt_contigency_procedures_validated :- not fc_flt_contigency_procedures_validated.
-fc_rvsm_training_validated_in_NAT :- not fc_rvsm_training_validated_in_NAT.
-original_crm_validated_by_nat :- not original_crm_validated_by_nat.
-atc_equipment_design_complies_with_SRs :- not atc_equipment_design_complies_with_SRs.
-thke_complient_with_masps :- not thke_complient_with_masps.
-fc_flt_planning_training_validated_in_NAT :- not fc_flt_planning_training_validated_in_NAT.
-all_atc_trainings :- not all_atc_trainings.
-fc_procedures :- not fc_procedures.
-fc_flt_planning_procedures_validated :- not fc_flt_planning_procedures_validated.
-fc_transition_training_validated_in_NAT :- not fc_transition_training_validated_in_NAT.
-safety_reqts_fully_realised :- not safety_reqts_fully_realised.
-atc_clearance_procedures :- not atc_clearance_procedures.
-fc_flt_planning_training_validated :- not fc_flt_planning_training_validated.
-operation_error_rate_verified :- not operation_error_rate_verified.
-fc_rvsm_procedures :- not fc_rvsm_procedures.
-contingency_facilities :- not contingency_facilities.
-srs_are_fully_traceable_to_concept :- not srs_are_fully_traceable_to_concept.
-fc_rvsm_training :- not fc_rvsm_training.
-atc_transition_procedures_produced :- not atc_transition_procedures_produced.
-tls_met :- not tls_met.
-overlap_frequency_verified :- not overlap_frequency_verified.
-fc_contigency_training_validated_in_NAT :- not fc_contigency_training_validated_in_NAT.
-crm_assumptions_are_valid :- not crm_assumptions_are_valid.
-atc_clearance_procedures_validated :- not atc_clearance_procedures_validated.
-fc_rvsm_procedures_proved_by_NAT :- not fc_rvsm_procedures_proved_by_NAT.
-contingency_facilities_validated_by_competent_staff :- not contingency_facilities_validated_by_competent_staff.
-crm_staff_competent :- not crm_staff_competent.
-modification_made(CWA_Var_1) :- not modification_made(CWA_Var_1), #modification_made_1_termS(CWA_Var_1).
-required_height_keeping_accuracy_met :- not required_height_keeping_accuracy_met.
-contingency_facilities_produced_by_competent_staff :- not contingency_facilities_produced_by_competent_staff.
-non_approved_aircraft_excluded :- not non_approved_aircraft_excluded.
-system_monitoring_complies_with_SRs :- not system_monitoring_complies_with_SRs.
-modifications_made_to_identify_and_display_apprv_aircraft :- not modifications_made_to_identify_and_display_apprv_aircraft.
-six_new_RVSM_flight_levels_produced_by_competent_staff :- not six_new_RVSM_flight_levels_produced_by_competent_staff.
-fc_rvsm_procedures_produced :- not fc_rvsm_procedures_produced.
-number_of_approved_aircraft_acceptable :- not number_of_approved_aircraft_acceptable.
-states_will_be_required_to_institute_fc :- not states_will_be_required_to_institute_fc.
-six_new_RVSM_flight_levels :- not six_new_RVSM_flight_levels.
-atc_rvsm_procedures_produced :- not atc_rvsm_procedures_produced.
-number_of_non_approved_aircraft_acceptable :- not number_of_non_approved_aircraft_acceptable.
-mitigated(CWA_Var_1) :- not mitigated(CWA_Var_1), #mitigated_1_termS(CWA_Var_1).
-all_atc_training_validated :- not all_atc_training_validated.
-transition_areas :- not transition_areas.
-operational_risk_requirements_covered :- not operational_risk_requirements_covered.
-rvsm_adapted_crm_validated :- not rvsm_adapted_crm_validated.
-atc_contingency_procedures_validated :- not atc_contingency_procedures_validated.
-fc_flt_planning_procedures_proved_by_NAT :- not fc_flt_planning_procedures_proved_by_NAT.
-residual_risks_controlled :- not residual_risks_controlled.
-fc_transition_training_validated :- not fc_transition_training_validated.
-fc_procedure_design_complies_with_SRs :- not fc_procedure_design_complies_with_SRs.
-aircraft_equipment_design_complies_with_SRs :- not aircraft_equipment_design_complies_with_SRs.
-fc_flt_contigency_procedures :- not fc_flt_contigency_procedures.
-fc_flt_planning_training_produced :- not fc_flt_planning_training_produced.
-height_keeping_requirements_covered :- not height_keeping_requirements_covered.
-concept_meets_RVSM_safety_requirements :- not concept_meets_RVSM_safety_requirements.
-fc_transition_training_produced :- not fc_transition_training_produced.
-atc_rvsm_procedures :- not atc_rvsm_procedures.
-fc_contigency_training_produced :- not fc_contigency_training_produced.
-fc_flt_contigency_procedures_produced :- not fc_flt_contigency_procedures_produced.
-safety_proven_for_2001_levels :- not safety_proven_for_2001_levels.
-hazards_mitigated :- not hazards_mitigated.
-fc_flt_planning_training :- not fc_flt_planning_training.
-tolerable(CWA_Var_1) :- not tolerable(CWA_Var_1), #tolerable_1_termS(CWA_Var_1).
-fc_transition_procedures :- not fc_transition_procedures.
-atc_transition_procedures :- not atc_transition_procedures.
-masps_height_keeping_accuracy_met :- not masps_height_keeping_accuracy_met.
-fc_are_aware_of_EUR_RVSM :- not fc_are_aware_of_EUR_RVSM.
-complies_with_recommended_practice(CWA_Var_1) :- not complies_with_recommended_practice(CWA_Var_1), #complies_with_recommended_practice_1_termS(CWA_Var_1).
-six_new_RVSM_flight_levels_validated_by_competent_staff :- not six_new_RVSM_flight_levels_validated_by_competent_staff.
-transition_areas_validated_by_competent_staff :- not transition_areas_validated_by_competent_staff.
-fc_training_design_complies_with_SRs :- not fc_training_design_complies_with_SRs.
-atc_training_design_complies_with_SRs :- not atc_training_design_complies_with_SRs.

display

masps_height_keeping_accuracy_met. concept_meets_RVSM_safety_requirements. contingency_facilities_validated_by_competent_staff. all_atc_training_validated. fc_transition_training_produced. atc_equipment_design_complies_with_SRs. crm_staff_competent. overlap_frequency_verified. atc_contingency_procedures_produced. atc_transition_procedures_produced. fc_rvsm_training_produced. fc_rvsm_procedures. atc_rvsm_procedures_produced. fc_flt_planning_procedures_validated. atc_contingency_procedures_validated. fc_transition_training_validated_in_NAT. fc_are_aware_of_EUR_RVSM. residual_risks_controlled. six_new_RVSM_flight_levels_produced_by_competent_staff. fps_oldi_messaged_display_rfl. monitors_validated. transition_areas. fc_transition_training_validated. modification_made. required_height_keeping_accuracy_met. contingency_facilities_produced_by_competent_staff. atc_rvsm_procedures. fc_transition_procedures_verified. fc_flt_planning_procedures. states_will_be_required_to_institute_fc. srs_are_fully_traceable_to_concept. crm_valid. fc_contigency_training_produced. fc_rvsm_training. number_of_approved_aircraft_acceptable. atc_transition_procedures. fc_contigency_training_validated_in_NAT. airspace_design_complies_with_SRs. atc_transition_procedures_validated. fc_flt_contigency_procedures_produced. atc_contingency_procedures. safety_justified_for_2000plus_levels. safety_reqts_fully_realised. crm_assumptions_are_valid. thke_complient_with_masps. fc_procedure_design_complies_with_SRs. atc_rvsm_procedures_validated. operation_error_rate_verified. fc_rvsm_procedures_validated. fc_training_design_complies_with_SRs. atc_clearance_procedures_validated. atc_clearance_procedures. fc_flt_planning_procedures_proved_by_NAT. fc_contigency_training_validated. thke_measured_by_monitors. six_new_RVSM_flight_levels. safety_proven_for_2001_levels. operational_risk_requirements_covered. crm_scenarios_valid. six_new_RVSM_flight_levels_validated_by_competent_staff. number_of_non_approved_aircraft_acceptable. validated. fc_transition_training. mitigated. complies_with_recommended_practice. fc_flt_planning_training_validated. fc_flt_planning_training_validated_in_NAT. safety_constraints_satisfied. aircraft_equipment_design_complies_with_SRs. fc_rvsm_training_validated_in_NAT. fc_transition_procedures_produced. crm_shows_tls_met. fc_rvsm_training_validated. modification_specified. all_atc_training_produced_by_competent_staff. transition_areas_produced_by_competent_staff. risks_controlled. fc_rvsm_procedures_produced. contingency_facilities. hazards_mitigated. atc_clearance_procedures_produced. rvsm_adapted_crm_validated. non_approved_aircraft_excluded. original_crm_validated_by_nat. total_vertical_risk_covered. all_atc_trainings. assumptions_about_alert_rate_validated. atc_procedure_design_complies_with_SRs. system_monitoring_complies_with_SRs. controlled. fc_rvsm_procedures_proved_by_NAT. transition_areas_validated_by_competent_staff. fc_procedures. height_keeping_requirements_covered. fc_flt_planning_training. fc_contigency_training. tolerable. fc_flt_contigency_procedures. fc_transition_procedures. tls_met. fc_flt_contigency_procedures_validated. modifications_made_to_identify_and_display_apprv_aircraft. atc_training_design_complies_with_SRs. fc_flt_planning_training_produced. 
