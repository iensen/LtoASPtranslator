residual_risk = {level_busts, asac_usage_risks, wake_vortices, mountain_waves,
                  operation_errors}.
         
hazard527 = {ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}. 

risk527 = risk(H) where H in hazard527.

hazard537 = {ht_3_5, hm_1_8, hm_2_2, hm_1_15}. 
 
hazard546 = {ht_1_9, ht_3_5, hm_2_2, hm_1_6, hm_1_8, hm_1_15}.


hazard556 = {hm_1_3, hm_1_14}.

risk556 = risk(H) where H in hazard556. /* I guess you intended to change the function r into the function risk but missed some occurrences. I am replacing all leftover occurrences of r with risk. */



hazard565 = {ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5,
          ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15,
          hm_2_17, hm_2_7, hm_2_9}. 

hazard575 = {ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5,
          ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15,
          hm_2_17, hm_2_7, hm_2_9}. 


mod_to_to_display_apprv_aircraft  = {ifps, rdps, fdps_fps, oldi, back_up_systems}. 
modification = mod_to_to_display_apprv_aircraft + {alert_on_adj_aircraft}.


hazard5810 = {hm_2_6, hm_2_5, hm_2_17, hm_1_2, hm_2_7, hm_2_8, hm_2_13, 
          hm_2_10, hm_2_11, ht_1_9, hm_2_27}.


hazard5910 = {hm_2_2, hm_1_1}.

safety_reqts_fully_realised if                              
                     airspace_design_complies_with_SRs and
                     fc_procedure_design_complies_with_SRs and
                     fc_training_design_complies_with_SRs and
                     aircraft_equipment_design_complies_with_SRs and
                     atc_procedure_design_complies_with_SRs and
                     atc_training_design_complies_with_SRs and
                     atc_equipment_design_complies_with_SRs and
                     system_monitoring_complies_with_SRs and
                     safety_constraints_satisfied and
                     srs_are_fully_traceable_to_concept and
                     residual_risks_controlled and
                     concept_meets_RVSM_safety_requirements.

srs_are_fully_traceable_to_concept. 

controlled(residual_risk R) if mitigated(R) or tolerable(R).
mitigated(level_busts). 
mitigated(asac_usage_risks). 
tolerable(wake_vortices).
tolerable(mountain_waves). 
tolerable(operational_errors). 

concept_meets_RVSM_safety_requirements if 
             height_keeping_requirements_covered and
             operational_risk_requirements_covered and
             total_vertical_risk_covered.

height_keeping_requirements_covered. 
operational_risk_requirements_covered. 
total_vertical_risk_covered. 

airspace_design_complies_with_SRs if
                     transition_areas and
                     six_new_RVSM_flight_levels and
                     risks_controlled and
                     contingency_facilities.

transition_areas if
                     transition_areas_produced_by_competent_staff and
                     transition_areas_validated_by_competent_staff.

transition_areas_produced_by_competent_staff. 
transition_areas_validated_by_competent_staff.


six_new_RVSM_flight_levels if 
                     six_new_RVSM_flight_levels_produced_by_competent_staff and
                     six_new_RVSM_flight_levels_validated_by_competent_staff.

six_new_RVSM_flight_levels_produced_by_competent_staff.  
six_new_RVSM_flight_levels_validated_by_competent_staff. 


controlled(risk527 R) if mitigated(hazard527 H) and R = risk(H).

controlled(risk527 R) if tolerable(R).

mitigated(ht_1_8).
mitigated(ht_1_10).
mitigated(ht_2_2).
mitigated(ht_3_6).
tolerable(risk(ht_1_11)).


contingency_facilities if
                     contingency_facilities_produced_by_competent_staff and
                     contingency_facilities_validated_by_competent_staff.
contingency_facilities_produced_by_competent_staff.  
contingency_facilities_validated_by_competent_staff. 


fc_procedure_design_complies_with_SRs if
                                      fc_procedures and
                                      states_will_be_required_to_institute_fc and
                                      fc_are_aware_of_EUR_RVSM and
                                      hazards_mitigated.

