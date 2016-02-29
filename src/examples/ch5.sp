
sorts

#residual_risk = {level_busts, asac_usage_risks, wake_vortices, mountain_waves, operational_errors}.
#hazard527 = {ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}.
#risk527 = {risk(ht_3_6), risk(ht_1_10), risk(ht_2_2), risk(ht_1_8), risk(ht_1_11)}.
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
#modification_made_1_termS = {fdps_fps, oldi, ifps, rdps, alert_on_adj_aircraft, back_up_systems}.
#modification_specified_1_termS = {rdps, alert_on_adj_aircraft, fdps_fps, back_up_systems, oldi, ifps}.
#tolerable_1_termS = {risk(ht_1_8), wake_vortices, mountain_waves, operational_errors, ht_1_11, hm_1_14, r(hm_1_3), asac_usage_risks, risk(ht_3_6), hm_1_3, risk(ht_2_2), risk(ht_1_11), risk(ht_1_10), r(hm_1_14), level_busts}.
#mitigated_1_termS = {ht_1_2, operational_errors, ht_2_2, ht_1_1, hm_2_6, hm_2_1, hm_1_9, hm_1_2, hm_2_8, hm_2_11, hm_2_27, level_busts, hm_2_10, wake_vortices, asac_usage_risks, ht_1_5, hm_1_13, ht_3_6, hm_2_9, hm_2_13, ht_3_5, hm_2_2, hm_1_14, hm_1_8, hm_1_3, hm_1_1, hm_2_17, ht_1_8, hm_1_15, ht_1_9, mountain_waves, ht_1_11, hm_2_4, hm_2_7, ht_1_10, hm_2_5, hm_1_6, hm_1_10}.
#validated_1_termS = {fdps_fps, oldi, ifps, rdps, alert_on_adj_aircraft, back_up_systems}.
#controlled_1_termS = {risk(ht_1_8), operational_errors, ht_2_2, hm_1_14, r(hm_1_3), hm_1_3, r(hm_1_14), level_busts, ht_1_8, wake_vortices, mountain_waves, ht_1_11, risk(hm_1_14), risk(hm_1_3), asac_usage_risks, risk(ht_3_6), risk(ht_2_2), ht_1_10, risk(ht_1_11), ht_3_6, risk(ht_1_10)}.
#complies_with_recommended_practice_1_termS = {fdps_fps, oldi, ifps, rdps, alert_on_adj_aircraft, back_up_systems}.

predicates

