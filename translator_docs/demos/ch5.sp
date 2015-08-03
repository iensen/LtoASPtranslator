sorts

#residual_risk = {level_busts, asac_usage_risks, wake_vortices, mountain_waves, operation_errors}.
#hazard527 = {ht_1_8, ht_1_10, ht_2_2, ht_3_6, ht_1_11}.
#risk527 = risk(#hazard527).
#hazard537 = {ht_3_5, hm_1_8, hm_2_2, hm_1_15}.
#hazard546 = {ht_1_9, ht_3_5, hm_2_2, hm_1_6, hm_1_8, hm_1_15}.
#hazard556 = {hm_1_3, hm_1_14}.
#risk556 = risk(#hazard556).
#hazard565 = {ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5, ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15, hm_2_17, hm_2_7, hm_2_9}.
#hazard575 = {ht_1_1, ht_1_2, ht_1_5, ht_1_8, ht_1_9, ht_2_2, ht_3_5, ht_3_6, hm_1_10, hm_1_13, hm_2_1, hm_2_4, hm_2_5, hm_1_9, hm_1_15, hm_2_17, hm_2_7, hm_2_9}.
#mod_to_to_display_apprv_aircraft  = {ifps, rdps, fdps_fps, oldi, back_up_systems}.
#modification = #mod_to_to_display_apprv_aircraft + {alert_on_adj_aircraft}.
#hazard5810 = {hm_2_6, hm_2_5, hm_2_17, hm_1_2, hm_2_7, hm_2_8, hm_2_13, hm_2_10, hm_2_11, ht_1_9, hm_2_27}.
#hazard5910 = {hm_2_2, hm_1_1}.

#all = #residual_risk + #hazard527 + #risk527 + #hazard537 + #hazard546 + #hazard556 + #risk556 + #hazard565 + #hazard575 + #mod_to_to_display_apprv_aircraft + #modification + #hazard5810 + #hazard5910 +
{to_display_apprv_aircraft, operational_errors}. % Due to the predicates modification_made(to_display_apprv_aircraft) and tolerable(operational_errors).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

predicates

safety_reqts_fully_realised().
airspace_design_complies_with_SRs().
fc_procedure_design_complies_with_SRs().
fc_training_design_complies_with_SRs().
aircraft_equipment_design_complies_with_SRs().
atc_procedure_design_complies_with_SRs().
atc_training_design_complies_with_SRs().
atc_equipment_design_complies_with_SRs().
system_monitoring_complies_with_SRs().
safety_constraints_satisfied().
srs_are_fully_traceable_to_concept().
residual_risks_controlled().
concept_meets_RVSM_safety_requirements().
height_keeping_requirements_covered().
operational_risk_requirements_covered().
total_vertical_risk_covered().
transition_areas().
six_new_RVSM_flight_levels().
risks_controlled().
contingency_facilities().
transition_areas_produced_by_competent_staff().
transition_areas_validated_by_competent_staff().
six_new_RVSM_flight_levels_produced_by_competent_staff().
six_new_RVSM_flight_levels_validated_by_competent_staff().
contingency_facilities_produced_by_competent_staff().
contingency_facilities_validated_by_competent_staff().
fc_procedures().
states_will_be_required_to_institute_fc().
fc_are_aware_of_EUR_RVSM().
hazards_mitigated().
fc_transition_procedures().
fc_rvsm_procedures().
fc_flt_planning_procedures().
fc_flt_contigency_procedures().
fc_transition_procedures_produced().
fc_transition_procedures_verified().
fc_rvsm_procedures_produced().
fc_rvsm_procedures_validated().
fc_rvsm_procedures_proved_by_NAT().
fc_flt_contigency_procedures_produced().
fc_flt_contigency_procedures_validated().
fc_flt_planning_procedures_validated().
fc_flt_planning_procedures_proved_by_NAT().
fc_transition_training().
fc_rvsm_training().
fc_contigency_training().
fc_flt_planning_training().
fc_transition_training_produced().
fc_transition_training_validated().
fc_transition_training_validated_in_NAT().
fc_rvsm_training_produced().
fc_rvsm_training_validated().
fc_rvsm_training_validated_in_NAT().
fc_contigency_training_produced().
fc_contigency_training_validated().
fc_contigency_training_validated_in_NAT().
fc_flt_planning_training_produced().
fc_flt_planning_training_validated().
fc_flt_planning_training_validated_in_NAT().
tls_met().
required_height_keeping_accuracy_met().
masps_height_keeping_accuracy_met().
crm_valid().
atc_transition_procedures().
atc_rvsm_procedures().
atc_contingency_procedures().
atc_clearance_procedures().
atc_transition_procedures_produced().
atc_transition_procedures_validated().
atc_rvsm_procedures_produced().
atc_rvsm_procedures_validated().
atc_contingency_procedures_produced().
atc_contingency_procedures_validated().
atc_clearance_procedures_produced().
atc_clearance_procedures_validated().
all_atc_trainings().
all_atc_training_produced_by_competent_staff().
all_atc_training_validated().
fps_oldi_messaged_display_rfl().
thke_complient_with_masps().
operation_error_rate_verified().
non_approved_aircraft_excluded().
assumptions_about_alert_rate_validated().
thke_measured_by_monitors().
monitors_validated().
crm_assumptions_are_valid().
overlap_frequency_verified().
original_crm_validated_by_nat().
rvsm_adapted_crm_validated().
crm_scenarios_valid().
crm_staff_competent().
number_of_non_approved_aircraft_acceptable().
number_of_approved_aircraft_acceptable().
crm_shows_tls_met().
safety_proven_for_2001_levels().
safety_justified_for_2000plus_levels().