fc_procedures if fc_transition_procedures and
                          fc_rvsm_procedures and
                          fc_flt_planning_procedures and
                          fc_flt_contigency_procedures.


fc_transition_procedures if fc_transition_procedures_produced and
                                     fc_transition_procedures_verified.

fc_transition_procedures_produced. 
fc_transition_procedures_verified. 


fc_rvsm_procedures if fc_rvsm_procedures_produced and
                               fc_rvsm_procedures_validated.

fc_rvsm_procedures_produced. 

fc_rvsm_procedures_validated if fc_rvsm_procedures_proved_by_NAT.
fc_rvsm_procedures_proved_by_NAT. 

fc_flt_contigency_procedures if fc_flt_contigency_procedures_produced and
                                         fc_flt_contigency_procedures_validated.

fc_flt_contigency_procedures_produced. 
fc_flt_contigency_procedures_validated. 


fc_flt_planning_procedures if fc_transition_procedures_produced and
                                       fc_flt_planning_procedures_validated.


fc_flt_planning_procedures. 
fc_flt_planning_procedures_validated if fc_flt_planning_procedures_proved_by_NAT.
fc_flt_planning_procedures_proved_by_NAT. 


states_will_be_required_to_institute_fc.
fc_are_aware_of_EUR_RVSM. 


mitigated(ht_3_5).
mitigated(hm_1_8).
mitigated(hm_2_2).
mitigated(hm_1_15).


aircraft_equipment_design_complies_with_SRs if 
                                      fc_training_design_complies_with_SRs and
                                      fc_transition_training.

fc_training_design_complies_with_SRs if
                                   fc_transition_training and 
                                   fc_rvsm_training and
                                   fc_contigency_training and
                                   fc_flt_planning_training and
                                   hazards_mitigated.

fc_transition_training if fc_transition_training_produced and
                          fc_transition_training_validated.

fc_transition_training_produced.                       
fc_transition_training_validated if fc_transition_training_validated_in_NAT.
fc_transition_training_validated_in_NAT. 

fc_rvsm_training if fc_rvsm_training_produced and
                          fc_rvsm_training_validated.


fc_rvsm_training_produced.                        
fc_rvsm_training_validated if fc_rvsm_training_validated_in_NAT.
fc_rvsm_training_validated_in_NAT.

fc_contigency_training if fc_contigency_training_produced and
                          fc_contigency_training_validated.


fc_contigency_training_produced.                        
fc_contigency_training_validated if fc_contigency_training_validated_in_NAT.
fc_contigency_training_validated_in_NAT. 

fc_flt_planning_training if fc_flt_planning_training_produced and
                            fc_flt_planning_training_validated.


fc_flt_planning_training_produced.                      
fc_flt_planning_training_validated if fc_flt_planning_training_validated_in_NAT.
fc_flt_planning_training_validated_in_NAT. 


mitigated(ht_1_9).
mitigated(ht_3_5).
mitigated(hm_2_2).
mitigated(hm_1_6).
mitigated(hm_1_8). 
mitigated(hm_1_15).


aircraft_equipment_design_complies_with_SRs if
                                      tls_met and
                                      risks_controlled.

tls_met if required_height_keeping_accuracy_met.

required_height_keeping_accuracy_met if masps_height_keeping_accuracy_met.

masps_height_keeping_accuracy_met if crm_valid . 

crm_valid. 

controlled(risk556 R) if mitigated(hazard556 H) and R = risk(H).

controlled(risk556 R) if tolerable(R).

tolerable(risk(hm_1_14)).
tolerable(risk(hm_1_3)).

atc_procedure_design_complies_with_SRs if
                                      atc_transition_procedures and
                                      atc_rvsm_procedures and
                                      atc_contingency_procedures and
                                      atc_clearance_procedures and 
                                      hazards_mitigated.

