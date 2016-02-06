
sorts

#residual_risk = {level_busts, asac_usage_risks, wake_vortices, mountain_waves, operational_errors}.
#hazard527 = {ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}.
#risk527 = {risk(ht_1_8), risk(ht_1_10), risk(ht_2_2), risk(ht_1_11), risk(ht_3_6)}.
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
#type_termS = #residual_risk + #hazard527 + #risk527 + #hazard537 + #hazard546 + #hazard556 + #risk556 + #hazard565 + #hazard575 + #mod_to_identify_and_display_apprv_aircraft + #modification + #hazard5810 + #hazard5910.
#rule_termS = {alert_on_adj_aircraft, back_up_systems, operational_errors, hm_2_7, ht_1_5, rdps, ht_1_8, oldi, hm_2_8, hm_2_5, wake_vortices, risk(ht_1_11), ht_1_10, ht_3_5, ht_1_9, hm_1_6, hm_1_9, hm_2_10, risk(hm_1_3), r(hm_1_3), mountain_waves, hm_2_13, hm_2_1, risk(ht_1_10), ifps, hm_1_15, hm_1_2, hm_2_11, ht_3_6, risk(ht_2_2), ht_2_2, hm_1_10, hm_1_13, risk(ht_1_8), hm_1_3, risk(ht_3_6), hm_2_4, hm_2_17, hm_2_9, ht_1_11, hm_2_2, hm_2_6, hm_1_8, hm_1_1, fdps_fps, risk(hm_1_14), hm_1_14, r(hm_1_14), ht_1_2, ht_1_1, level_busts, asac_usage_risks, hm_2_27}.
#prog_termS = #type_termS + #rule_termS.

predicates