mitigated(#all).
tolerable(#all).
modification_made(#all).
modification_specified(#all).
complies_with_recommended_practice(#all).
validated(#all).

controlled_every_risk527().
controlled_every_risk556().
controlled_every_residual_risk().
mitigated_every_hazard527().
mitigated_every_hazard546().
mitigated_every_hazard565().
mitigated_every_hazard5910().
mitigated_every_hazard575().
mitigated_every_hazard5810().
residual_risks_are_controlled().

controlled(#all).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rules

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

controlled(R) :- #residual_risk(R), mitigated(R).
controlled(R) :- #residual_risk(R), tolerable(R).
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

controlled(R) :- #risk527(R),
	mitigated(H), #hazard527(H),
	R = risk(H).
	
controlled(R) :- #risk527(R), tolerable(R).

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

fc_procedures :- fc_transition_procedures ,
                          fc_rvsm_procedures ,
                          fc_flt_planning_procedures ,
                          fc_flt_contigency_procedures.

fc_transition_procedures :- fc_transition_procedures_produced ,
                                     fc_transition_procedures_verified.

fc_transition_procedures_produced. 
fc_transition_procedures_verified. 

fc_rvsm_procedures :- fc_rvsm_procedures_produced ,
                               fc_rvsm_procedures_validated.

fc_rvsm_procedures_produced.

fc_rvsm_procedures_validated :- fc_rvsm_procedures_proved_by_NAT.
fc_rvsm_procedures_proved_by_NAT.

fc_flt_contigency_procedures :- fc_flt_contigency_procedures_produced ,
                                         fc_flt_contigency_procedures_validated.

fc_flt_contigency_procedures_produced. 
fc_flt_contigency_procedures_validated. 

fc_flt_planning_procedures :- fc_transition_procedures_produced ,
                                       fc_flt_planning_procedures_validated.
									   
fc_flt_planning_procedures. 
fc_flt_planning_procedures_validated :- fc_flt_planning_procedures_proved_by_NAT.
fc_flt_planning_procedures_proved_by_NAT. 

states_will_be_required_to_institute_fc.
fc_are_aware_of_EUR_RVSM. 

mitigated(ht_3_5).
mitigated(hm_1_8).
mitigated(hm_2_2).
mitigated(hm_1_15).

aircraft_equipment_design_complies_with_SRs :- 
                                      fc_training_design_complies_with_SRs,
                                      fc_transition_training.

fc_training_design_complies_with_SRs:-
                                   fc_transition_training , 
                                   fc_rvsm_training,
                                   fc_contigency_training,
                                   fc_flt_planning_training,
                                   hazards_mitigated.

fc_transition_training :- fc_transition_training_produced,
                          fc_transition_training_validated.

fc_transition_training_produced.                       
fc_transition_training_validated :- fc_transition_training_validated_in_NAT.
fc_transition_training_validated_in_NAT. 

fc_rvsm_training :- fc_rvsm_training_produced,
                          fc_rvsm_training_validated.

fc_rvsm_training_produced.                        
fc_rvsm_training_validated :- fc_rvsm_training_validated_in_NAT.
fc_rvsm_training_validated_in_NAT.

fc_contigency_training :- fc_contigency_training_produced,
                          fc_contigency_training_validated.

fc_contigency_training_produced.                        
fc_contigency_training_validated :- fc_contigency_training_validated_in_NAT.
fc_contigency_training_validated_in_NAT. 

fc_flt_planning_training :- fc_flt_planning_training_produced,
                            fc_flt_planning_training_validated.

fc_flt_planning_training_produced.                      
fc_flt_planning_training_validated :- fc_flt_planning_training_validated_in_NAT.
fc_flt_planning_training_validated_in_NAT. 

mitigated(ht_1_9).
mitigated(ht_3_5).
mitigated(hm_2_2).
mitigated(hm_1_6).
mitigated(hm_1_8). 
mitigated(hm_1_15).

aircraft_equipment_design_complies_with_SRs:-
                                      tls_met,
                                      risks_controlled.

tls_met :- required_height_keeping_accuracy_met.

required_height_keeping_accuracy_met :- masps_height_keeping_accuracy_met.

masps_height_keeping_accuracy_met :- crm_valid . 

crm_valid.

controlled(R) :- #risk556(R),
	mitigated(H), #hazard556(H),
	R = risk(H).
	
controlled(R) :- #risk556(R), tolerable(R).

tolerable(risk(hm_1_14)).
tolerable(risk(hm_1_3)).

atc_procedure_design_complies_with_SRs:-
                                      atc_transition_procedures,
                                      atc_rvsm_procedures,
                                      atc_contingency_procedures,
                                      atc_clearance_procedures , 
                                      hazards_mitigated.

fc_transition_procedures    :- atc_transition_procedures_produced,
                               atc_transition_procedures_validated.

atc_transition_procedures_produced. 
atc_transition_procedures_validated. 

atc_rvsm_procedures:- atc_rvsm_procedures_produced,
                               atc_rvsm_procedures_validated.

atc_rvsm_procedures_produced. 
atc_rvsm_procedures_validated. 

atc_contingency_procedures:-         atc_contingency_procedures_produced,
                                       atc_contingency_procedures_validated.

atc_contingency_procedures_produced. 
atc_contingency_procedures_validated.

atc_clearance_procedures:- atc_clearance_procedures_produced,
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

atc_training_design_complies_with_SRs:- all_atc_trainings, 
                                         hazards_mitigated.

all_atc_trainings    :- all_atc_training_produced_by_competent_staff,
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

atc_equipment_design_complies_with_SRs:-
                           modification_made(alert_on_adj_aircraft),
                           modification_made(to_display_apprv_aircraft),
                           fps_oldi_messaged_display_rfl,
                           hazards_mitigated.

modification_made(X) :- #modification(X),
	modification_specified(X),
	complies_with_recommended_practice(X),
	validated(X).
	
modification_specified(ifps). 
modification_specified(rdps). 
modification_specified(fdps_fps). 
modification_specified(oldi). 
modification_specified(back_up_systems).

system_monitoring_complies_with_SRs:-
                       thke_complient_with_masps,
                       operation_error_rate_verified,        
                       non_approved_aircraft_excluded,
                       tls_met,
                       hazards_mitigated,
                       assumptions_about_alert_rate_validated.
thke_complient_with_masps:-
                   thke_measured_by_monitors,
                   monitors_validated.

thke_measured_by_monitors. 
monitors_validated. 

operation_error_rate_verified. 

crm_assumptions_are_valid:- 
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

non_approved_aircraft_excluded:- 
             number_of_non_approved_aircraft_acceptable,
             number_of_approved_aircraft_acceptable.

number_of_non_approved_aircraft_acceptable. 
number_of_approved_aircraft_acceptable.

tls_met:- crm_shows_tls_met,
           crm_assumptions_are_valid.

crm_shows_tls_met. 

assumptions_about_alert_rate_validated. 

mitigated(hm_2_2):-  non_approved_aircraft_excluded.
mitigated(hm_1_1):-  assumptions_about_alert_rate_validated.

safety_constraints_satisfied:-
        safety_proven_for_2001_levels,
        safety_justified_for_2000plus_levels.

safety_proven_for_2001_levels. 
safety_justified_for_2000plus_levels.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% COMPLEX RULES
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-controlled_every_risk527 :- #risk527(R), not controlled(R).
controlled_every_risk527 :- not -controlled_every_risk527.
risks_controlled :- controlled_every_risk527.

-controlled_every_risk556 :- #risk556(R), not controlled(R).
controlled_every_risk556 :- not -controlled_every_risk556.
risks_controlled :- controlled_every_risk556.

-controlled_every_residual_risk :- #residual_risk(R), not controlled(R).
controlled_every_residual_risk :- not -controlled_every_residual_risk.
residual_risks_are_controlled :- controlled_every_residual_risk.

-mitigated_every_hazard527 :- #hazard527(H), not mitigated(H).
mitigated_every_hazard527 :- not -mitigated_every_hazard527.
hazards_mitigated :- mitigated_every_hazard527.

-mitigated_every_hazard546 :- #hazard546(H), not mitigated(H).
mitigated_every_hazard546 :- not -mitigated_every_hazard546.
hazards_mitigated :- mitigated_every_hazard546.

-mitigated_every_hazard565 :- #hazard565(H), not mitigated(H).
mitigated_every_hazard565 :- not -mitigated_every_hazard565.
hazards_mitigated :- mitigated_every_hazard565.

-mitigated_every_hazard5910 :- #hazard5910(H), not mitigated(H).
mitigated_every_hazard5910 :- not -mitigated_every_hazard5910.
hazards_mitigated :- mitigated_every_hazard5910.

-mitigated_every_hazard575 :- #hazard575(H), not mitigated(H).
mitigated_every_hazard575 :- not -mitigated_every_hazard575.
hazards_mitigated :- mitigated_every_hazard575.

-mitigated_every_hazard5810 :- #hazard5810(H), not mitigated(H).
mitigated_every_hazard5810 :- not -mitigated_every_hazard5810.
hazards_mitigated :- mitigated_every_hazard5810.

tls_met :- required_height_keeping_accuracy_met.

complies_with_recommended_practice(M) :- #modification(M).
validated(M) :- #modification(M).

mitigated(H) :- #hazard5810(H).