fc_transition_procedures    if atc_transition_procedures_produced and
                               atc_transition_procedures_validated.

atc_transition_procedures_produced. 
atc_transition_procedures_validated. 

atc_rvsm_procedures if atc_rvsm_procedures_produced and
                               atc_rvsm_procedures_validated.

atc_rvsm_procedures_produced. 
atc_rvsm_procedures_validated. 

atc_contingency_procedures if         atc_contingency_procedures_produced and
                                       atc_contingency_procedures_validated.

atc_contingency_procedures_produced. 
atc_contingency_procedures_validated.

atc_clearance_procedures if atc_clearance_procedures_produced and
                                       atc_clearance_procedures_validated.

atc_clearance_procedures_produced.
atc_clearance_procedures_validated. 

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

atc_training_design_complies_with_SRs if all_atc_trainings and 
                                         hazards_mitigated.

all_atc_trainings     if all_atc_training_produced_by_competent_staff and
                         all_atc_training_validated.


all_atc_training_produced_by_competent_staff. 
all_atc_training_validated. 


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

atc_equipment_design_complies_with_SRs if
                           modification_made(alert_on_adj_aircraft) and
                           modification_made(to_display_apprv_aircraft) and
                           fps_oldi_messaged_display_rfl and
                           hazards_mitigated.

modification_made(modification X) if  modification_specified(X) and 
                    complies_with_recommended_practice(X) and
                    validated(X).


modification_specified(ifps). 
modification_specified(rdps). 
modification_specified(fdps_fps). 
modification_specified(oldi). 
modification_specified(back_up_systems).

system_monitoring_complies_with_SRs if
                       thke_complient_with_masps and
                       operation_error_rate_verified and        
                       non_approved_aircraft_excluded and
                       tls_met and
                       hazards_mitigated and
                       assumptions_about_alert_rate_validated.
thke_complient_with_masps if
                   thke_measured_by_monitors and
                   monitors_validated.

thke_measured_by_monitors. 
monitors_validated. 

operation_error_rate_verified. 

crm_assumptions_are_valid if 
        overlap_frequency_verified and
        original_crm_validated_by_nat and
        rvsm_adapted_crm_validated and
        crm_scenarios_valid and
        crm_staff_competent.

overlap_frequency_verified. 
original_crm_validated_by_nat. 
rvsm_adapted_crm_validated. 
crm_scenarios_valid.  
crm_staff_competent. 

non_approved_aircraft_excluded if 
             number_of_non_approved_aircraft_acceptable and
             number_of_approved_aircraft_acceptable.

number_of_non_approved_aircraft_acceptable. 
number_of_approved_aircraft_acceptable.

tls_met if crm_shows_tls_met and
           crm_assumptions_are_valid.

crm_shows_tls_met. 

assumptions_about_alert_rate_validated. 

mitigated(hm_2_2) if  non_approved_aircraft_excluded.
mitigated(hm_1_1) if  assumptions_about_alert_rate_validated.

safety_constraints_satisfied if
        safety_proven_for_2001_levels and
        safety_justified_for_2000plus_levels.

safety_proven_for_2001_levels. 
safety_justified_for_2000plus_levels. 
     
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMPLEX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

risks_controlled if 
                  controlled(risk(every hazard527)).
/* Because we already declared the type risk527 = risk(H) where H in hazard527, this rule can be simplified to risks_controlled if controlled(every risk527). */

hazards_mitigated if mitigated(every hazard527).


hazards_mitigated if mitigated(every hazard546).

tls_met if required_height_keeping_accuracy_met.


risks_controlled if 
                  controlled(risk(every hazard556)).

hazards_mitigated if mitigated(every hazard565).

hazards_mitigated if mitigated(every hazard5910).


residual_risks_are_controlled if
          controlled(every residual_risk).


hazards_mitigated if mitigated(every hazard575).


complies_with_recommended_practice(every modification). 
validated(every modification). 

hazards_mitigated if mitigated(every hazard5810).


mitigated(every hazard5810). 
