
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
#type_termS = #residual_risk + #hazard527 + #risk527 + #hazard537 + #hazard546 + #hazard556 + #risk556 + #hazard565 + #hazard575 + #mod_to_identify_and_display_apprv_aircraft + #modification + #hazard5810 + #hazard5910.
#rule_termS = {level_busts, hm_1_15, ht_1_1, risk(ht_1_10), r(hm_1_3), hm_1_13, r(hm_1_14), hm_2_10, hm_2_1, ht_1_2, ht_3_5, hm_1_2, hm_1_6, ht_1_8, hm_2_7, ht_1_9, hm_1_3, hm_2_27, hm_2_2, risk(hm_1_14), hm_1_10, risk(ht_2_2), hm_2_13, hm_1_8, oldi, hm_2_17, ht_1_10, risk(hm_1_3), ifps, ht_2_2, hm_1_9, operational_errors, ht_3_6, hm_2_5, hm_2_6, risk(ht_1_8), wake_vortices, mountain_waves, fdps_fps, back_up_systems, ht_1_5, rdps, hm_2_9, hm_2_11, ht_1_11, hm_1_14, risk(ht_1_11), hm_2_4, asac_usage_risks, hm_1_1, alert_on_adj_aircraft, hm_2_8, risk(ht_3_6)}.
#prog_termS = #type_termS + #rule_termS.

predicates