fc_transition_training_produced(). atc_equipment_design_complies_with_SRs(). atc_contingency_procedures_validated(). fc_rvsm_procedures_produced(). six_new_RVSM_flight_levels_produced_by_competent_staff(). fc_transition_procedures_produced(). six_new_RVSM_flight_levels_validated_by_competent_staff(). fc_rvsm_procedures(). fc_rvsm_training_validated_in_NAT(). atc_transition_procedures_produced(). fc_flt_planning_training_validated_in_NAT(). modification_made(#prog_termS). fc_flt_planning_procedures(). crm_scenarios_valid(). mitigated(#prog_termS). height_keeping_requirements_covered(). hazards_mitigated(). fc_flt_contigency_procedures(). contingency_facilities_produced_by_competent_staff(). atc_transition_procedures_validated(). thke_complient_with_masps(). thke_measured_by_monitors(). fc_transition_training(). fc_are_aware_of_EUR_RVSM(). masps_height_keeping_accuracy_met(). fc_flt_contigency_procedures_validated(). number_of_non_approved_aircraft_acceptable(). atc_transition_procedures(). fc_flt_planning_procedures_validated(). atc_contingency_procedures(). modification_specified(#prog_termS). safety_reqts_fully_realised(). monitors_validated(). risks_controlled(). all_atc_training_produced_by_competent_staff(). non_approved_aircraft_excluded(). fc_flt_planning_training_validated(). fc_rvsm_training_produced(). transition_areas(). safety_proven_for_2001_levels(). operation_error_rate_verified(). fc_rvsm_procedures_validated(). number_of_approved_aircraft_acceptable(). atc_contingency_procedures_produced(). overlap_frequency_verified(). fc_transition_training_validated_in_NAT(). fc_flt_planning_training_produced(). crm_valid(). fc_flt_contigency_procedures_produced(). fc_procedure_design_complies_with_SRs(). fc_rvsm_training(). concept_meets_RVSM_safety_requirements(). airspace_design_complies_with_SRs(). fc_contigency_training(). atc_rvsm_procedures(). safety_justified_for_2000plus_levels(). transition_areas_produced_by_competent_staff(). contingency_facilities(). fc_transition_procedures_verified(). fc_transition_procedures(). atc_training_design_complies_with_SRs(). atc_procedure_design_complies_with_SRs(). crm_staff_competent(). atc_rvsm_procedures_validated(). controlled(#prog_termS). aircraft_equipment_design_complies_with_SRs(). transition_areas_validated_by_competent_staff(). torerable(#prog_termS). fc_flt_planning_training(). atc_rvsm_procedures_produced(). fps_oldi_messaged_display_rfl(). fc_contigency_training_validated_in_NAT(). fc_rvsm_procedures_proved_by_NAT(). tls_met(). fc_procedures(). residual_risks_controlled(). crm_assumptions_are_valid(). all_atc_training_validated(). safety_constraints_satisfied(). complies_with_recommended_practice(#prog_termS). required_height_keeping_accuracy_met(). system_monitoring_complies_with_SRs(). original_crm_validated_by_nat(). fc_contigency_training_validated(). six_new_RVSM_flight_levels(). fc_contigency_training_produced(). validated(#prog_termS). all_atc_trainings(). fc_flt_planning_procedures_proved_by_NAT(). fc_transition_training_validated(). total_vertical_risk_covered(). states_will_be_required_to_institute_fc(). fc_training_design_complies_with_SRs(). rvsm_adapted_crm_validated(). operational_risk_requirements_covered(). srs_are_fully_traceable_to_concept(). tolerable(#prog_termS). atc_clearance_procedures_validated(). assumptions_about_alert_rate_validated(). fc_rvsm_training_validated(). crm_shows_tls_met(). atc_clearance_procedures_produced(). modifications_made_to_identify_and_display_apprv_aircraft(). atc_clearance_procedures(). contingency_facilities_validated_by_competent_staff(). 

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
risks_controlled :- controlled(risk(ht_1_8)), controlled(risk(ht_2_2)), controlled(risk(ht_1_11)), controlled(risk(ht_1_10)), controlled(risk(ht_3_6)).
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
hazards_mitigated :- mitigated(hm_2_2), mitigated(hm_1_15), mitigated(hm_1_8), mitigated(ht_3_5), mitigated(ht_1_9), mitigated(hm_1_6).
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
controlled(R) :- mitigated(H), R = r(H), #risk556(R), #hazard556(H).
controlled(R) :- tolerable(R), #risk556(R).
tolerable(r(hm_1_14)).
torerable(r(hm_1_3)).
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
hazards_mitigated :- mitigated(hm_2_7), mitigated(hm_1_15), mitigated(hm_1_13), mitigated(hm_1_10), mitigated(ht_1_5), mitigated(ht_1_9), mitigated(ht_2_2), mitigated(hm_2_9), mitigated(ht_1_8), mitigated(ht_3_5), mitigated(hm_1_9), mitigated(ht_1_2), mitigated(ht_1_1), mitigated(hm_2_17), mitigated(ht_3_6), mitigated(hm_2_4), mitigated(hm_2_1), mitigated(hm_2_5).
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
hazards_mitigated :- mitigated(hm_2_7), mitigated(hm_1_15), mitigated(hm_1_13), mitigated(hm_1_10), mitigated(ht_1_5), mitigated(ht_1_9), mitigated(ht_2_2), mitigated(hm_2_9), mitigated(ht_1_8), mitigated(ht_3_5), mitigated(hm_1_9), mitigated(ht_1_2), mitigated(ht_1_1), mitigated(hm_2_17), mitigated(ht_3_6), mitigated(hm_2_4), mitigated(hm_2_1), mitigated(hm_2_5).
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
modifications_made_to_identify_and_display_apprv_aircraft :- modification_made(oldi), modification_made(back_up_systems), modification_made(ifps), modification_made(fdps_fps), modification_made(rdps).
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
hazards_mitigated :- mitigated(hm_2_11), mitigated(hm_2_7), mitigated(hm_2_8), mitigated(hm_2_10), mitigated(ht_1_9), mitigated(hm_1_2), mitigated(hm_2_17), mitigated(hm_2_27), mitigated(hm_2_6), mitigated(hm_2_5), mitigated(hm_2_13).
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
hazards_mitigated :- mitigated(hm_1_1), mitigated(hm_2_2).
mitigated(hm_2_2) :- non_approved_aircraft_excluded.
mitigated(hm_1_1) :- assumptions_about_alert_rate_validated.
safety_constraints_satisfied :- safety_proven_for_2001_levels, safety_justified_for_2000plus_levels.
safety_proven_for_2001_levels.
safety_justified_for_2000plus_levels.
-modification_specified(CWA0) :- not modification_specified(CWA0), #prog_termS(CWA0).
-contingency_facilities_produced_by_competent_staff :- not contingency_facilities_produced_by_competent_staff.
-atc_clearance_procedures_produced :- not atc_clearance_procedures_produced.
-fc_flt_contigency_procedures :- not fc_flt_contigency_procedures.
-fc_rvsm_procedures_validated :- not fc_rvsm_procedures_validated.
-fc_flt_planning_training :- not fc_flt_planning_training.
-srs_are_fully_traceable_to_concept :- not srs_are_fully_traceable_to_concept.
-atc_transition_procedures_validated :- not atc_transition_procedures_validated.
-number_of_non_approved_aircraft_acceptable :- not number_of_non_approved_aircraft_acceptable.
-atc_equipment_design_complies_with_SRs :- not atc_equipment_design_complies_with_SRs.
-number_of_approved_aircraft_acceptable :- not number_of_approved_aircraft_acceptable.
-fc_contigency_training :- not fc_contigency_training.
-fps_oldi_messaged_display_rfl :- not fps_oldi_messaged_display_rfl.
-original_crm_validated_by_nat :- not original_crm_validated_by_nat.
-aircraft_equipment_design_complies_with_SRs :- not aircraft_equipment_design_complies_with_SRs.
-fc_flt_planning_training_produced :- not fc_flt_planning_training_produced.
-fc_procedure_design_complies_with_SRs :- not fc_procedure_design_complies_with_SRs.
-system_monitoring_complies_with_SRs :- not system_monitoring_complies_with_SRs.
-fc_rvsm_training_validated :- not fc_rvsm_training_validated.
-fc_rvsm_procedures_produced :- not fc_rvsm_procedures_produced.
-fc_transition_procedures_produced :- not fc_transition_procedures_produced.
-fc_contigency_training_validated_in_NAT :- not fc_contigency_training_validated_in_NAT.
-concept_meets_RVSM_safety_requirements :- not concept_meets_RVSM_safety_requirements.
-contingency_facilities :- not contingency_facilities.
-atc_procedure_design_complies_with_SRs :- not atc_procedure_design_complies_with_SRs.
-crm_scenarios_valid :- not crm_scenarios_valid.
-hazards_mitigated :- not hazards_mitigated.
-thke_complient_with_masps :- not thke_complient_with_masps.
-fc_rvsm_training_validated_in_NAT :- not fc_rvsm_training_validated_in_NAT.
-atc_contingency_procedures_produced :- not atc_contingency_procedures_produced.
-validated(CWA0) :- not validated(CWA0), #prog_termS(CWA0).
-tolerable(CWA0) :- not tolerable(CWA0), #prog_termS(CWA0).
-contingency_facilities_validated_by_competent_staff :- not contingency_facilities_validated_by_competent_staff.
-total_vertical_risk_covered :- not total_vertical_risk_covered.
-atc_contingency_procedures_validated :- not atc_contingency_procedures_validated.
-fc_transition_training :- not fc_transition_training.
-atc_rvsm_procedures :- not atc_rvsm_procedures.
-six_new_RVSM_flight_levels_validated_by_competent_staff :- not six_new_RVSM_flight_levels_validated_by_competent_staff.
-fc_flt_planning_procedures_validated :- not fc_flt_planning_procedures_validated.
-six_new_RVSM_flight_levels_produced_by_competent_staff :- not six_new_RVSM_flight_levels_produced_by_competent_staff.
-masps_height_keeping_accuracy_met :- not masps_height_keeping_accuracy_met.
-safety_justified_for_2000plus_levels :- not safety_justified_for_2000plus_levels.
-fc_transition_procedures_verified :- not fc_transition_procedures_verified.
-crm_assumptions_are_valid :- not crm_assumptions_are_valid.
-all_atc_training_validated :- not all_atc_training_validated.
-operational_risk_requirements_covered :- not operational_risk_requirements_covered.
-crm_shows_tls_met :- not crm_shows_tls_met.
-thke_measured_by_monitors :- not thke_measured_by_monitors.
-operation_error_rate_verified :- not operation_error_rate_verified.
-fc_transition_training_validated_in_NAT :- not fc_transition_training_validated_in_NAT.
-tls_met :- not tls_met.
-fc_training_design_complies_with_SRs :- not fc_training_design_complies_with_SRs.
-assumptions_about_alert_rate_validated :- not assumptions_about_alert_rate_validated.
-fc_transition_procedures :- not fc_transition_procedures.
-atc_rvsm_procedures_produced :- not atc_rvsm_procedures_produced.
-atc_transition_procedures_produced :- not atc_transition_procedures_produced.
-monitors_validated :- not monitors_validated.
-crm_valid :- not crm_valid.
-torerable(CWA0) :- not torerable(CWA0), #prog_termS(CWA0).
-fc_flt_contigency_procedures_validated :- not fc_flt_contigency_procedures_validated.
-fc_rvsm_procedures :- not fc_rvsm_procedures.
-fc_flt_planning_procedures :- not fc_flt_planning_procedures.
-all_atc_training_produced_by_competent_staff :- not all_atc_training_produced_by_competent_staff.
-fc_flt_planning_training_validated :- not fc_flt_planning_training_validated.
-transition_areas_produced_by_competent_staff :- not transition_areas_produced_by_competent_staff.
-crm_staff_competent :- not crm_staff_competent.
-controlled(CWA0) :- not controlled(CWA0), #prog_termS(CWA0).
-all_atc_trainings :- not all_atc_trainings.
-atc_clearance_procedures :- not atc_clearance_procedures.
-residual_risks_controlled :- not residual_risks_controlled.
-fc_transition_training_produced :- not fc_transition_training_produced.
-modification_made(CWA0) :- not modification_made(CWA0), #prog_termS(CWA0).
-fc_are_aware_of_EUR_RVSM :- not fc_are_aware_of_EUR_RVSM.
-safety_reqts_fully_realised :- not safety_reqts_fully_realised.
-airspace_design_complies_with_SRs :- not airspace_design_complies_with_SRs.
-transition_areas :- not transition_areas.
-safety_proven_for_2001_levels :- not safety_proven_for_2001_levels.
-height_keeping_requirements_covered :- not height_keeping_requirements_covered.
-overlap_frequency_verified :- not overlap_frequency_verified.
-fc_flt_contigency_procedures_produced :- not fc_flt_contigency_procedures_produced.
-safety_constraints_satisfied :- not safety_constraints_satisfied.
-fc_transition_training_validated :- not fc_transition_training_validated.
-states_will_be_required_to_institute_fc :- not states_will_be_required_to_institute_fc.
-modifications_made_to_identify_and_display_apprv_aircraft :- not modifications_made_to_identify_and_display_apprv_aircraft.
-fc_flt_planning_training_validated_in_NAT :- not fc_flt_planning_training_validated_in_NAT.
-risks_controlled :- not risks_controlled.
-fc_contigency_training_produced :- not fc_contigency_training_produced.
-mitigated(CWA0) :- not mitigated(CWA0), #prog_termS(CWA0).
-atc_training_design_complies_with_SRs :- not atc_training_design_complies_with_SRs.
-atc_transition_procedures :- not atc_transition_procedures.
-fc_rvsm_procedures_proved_by_NAT :- not fc_rvsm_procedures_proved_by_NAT.
-fc_procedures :- not fc_procedures.
-required_height_keeping_accuracy_met :- not required_height_keeping_accuracy_met.
-atc_rvsm_procedures_validated :- not atc_rvsm_procedures_validated.
-transition_areas_validated_by_competent_staff :- not transition_areas_validated_by_competent_staff.
-non_approved_aircraft_excluded :- not non_approved_aircraft_excluded.
-fc_contigency_training_validated :- not fc_contigency_training_validated.
-six_new_RVSM_flight_levels :- not six_new_RVSM_flight_levels.
-rvsm_adapted_crm_validated :- not rvsm_adapted_crm_validated.
-fc_rvsm_training_produced :- not fc_rvsm_training_produced.
-complies_with_recommended_practice(CWA0) :- not complies_with_recommended_practice(CWA0), #prog_termS(CWA0).
-atc_contingency_procedures :- not atc_contingency_procedures.
-fc_flt_planning_procedures_proved_by_NAT :- not fc_flt_planning_procedures_proved_by_NAT.
-atc_clearance_procedures_validated :- not atc_clearance_procedures_validated.
-fc_rvsm_training :- not fc_rvsm_training.

display

fc_transition_training_produced. atc_equipment_design_complies_with_SRs. atc_contingency_procedures_validated. fc_rvsm_procedures_produced. six_new_RVSM_flight_levels_produced_by_competent_staff. fc_transition_procedures_produced. six_new_RVSM_flight_levels_validated_by_competent_staff. fc_rvsm_procedures. fc_rvsm_training_validated_in_NAT. atc_transition_procedures_produced. fc_flt_planning_training_validated_in_NAT. modification_made. fc_flt_planning_procedures. crm_scenarios_valid. mitigated. height_keeping_requirements_covered. hazards_mitigated. fc_flt_contigency_procedures. contingency_facilities_produced_by_competent_staff. atc_transition_procedures_validated. thke_complient_with_masps. thke_measured_by_monitors. fc_transition_training. fc_are_aware_of_EUR_RVSM. masps_height_keeping_accuracy_met. fc_flt_contigency_procedures_validated. number_of_non_approved_aircraft_acceptable. atc_transition_procedures. fc_flt_planning_procedures_validated. atc_contingency_procedures. modification_specified. safety_reqts_fully_realised. monitors_validated. risks_controlled. all_atc_training_produced_by_competent_staff. non_approved_aircraft_excluded. fc_flt_planning_training_validated. fc_rvsm_training_produced. transition_areas. safety_proven_for_2001_levels. operation_error_rate_verified. fc_rvsm_procedures_validated. number_of_approved_aircraft_acceptable. atc_contingency_procedures_produced. overlap_frequency_verified. fc_transition_training_validated_in_NAT. fc_flt_planning_training_produced. crm_valid. fc_flt_contigency_procedures_produced. fc_procedure_design_complies_with_SRs. fc_rvsm_training. concept_meets_RVSM_safety_requirements. airspace_design_complies_with_SRs. fc_contigency_training. atc_rvsm_procedures. safety_justified_for_2000plus_levels. transition_areas_produced_by_competent_staff. contingency_facilities. fc_transition_procedures_verified. fc_transition_procedures. atc_training_design_complies_with_SRs. atc_procedure_design_complies_with_SRs. crm_staff_competent. atc_rvsm_procedures_validated. controlled. aircraft_equipment_design_complies_with_SRs. transition_areas_validated_by_competent_staff. torerable. fc_flt_planning_training. atc_rvsm_procedures_produced. fps_oldi_messaged_display_rfl. fc_contigency_training_validated_in_NAT. fc_rvsm_procedures_proved_by_NAT. tls_met. fc_procedures. residual_risks_controlled. crm_assumptions_are_valid. all_atc_training_validated. safety_constraints_satisfied. complies_with_recommended_practice. required_height_keeping_accuracy_met. system_monitoring_complies_with_SRs. original_crm_validated_by_nat. fc_contigency_training_validated. six_new_RVSM_flight_levels. fc_contigency_training_produced. validated. all_atc_trainings. fc_flt_planning_procedures_proved_by_NAT. fc_transition_training_validated. total_vertical_risk_covered. states_will_be_required_to_institute_fc. fc_training_design_complies_with_SRs. rvsm_adapted_crm_validated. operational_risk_requirements_covered. srs_are_fully_traceable_to_concept. tolerable. atc_clearance_procedures_validated. assumptions_about_alert_rate_validated. fc_rvsm_training_validated. crm_shows_tls_met. atc_clearance_procedures_produced. modifications_made_to_identify_and_display_apprv_aircraft. atc_clearance_procedures. contingency_facilities_validated_by_competent_staff. 