crm_valid().
fc_transition_procedures_verified().
atc_training_design_complies_with_SRs().
safety_justified_for_2000plus_levels().
fc_transition_procedures_produced().
crm_scenarios_valid().
fc_are_aware_of_EUR_RVSM().
operational_risk_requirements_covered().
fc_rvsm_procedures_validated().
transition_areas().
tolerable(#tolerable_1_termS).
fc_flt_planning_training_validated_in_NAT().
assumptions_about_alert_rate_validated().
fc_flt_planning_training_produced().
contingency_facilities().
concept_meets_RVSM_safety_requirements().
risks_controlled().
all_atc_trainings().
residual_risks_controlled().
fc_procedure_design_complies_with_SRs().
transition_areas_validated_by_competent_staff().
six_new_RVSM_flight_levels().
fc_flt_planning_procedures().
fc_transition_training_validated().
atc_transition_procedures_produced().
fc_contigency_training_validated().
fc_flt_contigency_procedures_produced().
fc_flt_contigency_procedures_validated().
contingency_facilities_produced_by_competent_staff().
atc_transition_procedures().
fc_rvsm_procedures_proved_by_NAT().
thke_complient_with_masps().
atc_rvsm_procedures_validated().
operation_error_rate_verified().
number_of_non_approved_aircraft_acceptable().
fc_transition_training().
transition_areas_produced_by_competent_staff().
atc_clearance_procedures().
fc_flt_contigency_procedures().
crm_shows_tls_met().
tls_met().
atc_equipment_design_complies_with_SRs().
fc_training_design_complies_with_SRs().
states_will_be_required_to_institute_fc().
six_new_RVSM_flight_levels_validated_by_competent_staff().
all_atc_training_produced_by_competent_staff().
atc_procedure_design_complies_with_SRs().
masps_height_keeping_accuracy_met().
atc_transition_procedures_validated().
fc_contigency_training_produced().
airspace_design_complies_with_SRs().
hazards_mitigated().
rvsm_adapted_crm_validated().
total_vertical_risk_covered().
fps_oldi_messaged_display_rfl().
all_atc_training_validated().
fc_flt_planning_procedures_validated().
atc_contingency_procedures_produced().
mitigated(#mitigated_1_termS).
atc_clearance_procedures_validated().
fc_rvsm_procedures().
fc_flt_planning_procedures_proved_by_NAT().
non_approved_aircraft_excluded().
fc_rvsm_training_produced().
atc_rvsm_procedures_produced().
fc_flt_planning_training().
atc_clearance_procedures_produced().
required_height_keeping_accuracy_met().
modification_made(#modification_made_1_termS).
safety_reqts_fully_realised().
thke_measured_by_monitors().
validated(#validated_1_termS).
complies_with_recommended_practice(#complies_with_recommended_practice_1_termS).
height_keeping_requirements_covered().
crm_staff_competent().
atc_contingency_procedures_validated().
atc_contingency_procedures().
fc_contigency_training().
fc_transition_training_validated_in_NAT().
contingency_facilities_validated_by_competent_staff().
atc_rvsm_procedures().
controlled(#controlled_1_termS).
crm_assumptions_are_valid().
modification_specified(#modification_specified_1_termS).
fc_procedures().
fc_rvsm_training_validated().
modifications_made_to_identify_and_display_apprv_aircraft().
monitors_validated().
fc_transition_training_produced().
fc_flt_planning_training_validated().
overlap_frequency_verified().
six_new_RVSM_flight_levels_produced_by_competent_staff().
safety_proven_for_2001_levels().
fc_rvsm_procedures_produced().
fc_transition_procedures().
number_of_approved_aircraft_acceptable().
fc_rvsm_training_validated_in_NAT().
srs_are_fully_traceable_to_concept().
aircraft_equipment_design_complies_with_SRs().
fc_contigency_training_validated_in_NAT().
fc_rvsm_training().
original_crm_validated_by_nat().
system_monitoring_complies_with_SRs().
safety_constraints_satisfied().


rules

safety_reqts_fully_realised :- airspace_design_complies_with_SRs, fc_procedure_design_complies_with_SRs, fc_training_design_complies_with_SRs, aircraft_equipment_design_complies_with_SRs, atc_procedure_design_complies_with_SRs, atc_training_design_complies_with_SRs, atc_equipment_design_complies_with_SRs, system_monitoring_complies_with_SRs, safety_constraints_satisfied, srs_are_fully_traceable_to_concept, residual_risks_controlled, concept_meets_RVSM_safety_requirements.
srs_are_fully_traceable_to_concept.
residual_risks_controlled :- controlled(wake_vortices), controlled(mountain_waves), controlled(operational_errors), controlled(asac_usage_risks), controlled(level_busts).
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
risks_controlled :- controlled(risk(ht_1_10)), controlled(risk(ht_1_8)), controlled(risk(ht_2_2)), controlled(risk(ht_1_11)), controlled(risk(ht_3_6)).
controlled(R) :- mitigated(H), R = risk(H), #risk527(R), #hazard527(H).
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
hazards_mitigated :- mitigated(hm_2_2), mitigated(ht_3_5), mitigated(hm_1_15), mitigated(hm_1_8).
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
hazards_mitigated :- mitigated(hm_1_8), mitigated(hm_1_15), mitigated(hm_2_2), mitigated(ht_3_5), mitigated(hm_1_6), mitigated(ht_1_9).
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
risks_controlled :- controlled(risk(hm_1_14)), controlled(risk(hm_1_3)).
controlled(R) :- mitigated(H), R = r(H), #hazard556(H), #risk556(R).
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
hazards_mitigated :- mitigated(ht_1_1), mitigated(ht_1_2), mitigated(hm_2_4), mitigated(hm_2_9), mitigated(hm_1_15), mitigated(ht_1_8), mitigated(ht_3_6), mitigated(hm_2_5), mitigated(ht_2_2), mitigated(hm_1_10), mitigated(ht_1_5), mitigated(hm_1_13), mitigated(hm_2_17), mitigated(hm_2_7), mitigated(hm_2_1), mitigated(hm_1_9), mitigated(ht_3_5), mitigated(ht_1_9).
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
hazards_mitigated :- mitigated(ht_1_1), mitigated(ht_1_2), mitigated(hm_2_4), mitigated(hm_2_9), mitigated(hm_1_15), mitigated(ht_1_8), mitigated(ht_3_6), mitigated(hm_2_5), mitigated(ht_2_2), mitigated(hm_1_10), mitigated(ht_1_5), mitigated(hm_1_13), mitigated(hm_2_17), mitigated(hm_2_7), mitigated(hm_2_1), mitigated(hm_1_9), mitigated(ht_3_5), mitigated(ht_1_9).
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
modifications_made_to_identify_and_display_apprv_aircraft :- modification_made(fdps_fps), modification_made(back_up_systems), modification_made(ifps), modification_made(rdps), modification_made(oldi).
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
hazards_mitigated :- mitigated(hm_2_13), mitigated(hm_2_27), mitigated(hm_2_6), mitigated(hm_2_10), mitigated(hm_2_5), mitigated(hm_2_8), mitigated(hm_2_17), mitigated(hm_2_7), mitigated(hm_1_2), mitigated(hm_2_11), mitigated(ht_1_9).
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
-fc_rvsm_procedures :- not fc_rvsm_procedures.
-fc_flt_planning_procedures_proved_by_NAT :- not fc_flt_planning_procedures_proved_by_NAT.
-all_atc_training_validated :- not all_atc_training_validated.
-validated(CWA_Var_1) :- not validated(CWA_Var_1), #validated_1_termS(CWA_Var_1).
-crm_staff_competent :- not crm_staff_competent.
-system_monitoring_complies_with_SRs :- not system_monitoring_complies_with_SRs.
-residual_risks_controlled :- not residual_risks_controlled.
-atc_rvsm_procedures_produced :- not atc_rvsm_procedures_produced.
-atc_transition_procedures_produced :- not atc_transition_procedures_produced.
-atc_transition_procedures :- not atc_transition_procedures.
-operational_risk_requirements_covered :- not operational_risk_requirements_covered.
-all_atc_trainings :- not all_atc_trainings.
-fc_flt_contigency_procedures_produced :- not fc_flt_contigency_procedures_produced.
-fc_flt_planning_procedures_validated :- not fc_flt_planning_procedures_validated.
-fc_contigency_training :- not fc_contigency_training.
-height_keeping_requirements_covered :- not height_keeping_requirements_covered.
-safety_reqts_fully_realised :- not safety_reqts_fully_realised.
-safety_proven_for_2001_levels :- not safety_proven_for_2001_levels.
-fc_procedure_design_complies_with_SRs :- not fc_procedure_design_complies_with_SRs.
-six_new_RVSM_flight_levels :- not six_new_RVSM_flight_levels.
-operation_error_rate_verified :- not operation_error_rate_verified.
-thke_measured_by_monitors :- not thke_measured_by_monitors.
-fc_transition_training_produced :- not fc_transition_training_produced.
-aircraft_equipment_design_complies_with_SRs :- not aircraft_equipment_design_complies_with_SRs.
-concept_meets_RVSM_safety_requirements :- not concept_meets_RVSM_safety_requirements.
-transition_areas :- not transition_areas.
-atc_contingency_procedures_produced :- not atc_contingency_procedures_produced.
-atc_clearance_procedures :- not atc_clearance_procedures.
-six_new_RVSM_flight_levels_produced_by_competent_staff :- not six_new_RVSM_flight_levels_produced_by_competent_staff.
-transition_areas_validated_by_competent_staff :- not transition_areas_validated_by_competent_staff.
-mitigated(CWA_Var_1) :- not mitigated(CWA_Var_1), #mitigated_1_termS(CWA_Var_1).
-rvsm_adapted_crm_validated :- not rvsm_adapted_crm_validated.
-fc_flt_planning_procedures :- not fc_flt_planning_procedures.
-fc_transition_procedures :- not fc_transition_procedures.
-atc_clearance_procedures_produced :- not atc_clearance_procedures_produced.
-atc_equipment_design_complies_with_SRs :- not atc_equipment_design_complies_with_SRs.
-fc_contigency_training_validated :- not fc_contigency_training_validated.
-fc_transition_training_validated :- not fc_transition_training_validated.
-risks_controlled :- not risks_controlled.
-number_of_non_approved_aircraft_acceptable :- not number_of_non_approved_aircraft_acceptable.
-fc_transition_training :- not fc_transition_training.
-total_vertical_risk_covered :- not total_vertical_risk_covered.
-modification_made(CWA_Var_1) :- not modification_made(CWA_Var_1), #modification_made_1_termS(CWA_Var_1).
-fc_flt_planning_training_validated :- not fc_flt_planning_training_validated.
-atc_procedure_design_complies_with_SRs :- not atc_procedure_design_complies_with_SRs.
-crm_assumptions_are_valid :- not crm_assumptions_are_valid.
-monitors_validated :- not monitors_validated.
-overlap_frequency_verified :- not overlap_frequency_verified.
-fc_rvsm_training :- not fc_rvsm_training.
-thke_complient_with_masps :- not thke_complient_with_masps.
-all_atc_training_produced_by_competent_staff :- not all_atc_training_produced_by_competent_staff.
-fc_rvsm_procedures_proved_by_NAT :- not fc_rvsm_procedures_proved_by_NAT.
-hazards_mitigated :- not hazards_mitigated.
-fc_flt_planning_training :- not fc_flt_planning_training.
-contingency_facilities_validated_by_competent_staff :- not contingency_facilities_validated_by_competent_staff.
-fc_contigency_training_validated_in_NAT :- not fc_contigency_training_validated_in_NAT.
-atc_transition_procedures_validated :- not atc_transition_procedures_validated.
-atc_clearance_procedures_validated :- not atc_clearance_procedures_validated.
-modification_specified(CWA_Var_1) :- not modification_specified(CWA_Var_1), #modification_specified_1_termS(CWA_Var_1).
-atc_rvsm_procedures :- not atc_rvsm_procedures.
-fc_rvsm_procedures_validated :- not fc_rvsm_procedures_validated.
-atc_rvsm_procedures_validated :- not atc_rvsm_procedures_validated.
-states_will_be_required_to_institute_fc :- not states_will_be_required_to_institute_fc.
-masps_height_keeping_accuracy_met :- not masps_height_keeping_accuracy_met.
-fc_transition_training_validated_in_NAT :- not fc_transition_training_validated_in_NAT.
-fc_procedures :- not fc_procedures.
-fc_rvsm_training_validated :- not fc_rvsm_training_validated.
-safety_constraints_satisfied :- not safety_constraints_satisfied.
-fc_transition_procedures_produced :- not fc_transition_procedures_produced.
-contingency_facilities :- not contingency_facilities.
-fc_flt_contigency_procedures :- not fc_flt_contigency_procedures.
-fc_contigency_training_produced :- not fc_contigency_training_produced.
-required_height_keeping_accuracy_met :- not required_height_keeping_accuracy_met.
-number_of_approved_aircraft_acceptable :- not number_of_approved_aircraft_acceptable.
-controlled(CWA_Var_1) :- not controlled(CWA_Var_1), #controlled_1_termS(CWA_Var_1).
-fc_rvsm_procedures_produced :- not fc_rvsm_procedures_produced.
-fc_rvsm_training_validated_in_NAT :- not fc_rvsm_training_validated_in_NAT.
-original_crm_validated_by_nat :- not original_crm_validated_by_nat.
-atc_training_design_complies_with_SRs :- not atc_training_design_complies_with_SRs.
-atc_contingency_procedures_validated :- not atc_contingency_procedures_validated.
-fc_transition_procedures_verified :- not fc_transition_procedures_verified.
-crm_scenarios_valid :- not crm_scenarios_valid.
-assumptions_about_alert_rate_validated :- not assumptions_about_alert_rate_validated.
-fc_flt_contigency_procedures_validated :- not fc_flt_contigency_procedures_validated.
-crm_shows_tls_met :- not crm_shows_tls_met.
-transition_areas_produced_by_competent_staff :- not transition_areas_produced_by_competent_staff.
-fc_training_design_complies_with_SRs :- not fc_training_design_complies_with_SRs.
-fc_rvsm_training_produced :- not fc_rvsm_training_produced.
-complies_with_recommended_practice(CWA_Var_1) :- not complies_with_recommended_practice(CWA_Var_1), #complies_with_recommended_practice_1_termS(CWA_Var_1).
-srs_are_fully_traceable_to_concept :- not srs_are_fully_traceable_to_concept.
-fc_are_aware_of_EUR_RVSM :- not fc_are_aware_of_EUR_RVSM.
-contingency_facilities_produced_by_competent_staff :- not contingency_facilities_produced_by_competent_staff.
-tls_met :- not tls_met.
-fps_oldi_messaged_display_rfl :- not fps_oldi_messaged_display_rfl.
-safety_justified_for_2000plus_levels :- not safety_justified_for_2000plus_levels.
-tolerable(CWA_Var_1) :- not tolerable(CWA_Var_1), #tolerable_1_termS(CWA_Var_1).
-fc_flt_planning_training_produced :- not fc_flt_planning_training_produced.
-six_new_RVSM_flight_levels_validated_by_competent_staff :- not six_new_RVSM_flight_levels_validated_by_competent_staff.
-atc_contingency_procedures :- not atc_contingency_procedures.
-crm_valid :- not crm_valid.
-fc_flt_planning_training_validated_in_NAT :- not fc_flt_planning_training_validated_in_NAT.
-airspace_design_complies_with_SRs :- not airspace_design_complies_with_SRs.
-non_approved_aircraft_excluded :- not non_approved_aircraft_excluded.
-modifications_made_to_identify_and_display_apprv_aircraft :- not modifications_made_to_identify_and_display_apprv_aircraft.

display

crm_valid. fc_transition_procedures_verified. atc_training_design_complies_with_SRs. safety_justified_for_2000plus_levels. fc_transition_procedures_produced. crm_scenarios_valid. fc_are_aware_of_EUR_RVSM. operational_risk_requirements_covered. fc_rvsm_procedures_validated. transition_areas. tolerable. fc_flt_planning_training_validated_in_NAT. assumptions_about_alert_rate_validated. fc_flt_planning_training_produced. contingency_facilities. concept_meets_RVSM_safety_requirements. risks_controlled. all_atc_trainings. residual_risks_controlled. fc_procedure_design_complies_with_SRs. transition_areas_validated_by_competent_staff. six_new_RVSM_flight_levels. fc_flt_planning_procedures. fc_transition_training_validated. atc_transition_procedures_produced. fc_contigency_training_validated. fc_flt_contigency_procedures_produced. fc_flt_contigency_procedures_validated. contingency_facilities_produced_by_competent_staff. atc_transition_procedures. fc_rvsm_procedures_proved_by_NAT. thke_complient_with_masps. atc_rvsm_procedures_validated. operation_error_rate_verified. number_of_non_approved_aircraft_acceptable. fc_transition_training. transition_areas_produced_by_competent_staff. atc_clearance_procedures. fc_flt_contigency_procedures. crm_shows_tls_met. tls_met. atc_equipment_design_complies_with_SRs. fc_training_design_complies_with_SRs. states_will_be_required_to_institute_fc. six_new_RVSM_flight_levels_validated_by_competent_staff. all_atc_training_produced_by_competent_staff. atc_procedure_design_complies_with_SRs. masps_height_keeping_accuracy_met. atc_transition_procedures_validated. fc_contigency_training_produced. airspace_design_complies_with_SRs. hazards_mitigated. rvsm_adapted_crm_validated. total_vertical_risk_covered. fps_oldi_messaged_display_rfl. all_atc_training_validated. fc_flt_planning_procedures_validated. atc_contingency_procedures_produced. mitigated. atc_clearance_procedures_validated. fc_rvsm_procedures. fc_flt_planning_procedures_proved_by_NAT. non_approved_aircraft_excluded. fc_rvsm_training_produced. atc_rvsm_procedures_produced. fc_flt_planning_training. atc_clearance_procedures_produced. required_height_keeping_accuracy_met. modification_made. safety_reqts_fully_realised. thke_measured_by_monitors. validated. complies_with_recommended_practice. height_keeping_requirements_covered. crm_staff_competent. atc_contingency_procedures_validated. atc_contingency_procedures. fc_contigency_training. fc_transition_training_validated_in_NAT. contingency_facilities_validated_by_competent_staff. atc_rvsm_procedures. controlled. crm_assumptions_are_valid. modification_specified. fc_procedures. fc_rvsm_training_validated. modifications_made_to_identify_and_display_apprv_aircraft. monitors_validated. fc_transition_training_produced. fc_flt_planning_training_validated. overlap_frequency_verified. six_new_RVSM_flight_levels_produced_by_competent_staff. safety_proven_for_2001_levels. fc_rvsm_procedures_produced. fc_transition_procedures. number_of_approved_aircraft_acceptable. fc_rvsm_training_validated_in_NAT. srs_are_fully_traceable_to_concept. aircraft_equipment_design_complies_with_SRs. fc_contigency_training_validated_in_NAT. fc_rvsm_training. original_crm_validated_by_nat. system_monitoring_complies_with_SRs. safety_constraints_satisfied. 