controlled(#prog_termS). fc_rvsm_training(). total_vertical_risk_covered(). atc_equipment_design_complies_with_SRs(). atc_rvsm_procedures_produced(). transition_areas(). contingency_facilities_produced_by_competent_staff(). fc_rvsm_procedures_produced(). contingency_facilities(). masps_height_keeping_accuracy_met(). six_new_RVSM_flight_levels_validated_by_competent_staff(). srs_are_fully_traceable_to_concept(). fc_procedure_design_complies_with_SRs(). fc_flt_planning_procedures(). states_will_be_required_to_institute_fc(). safety_reqts_fully_realised(). fc_flt_planning_procedures_validated(). fc_flt_planning_procedures_proved_by_NAT(). original_crm_validated_by_nat(). fc_transition_procedures_produced(). number_of_approved_aircraft_acceptable(). six_new_RVSM_flight_levels(). fps_oldi_messaged_display_rfl(). fc_rvsm_procedures_proved_by_NAT(). atc_clearance_procedures_produced(). overlap_frequency_verified(). fc_transition_procedures_verified(). tls_met(). fc_contigency_training(). fc_transition_training_validated(). transition_areas_produced_by_competent_staff(). fc_are_aware_of_EUR_RVSM(). fc_contigency_training_validated(). required_height_keeping_accuracy_met(). atc_rvsm_procedures_validated(). atc_training_design_complies_with_SRs(). fc_transition_training(). crm_shows_tls_met(). atc_contingency_procedures_validated(). fc_flt_planning_training_validated(). atc_transition_procedures(). monitors_validated(). crm_valid(). thke_complient_with_masps(). contingency_facilities_validated_by_competent_staff(). atc_clearance_procedures(). fc_rvsm_training_validated_in_NAT(). airspace_design_complies_with_SRs(). fc_flt_planning_training_validated_in_NAT(). atc_clearance_procedures_validated(). thke_measured_by_monitors(). rvsm_adapted_crm_validated(). validated(#prog_termS). complies_with_recommended_practice(#prog_termS). non_approved_aircraft_excluded(). all_atc_trainings(). transition_areas_validated_by_competent_staff(). aircraft_equipment_design_complies_with_SRs(). fc_flt_planning_training(). atc_transition_procedures_validated(). assumptions_about_alert_rate_validated(). crm_assumptions_are_valid(). operation_error_rate_verified(). hazards_mitigated(). atc_contingency_procedures(). mitigated(#prog_termS). crm_staff_competent(). modifications_made_to_identify_and_display_apprv_aircraft(). fc_flt_contigency_procedures_validated(). fc_procedures(). safety_justified_for_2000plus_levels(). atc_contingency_procedures_produced(). fc_rvsm_procedures_validated(). all_atc_training_validated(). fc_training_design_complies_with_SRs(). fc_rvsm_training_produced(). modification_made(#prog_termS). fc_flt_contigency_procedures_produced(). residual_risks_controlled(). concept_meets_RVSM_safety_requirements(). safety_constraints_satisfied(). fc_flt_planning_training_produced(). system_monitoring_complies_with_SRs(). modification_specified(#prog_termS). risks_controlled(). tolerable(#prog_termS). fc_contigency_training_validated_in_NAT(). fc_flt_contigency_procedures(). number_of_non_approved_aircraft_acceptable(). fc_transition_training_produced(). atc_procedure_design_complies_with_SRs(). safety_proven_for_2001_levels(). operational_risk_requirements_covered(). all_atc_training_produced_by_competent_staff(). six_new_RVSM_flight_levels_produced_by_competent_staff(). fc_transition_training_validated_in_NAT(). fc_rvsm_procedures(). atc_rvsm_procedures(). atc_transition_procedures_produced(). torerable(#prog_termS). height_keeping_requirements_covered(). fc_rvsm_training_validated(). fc_transition_procedures(). crm_scenarios_valid(). fc_contigency_training_produced(). 

rules

safety_reqts_fully_realised :- airspace_design_complies_with_SRs, fc_procedure_design_complies_with_SRs, fc_training_design_complies_with_SRs, aircraft_equipment_design_complies_with_SRs, atc_procedure_design_complies_with_SRs, atc_training_design_complies_with_SRs, atc_equipment_design_complies_with_SRs, system_monitoring_complies_with_SRs, safety_constraints_satisfied, srs_are_fully_traceable_to_concept, residual_risks_controlled, concept_meets_RVSM_safety_requirements.
srs_are_fully_traceable_to_concept.
residual_risks_controlled :- controlled(operational_errors), controlled(level_busts), controlled(asac_usage_risks), controlled(wake_vortices), controlled(mountain_waves).
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
risks_controlled :- controlled(risk(ht_1_10)), controlled(risk(ht_2_2)), controlled(risk(ht_3_6)), controlled(risk(ht_1_8)), controlled(risk(ht_1_11)).
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
hazards_mitigated :- mitigated(ht_1_9), mitigated(hm_2_2), mitigated(hm_1_15), mitigated(hm_1_6), mitigated(hm_1_8), mitigated(ht_3_5).
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
controlled(R) :- mitigated(H), R = r(H), #hazard556(H), #risk556(R).
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
hazards_mitigated :- mitigated(ht_1_9), mitigated(hm_1_13), mitigated(hm_1_10), mitigated(hm_2_7), mitigated(hm_2_17), mitigated(hm_1_9), mitigated(ht_1_2), mitigated(ht_1_8), mitigated(hm_2_9), mitigated(ht_2_2), mitigated(hm_1_15), mitigated(ht_1_1), mitigated(hm_2_4), mitigated(hm_2_5), mitigated(hm_2_1), mitigated(ht_1_5), mitigated(ht_3_5), mitigated(ht_3_6).
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
hazards_mitigated :- mitigated(ht_1_9), mitigated(hm_1_13), mitigated(hm_1_10), mitigated(hm_2_7), mitigated(hm_2_17), mitigated(hm_1_9), mitigated(ht_1_2), mitigated(ht_1_8), mitigated(hm_2_9), mitigated(ht_2_2), mitigated(hm_1_15), mitigated(ht_1_1), mitigated(hm_2_4), mitigated(hm_2_5), mitigated(hm_2_1), mitigated(ht_1_5), mitigated(ht_3_5), mitigated(ht_3_6).
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
modifications_made_to_identify_and_display_apprv_aircraft :- modification_made(oldi), modification_made(back_up_systems), modification_made(ifps), modification_made(rdps), modification_made(fdps_fps).
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
hazards_mitigated :- mitigated(ht_1_9), mitigated(hm_2_10), mitigated(hm_2_7), mitigated(hm_2_17), mitigated(hm_2_6), mitigated(hm_2_13), mitigated(hm_2_11), mitigated(hm_2_8), mitigated(hm_2_5), mitigated(hm_1_2), mitigated(hm_2_27).
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
-fc_flt_contigency_procedures :- not fc_flt_contigency_procedures.
-atc_contingency_procedures_validated :- not atc_contingency_procedures_validated.
-required_height_keeping_accuracy_met :- not required_height_keeping_accuracy_met.
-six_new_RVSM_flight_levels_validated_by_competent_staff :- not six_new_RVSM_flight_levels_validated_by_competent_staff.
-tls_met :- not tls_met.
-transition_areas_produced_by_competent_staff :- not transition_areas_produced_by_competent_staff.
-crm_assumptions_are_valid :- not crm_assumptions_are_valid.
-fc_flt_contigency_procedures_validated :- not fc_flt_contigency_procedures_validated.
-atc_procedure_design_complies_with_SRs :- not atc_procedure_design_complies_with_SRs.
-safety_proven_for_2001_levels :- not safety_proven_for_2001_levels.
-complies_with_recommended_practice(CWA0) :- not complies_with_recommended_practice(CWA0), #prog_termS(CWA0).
-fc_flt_contigency_procedures_produced :- not fc_flt_contigency_procedures_produced.
-atc_rvsm_procedures_validated :- not atc_rvsm_procedures_validated.
-airspace_design_complies_with_SRs :- not airspace_design_complies_with_SRs.
-hazards_mitigated :- not hazards_mitigated.
-fc_procedures :- not fc_procedures.
-fc_flt_planning_training_produced :- not fc_flt_planning_training_produced.
-tolerable(CWA0) :- not tolerable(CWA0), #prog_termS(CWA0).
-atc_transition_procedures_produced :- not atc_transition_procedures_produced.
-fc_flt_planning_procedures :- not fc_flt_planning_procedures.
-contingency_facilities_validated_by_competent_staff :- not contingency_facilities_validated_by_competent_staff.
-residual_risks_controlled :- not residual_risks_controlled.
-atc_rvsm_procedures_produced :- not atc_rvsm_procedures_produced.
-fc_procedure_design_complies_with_SRs :- not fc_procedure_design_complies_with_SRs.
-fc_transition_training_validated :- not fc_transition_training_validated.
-thke_complient_with_masps :- not thke_complient_with_masps.
-thke_measured_by_monitors :- not thke_measured_by_monitors.
-all_atc_trainings :- not all_atc_trainings.
-assumptions_about_alert_rate_validated :- not assumptions_about_alert_rate_validated.
-atc_contingency_procedures_produced :- not atc_contingency_procedures_produced.
-all_atc_training_validated :- not all_atc_training_validated.
-risks_controlled :- not risks_controlled.
-atc_clearance_procedures_validated :- not atc_clearance_procedures_validated.
-atc_rvsm_procedures :- not atc_rvsm_procedures.
-controlled(CWA0) :- not controlled(CWA0), #prog_termS(CWA0).
-safety_constraints_satisfied :- not safety_constraints_satisfied.
-fc_flt_planning_training_validated :- not fc_flt_planning_training_validated.
-atc_clearance_procedures :- not atc_clearance_procedures.
-modification_specified(CWA0) :- not modification_specified(CWA0), #prog_termS(CWA0).
-torerable(CWA0) :- not torerable(CWA0), #prog_termS(CWA0).
-fc_transition_procedures :- not fc_transition_procedures.
-fc_are_aware_of_EUR_RVSM :- not fc_are_aware_of_EUR_RVSM.
-mitigated(CWA0) :- not mitigated(CWA0), #prog_termS(CWA0).
-all_atc_training_produced_by_competent_staff :- not all_atc_training_produced_by_competent_staff.
-height_keeping_requirements_covered :- not height_keeping_requirements_covered.
-contingency_facilities_produced_by_competent_staff :- not contingency_facilities_produced_by_competent_staff.
-fc_transition_training :- not fc_transition_training.
-fc_training_design_complies_with_SRs :- not fc_training_design_complies_with_SRs.
-operational_risk_requirements_covered :- not operational_risk_requirements_covered.
-crm_scenarios_valid :- not crm_scenarios_valid.
-masps_height_keeping_accuracy_met :- not masps_height_keeping_accuracy_met.
-safety_reqts_fully_realised :- not safety_reqts_fully_realised.
-atc_training_design_complies_with_SRs :- not atc_training_design_complies_with_SRs.
-atc_transition_procedures_validated :- not atc_transition_procedures_validated.
-atc_contingency_procedures :- not atc_contingency_procedures.
-fc_transition_training_validated_in_NAT :- not fc_transition_training_validated_in_NAT.
-fc_rvsm_procedures :- not fc_rvsm_procedures.
-fc_rvsm_training_validated :- not fc_rvsm_training_validated.
-overlap_frequency_verified :- not overlap_frequency_verified.
-fc_flt_planning_procedures_proved_by_NAT :- not fc_flt_planning_procedures_proved_by_NAT.
-fc_flt_planning_procedures_validated :- not fc_flt_planning_procedures_validated.
-original_crm_validated_by_nat :- not original_crm_validated_by_nat.
-number_of_approved_aircraft_acceptable :- not number_of_approved_aircraft_acceptable.
-modifications_made_to_identify_and_display_apprv_aircraft :- not modifications_made_to_identify_and_display_apprv_aircraft.
-concept_meets_RVSM_safety_requirements :- not concept_meets_RVSM_safety_requirements.
-fc_contigency_training_validated_in_NAT :- not fc_contigency_training_validated_in_NAT.
-contingency_facilities :- not contingency_facilities.
-fc_rvsm_procedures_proved_by_NAT :- not fc_rvsm_procedures_proved_by_NAT.
-atc_transition_procedures :- not atc_transition_procedures.
-fc_rvsm_training_validated_in_NAT :- not fc_rvsm_training_validated_in_NAT.
-operation_error_rate_verified :- not operation_error_rate_verified.
-states_will_be_required_to_institute_fc :- not states_will_be_required_to_institute_fc.
-fc_transition_procedures_produced :- not fc_transition_procedures_produced.
-aircraft_equipment_design_complies_with_SRs :- not aircraft_equipment_design_complies_with_SRs.
-number_of_non_approved_aircraft_acceptable :- not number_of_non_approved_aircraft_acceptable.
-non_approved_aircraft_excluded :- not non_approved_aircraft_excluded.
-fc_flt_planning_training :- not fc_flt_planning_training.
-srs_are_fully_traceable_to_concept :- not srs_are_fully_traceable_to_concept.
-atc_equipment_design_complies_with_SRs :- not atc_equipment_design_complies_with_SRs.
-transition_areas :- not transition_areas.
-six_new_RVSM_flight_levels :- not six_new_RVSM_flight_levels.
-atc_clearance_procedures_produced :- not atc_clearance_procedures_produced.
-fc_transition_procedures_verified :- not fc_transition_procedures_verified.
-monitors_validated :- not monitors_validated.
-fc_rvsm_training :- not fc_rvsm_training.
-crm_valid :- not crm_valid.
-rvsm_adapted_crm_validated :- not rvsm_adapted_crm_validated.
-total_vertical_risk_covered :- not total_vertical_risk_covered.
-transition_areas_validated_by_competent_staff :- not transition_areas_validated_by_competent_staff.
-fc_rvsm_procedures_validated :- not fc_rvsm_procedures_validated.
-fc_contigency_training :- not fc_contigency_training.
-fc_rvsm_procedures_produced :- not fc_rvsm_procedures_produced.
-fps_oldi_messaged_display_rfl :- not fps_oldi_messaged_display_rfl.
-crm_shows_tls_met :- not crm_shows_tls_met.
-crm_staff_competent :- not crm_staff_competent.
-system_monitoring_complies_with_SRs :- not system_monitoring_complies_with_SRs.
-fc_contigency_training_produced :- not fc_contigency_training_produced.
-modification_made(CWA0) :- not modification_made(CWA0), #prog_termS(CWA0).
-fc_contigency_training_validated :- not fc_contigency_training_validated.
-fc_flt_planning_training_validated_in_NAT :- not fc_flt_planning_training_validated_in_NAT.
-safety_justified_for_2000plus_levels :- not safety_justified_for_2000plus_levels.
-fc_rvsm_training_produced :- not fc_rvsm_training_produced.
-fc_transition_training_produced :- not fc_transition_training_produced.
-six_new_RVSM_flight_levels_produced_by_competent_staff :- not six_new_RVSM_flight_levels_produced_by_competent_staff.
-validated(CWA0) :- not validated(CWA0), #prog_termS(CWA0).

display

controlled. fc_rvsm_training. total_vertical_risk_covered. atc_equipment_design_complies_with_SRs. atc_rvsm_procedures_produced. transition_areas. contingency_facilities_produced_by_competent_staff. fc_rvsm_procedures_produced. contingency_facilities. masps_height_keeping_accuracy_met. six_new_RVSM_flight_levels_validated_by_competent_staff. srs_are_fully_traceable_to_concept. fc_procedure_design_complies_with_SRs. fc_flt_planning_procedures. states_will_be_required_to_institute_fc. safety_reqts_fully_realised. fc_flt_planning_procedures_validated. fc_flt_planning_procedures_proved_by_NAT. original_crm_validated_by_nat. fc_transition_procedures_produced. number_of_approved_aircraft_acceptable. six_new_RVSM_flight_levels. fps_oldi_messaged_display_rfl. fc_rvsm_procedures_proved_by_NAT. atc_clearance_procedures_produced. overlap_frequency_verified. fc_transition_procedures_verified. tls_met. fc_contigency_training. fc_transition_training_validated. transition_areas_produced_by_competent_staff. fc_are_aware_of_EUR_RVSM. fc_contigency_training_validated. required_height_keeping_accuracy_met. atc_rvsm_procedures_validated. atc_training_design_complies_with_SRs. fc_transition_training. crm_shows_tls_met. atc_contingency_procedures_validated. fc_flt_planning_training_validated. atc_transition_procedures. monitors_validated. crm_valid. thke_complient_with_masps. contingency_facilities_validated_by_competent_staff. atc_clearance_procedures. fc_rvsm_training_validated_in_NAT. airspace_design_complies_with_SRs. fc_flt_planning_training_validated_in_NAT. atc_clearance_procedures_validated. thke_measured_by_monitors. rvsm_adapted_crm_validated. validated. complies_with_recommended_practice. non_approved_aircraft_excluded. all_atc_trainings. transition_areas_validated_by_competent_staff. aircraft_equipment_design_complies_with_SRs. fc_flt_planning_training. atc_transition_procedures_validated. assumptions_about_alert_rate_validated. crm_assumptions_are_valid. operation_error_rate_verified. hazards_mitigated. atc_contingency_procedures. mitigated. crm_staff_competent. modifications_made_to_identify_and_display_apprv_aircraft. fc_flt_contigency_procedures_validated. fc_procedures. safety_justified_for_2000plus_levels. atc_contingency_procedures_produced. fc_rvsm_procedures_validated. all_atc_training_validated. fc_training_design_complies_with_SRs. fc_rvsm_training_produced. modification_made. fc_flt_contigency_procedures_produced. residual_risks_controlled. concept_meets_RVSM_safety_requirements. safety_constraints_satisfied. fc_flt_planning_training_produced. system_monitoring_complies_with_SRs. modification_specified. risks_controlled. tolerable. fc_contigency_training_validated_in_NAT. fc_flt_contigency_procedures. number_of_non_approved_aircraft_acceptable. fc_transition_training_produced. atc_procedure_design_complies_with_SRs. safety_proven_for_2001_levels. operational_risk_requirements_covered. all_atc_training_produced_by_competent_staff. six_new_RVSM_flight_levels_produced_by_competent_staff. fc_transition_training_validated_in_NAT. fc_rvsm_procedures. atc_rvsm_procedures. atc_transition_procedures_produced. torerable. height_keeping_requirements_covered. fc_rvsm_training_validated. fc_transition_procedures. crm_scenarios_valid. fc_contigency_training_produced. 
