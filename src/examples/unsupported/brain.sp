wrong statement: case(1, node N1, direction Dir) if 
		not sending(N1) and 
		sent_to(some node N2,N1,some data Data1) and 
		sent_to(some node N3,N1, some data Data2) and
		skip_link(N2,N1,Dir) and 
		direct_link(N3,N1,Dir) and
		hop_count(N2,N1,some hopc H) and 
		H != 1 and 
		id(N2,N1,some node N4) and 
		not_discordant(N4,N1,Dir,H+2). at line number 436
wrong statement: case(2,node N1, direction Dir) if 
		not sending(N1) and
		sent_to(some node N2,N1,some data Data) and 
		direct_link(N2,N1,Dir) and 
		skip_link(some node N3,N1,Dir) and 
		not frame_sent(N3,N1) and 
		hop_count(N2,N1,some hopc H) and
		H >= 2 and 
		id(N2,N1, some node N4) and
		not_discordant(N4,N1,Dir,H+1). at line number 447
wrong statement: case(3,node N1, direction Dir) if 
		not sending(N1) and 
		sent_to(some node N2,N1, some data Data) and
		skip_link(N2,N1,Dir) and
		direct_link(some node N3,N1,Dir) and
		not frame_sent(N3,N1) and 
		hop_count(N2,N1,some hopc H) and 
		H != 1 and 
		id(N2,N1,some node N4) and 
		not_discordant(N4,N1,Dir,H+2). at line number 458
wrong statement: sent_to(node N2, node N3 , data Data) if
       sent_to(some node N1,N2,Data) and 
       not bad_node(N2) and 
       case(case_num C,N2,some direction Dir) and 
       C != 2 and 
       skip_link(N1,N2,Dir) and 
       link(N2,N3,Dir). at line number 467
wrong statement: sent_to(node N2, node N3, data Data) if
       sent_to(some node N1,N2,Data) and
       not bad_node(N2) and
       case(2,N2,some direction Dir) and
       direct_link(N1,N2,Dir) and      
       link(N2,N3,Dir). at line number 486
wrong statement: id(node N2, node N3, node ID) if
       id(some node N1,N2,ID) and
       not bad_node(N2) and 
       case(case_num C,N2,some direction Dir) and
       C !=  2 and 
       skip_link(N1,N2,Dir) and
       link(N2,N3,Dir). at line number 507
wrong statement: id(node N2, node N3, node ID) if
       id(some node N1,N2,ID) and 
       not bad_node(N2) and
       case(2,N2,some direction Dir) and
       direct_link(N1,N2, Dir) and 
       link(N2,N3,Dir). at line number 528
wrong statement: partner(node N2,node N3, node ID) if
       partner(some node N1,N2,ID) and
       not bad_node(N2) and
       case(case_num C,N2, some direction Dir) and
       C != 2 and
       skip_link(N1,N2,Dir) and
       link(N2,N3,Dir). at line number 550
wrong statement: partner(node N2,node N3,node ID) if
       partner(some node N1,N2,ID) and
       not bad_node(N2) and
       case(2,N2,some direction Dir) and
       direct_link(N1,N2,Dir) and
       link(N2,N3,Dir). at line number 571
wrong statement: hop_count(node N2, node N3, hopc Count + 2) if
       hop_count(some node N1,N2,Count) and
       not bad_node(N2) and
       case(some case_num C,N2,some direction Dir) and
       C != 2 and 
       skip_link(N1,N2,Dir) and
       link(N2,N3,Dir). at line number 592
wrong statement: hop_count(node N2, node N3,hopc Count + 1) if
       hop_count(some node N1,N2,Count) and
       not bad_node(N2) and 
       case(2,N2,some direction Dir) and 
       direct_link(N1,N2,Dir) and 
       link(N2,N3,Dir). at line number 612
wrong statement: pair_cong(node N3, node N4) if
        not bad_node(N3) and
		skip_link(some node N1,N3, some direction Dir) and
		direct_link(some node N2,N3,Dir) and
		case(1,N3,Dir) and
		hop_count(N1,N3,0) and
		hop_count(N2,N3,0) and		
		sent_to(N1,N3,some data Data) and
		sent_to(N2,N3,Data) and
		integrity(N1,N3) and
		integrity(N2,N3) and
		link(N3,N4,Dir). at line number 645
wrong statement: pair_cong(node N3, node N4) if
        not bad_node(N3) and 
		skip_link(some node N1,N3, some direction Dir) and 
		direct_link(some node N2,N3,Dir) and 
		case(1,N3,Dir) and 
		hop_count(N1,N3,0) and 
		hop_count(N2,N3, some hopc Num) and
		Num < 0 and		
		sent_to(N1,N3,some data Data) and
		sent_to(N2,N3,Data) and
		integrity(N1,N3) and 
		integrity(N2,N3) and 
		pair_cong(N2,N3) and 
		link(N3,N4,Dir). at line number 709
wrong statement: pair_cong(node N3, node N4) if
        not bad_node(N3) and 
		skip_link(some node N1,N3, some direction Dir) and 
		direct_link(some node N2,N3,Dir) and 
		case(1,N3,Dir) and 
		hop_count(N1,N3, some hopc Num1) and 
		hop_count(N2,N3, some hopc Num2) and 
		Num1 != 0 and
		pair_cong(N1,N3) and 
		link(N3,N4,Dir). at line number 721
wrong statement: pair_cong(node N2, node N3)  if 
        not bad_node(N2) and 
		case(some case_num C,N2, some direction Dir) and
		C != 1 and
		link(some node N1,N2,Dir) and 
		hop_count(N1,N2, some hopc H) and 
		H != 0 and 
		pair_cong(N1,N2) and 
		link(N2,N3,Dir). at line number 732
wrong statement: integrity(node N3,node N4) if
        not bad_node(N3) and
		skip_link(some node N1,N3, some direction Dir)and 
		direct_link(some node N2,N3,Dir) and
		case(1,N3,Dir) and
		hop_count(N1,N3,0) and 
		hop_count(N2,N3,0) and	
		sent_to(N1,N3,some data Data) and
		sent_to(N2,N3,Data) and
		link(N3,N4,Dir). at line number 774
wrong statement: integrity(node N3, node N4) if
        not bad_node(N3) and 
		skip_link(some node N1,N3, some direction Dir) and 
		direct_link(some node N2,N3,Dir) and
		case(1,N3,Dir) and
		integrity(N1,N3) and
		integrity(N2,N3) and		
		sent_to(N1,N3,some data Data) and
		sent_to(N2,N3,Data) and
		link(N3,N4,Dir). at line number 785
wrong statement: sent_to(node N1,node N2,good) or sent_to(N1,N2,bad(N1)) if 
       bad_node(N1) and 
       not omit(N1,N2) and 
       link(N1,N2,some direction Dir). at line number 817
wrong statement: maybe id(node N1, node N2, node N3) if 
                   bad_node(N1) and
                   not omit(N1, N2) and
                   link (N1, N2, some direction Dir). at line number 854
wrong statement: 1<=|{id(node N1, node N2, node N3)}|<=1 if  bad_node(N1) and
                                            not omit(N1, N2) and
                                            link (N1, N2, some direction Dir). at line number 858
wrong statement: maybe hop_count(node N1, node N2, hopc H) if bad_node(N1) 
                                             and not omit(N1, N2)
                                             and link(N1, N2, some direction Dir). at line number 875
wrong statement: 1<=|{hop_count(node N1, node N2, hopc H)}|<=1 if bad_node(N1) 
                                             and not omit(N1, N2)
                                             and link(N1, N2, some direction Dir). at line number 880
wrong statement: maybe integrity(node N1, node N2) if bad_node(N1) 
                                  and link(N1,N2, some direction Dir). at line number 886
wrong statement: maybe pair_cong(node N1, node N2) if bad_node(N1)
                                  and link(N1, N2, some direction Dir). at line number 889
wrong statement: inline_accept(node N3, data Data, direction Dir) if
		not sending(N3) and       skip_link(some node N1,N3,Dir) and
		direct_link(some node N2,N3,Dir) and
		integrity(N1,N3) and
		integrity(N2,N3) and		
		sent_to(N1,N3,Data) and
		sent_to(N2,N3,Data) and
		id(N1,N3,some node N4) and
		partner(N2,N3,N4) and
		id(N2,N3,some node N5) and
		partner(N1,N3,N5). at line number 929
wrong statement: inline_passed(node N) if inline_accept(N,some data Data, some direction Dir). at line number 1009
wrong statement: recon_qualify_hop(node N1, node N2, direction Dir) if
		direct_link(N1,N2,Dir) and 
		id(N1,N2,some node N3) and 
		hop_count(N1,N2,some hopc H) and 
		H >= 2 and
		not_discordant(N3,N2,Dir,H+1). at line number 1017
wrong statement: recon_qualify_hop(node N1, node N2, direction Dir) if
		skip_link(N1,N2,Dir) and 
		id(N1,N2, some node N3) and 
		hop_count(N1,N2,some hopc H) and 
		H != 1 and 
		not_discordant(N3,N2,Dir,H+2). at line number 1024
wrong statement: recon_accept(node N1,data Data) if		
		not sending(N1) and
		not inline_passed(N1) and  
		sent_to(some node N2,N1,Data) and 
		sent_to(some node N3,N1,Data) and 
		N2 != N3 and 
		recon_qualify_hop(N2,N1, some direction Dir1) and 
		recon_qualify_hop(N3,N1, some direction Dir2) and 
		Dir1 != Dir2 and 
		recon_case_met(N1,N2,N3). at line number 1036
wrong statement: recon_case_met(node N1,node N2,node N3) if
		id(N2,N1,some node N4) and 
		id(N3,N1,some node N5) and 
		partner(N2,N1,N5) and 
		partner(N3,N1,N4) and
		adjusted_hop_sum(N1,N2,N3,n-1). at line number 1044
wrong statement: recon_case_met(node N1,node N2, node N3) if
		id(N2,N1,some node N) and 
		id(N3,N1,N) and 
		pair_cong(N2,N1) and 
		hop_count(N2,N1,some hopc H) and
		H > 1 and 
		adjusted_hop_sum(N1,N2,N3,n). at line number 1052
wrong statement: recon_case_met(node N1,node N2,node N3) if
		id(N2,N1, some  node N4) and
		id(N3,N1, some  node N5) and 
		partner(N2,N1,N5) and 
		partner(N3,N1,N4) and
		pair_cong(N2,N1) and 
		hop_count(N2,N1,some hopc H) and 
		H >1 and
		adjusted_hop_sum(N1,N2,N3,n+1). at line number 1062
wrong statement: bad_accepted if 
		not sending(some node N) and
		accepted(N,some data Data) and
		Data != good. at line number 1097
wrong statement: good_not_accepted if 
		not sending(some node N) and
		not accepted(N,good). at line number 1108

sorts

#node = 0..7.
#direction = {left, right}.
#data = {bad(0), good, bad(5), bad(1), bad(2), bad(7), bad(3), bad(6), bad(4)}.
#hopc = 0..10.
#case_num = 1..3.
#integrity_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#id_2_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#frame_sent_2_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#aux_predicate_7_termS = {4, 6, 2, 0, 5, 1, 10, 9, 3, 7, 8}.
#is_node_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#inline_accept_3_termS = {left, right}.
#sent_to_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#aux_predicate_3_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#direct_link_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#link_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#hop_count_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#hop_add_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#aux_predicate_8_termS = {4, 6, 2, 0, 5, 1, 10, 9, 3, 7, 8}.
#adjusted_hop_sum_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#inline_accept_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#bad_node_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#omit_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#not_discordant_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#hop_add_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#inline_accept_2_termS = {bad(0), bad(7), good, bad(3), bad(5), bad(1), bad(6), bad(2), bad(4)}.
#adjusted_hop_sum_2_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#accepted_2_termS = {bad(0), good, bad(5), bad(1), bad(2), bad(7), bad(3), bad(6), bad(4)}.
#direct_link_3_termS = {left, right}.
#link_3_termS = {left, right}.
#skip_link_3_termS = {left, right}.
#recon_accept_2_termS = {left, right}.
#adjusted_hop_sum_4_termS = {4, 6, 2, 3, 0, 7, 8, 5, 1, 10, 9}.
#aux_predicate_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#sent_to_3_termS = {bad(0), good, bad(5), bad(1), bad(2), bad(7), bad(3), bad(6), bad(4)}.
#accepted_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#partner_3_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#integrity_2_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#v_hop_1_termS = {4, 6, 2, 3, 0, 7, 8, 5, 1, 10, 9}.
#sending_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#link_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#partner_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#hop_add_3_termS = {4, 6, 2, 3, 0, 7, 8, 5, 1, 10, 9}.
#aux_predicate_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#pair_cong_2_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#omit_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#aux_predicate_4_termS = {4, 6, 2, 0, 5, 1, 10, 9, 3, 7, 8}.
#id_3_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#frame_sent_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#direct_link_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#hop_count_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#skip_link_1_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#recon_accept_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#skip_link_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#sent_to_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#hop_count_3_termS = {4, 6, 2, 3, 0, 7, 8, 5, 1, 10, 9}.
#adjusted_hop_sum_3_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#id_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#partner_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#not_discordant_2_termS = {4, 6, 2, 3, 0, 7, 5, 1}.
#not_discordant_3_termS = {left, right}.
#not_discordant_4_termS = {4, 6, 2, 0, 5, 1, 10, 9, 3, 7, 8}.
#pair_cong_1_termS = {4, 5, 1, 6, 2, 3, 0, 7}.
#aux_predicate_5_termS = {4, 6, 2, 0, 5, 1, 10, 9, 3, 7, 8}.
#aux_predicate_6_termS = {4, 6, 2, 0, 5, 1, 10, 9, 3, 7, 8}.

predicates

v_hop(#v_hop_1_termS).
hop_count(#hop_count_1_termS, #hop_count_2_termS, #hop_count_3_termS).
sent_to(#sent_to_1_termS, #sent_to_2_termS, #sent_to_3_termS).
sending(#sending_1_termS).
aux_predicate(#aux_predicate_1_termS, #aux_predicate_2_termS, #aux_predicate_3_termS, #aux_predicate_4_termS, #aux_predicate_5_termS, #aux_predicate_6_termS, #aux_predicate_7_termS, #aux_predicate_8_termS).
direct_link(#direct_link_1_termS, #direct_link_2_termS, #direct_link_3_termS).
frame_sent(#frame_sent_1_termS, #frame_sent_2_termS).
bad_accepted().
integrity(#integrity_1_termS, #integrity_2_termS).
link(#link_1_termS, #link_2_termS, #link_3_termS).
inline_accept(#inline_accept_1_termS, #inline_accept_2_termS, #inline_accept_3_termS).
id(#id_1_termS, #id_2_termS, #id_3_termS).
bad_node(#bad_node_1_termS).
skip_link(#skip_link_1_termS, #skip_link_2_termS, #skip_link_3_termS).
hop_add(#hop_add_1_termS, #hop_add_2_termS, #hop_add_3_termS).
pair_cong(#pair_cong_1_termS, #pair_cong_2_termS).
recon_accept(#recon_accept_1_termS, #recon_accept_2_termS).
adjusted_hop_sum(#adjusted_hop_sum_1_termS, #adjusted_hop_sum_2_termS, #adjusted_hop_sum_3_termS, #adjusted_hop_sum_4_termS).
is_node(#is_node_1_termS).
partner(#partner_1_termS, #partner_2_termS, #partner_3_termS).
omit(#omit_1_termS, #omit_2_termS).
accepted(#accepted_1_termS, #accepted_2_termS).
not_discordant(#not_discordant_1_termS, #not_discordant_2_termS, #not_discordant_3_termS, #not_discordant_4_termS).
bad().


rules

is_node(N) :- #node(N).
v_hop(N) :- #hopc(N).
not_discordant(N1, N2, right, H) :- N2 > N1, (N2 - N1) = H, #hopc(H), #node(N1), #node(N2).
not_discordant(N1, N2, right, H) :- N2 < N1, ((N2 + 8) - N1) = H, #hopc(H), #node(N1), #node(N2).
not_discordant(N1, N2, left, H) :- N2 < N1, (N1 - N2) = H, #hopc(H), #node(N1), #node(N2).
not_discordant(N1, N2, left, H) :- N2 > N1, ((N1 + 8) - N2) = H, #hopc(H), #node(N1), #node(N2).
frame_sent(N1, N2) :- sent_to(N1, N2, QuantifiedVar0), #node(N1), #data(QuantifiedVar0), #node(N2).
hop_add(N1, N2, 1) :- direct_link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
hop_add(N1, N2, 2) :- skip_link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
adjusted_hop_sum(N1, N2, N3, Num) :- aux_predicate(N1, N2, N3, Num, QuantifiedVar0, QuantifiedVar1, QuantifiedVar2, QuantifiedVar3), #hopc(QuantifiedVar1), #hopc(Num), #hopc(QuantifiedVar0), #hopc(QuantifiedVar3), #node(N2), #node(N1), #node(N3), #hopc(QuantifiedVar2).
aux_predicate(N1, N2, N3, Num, H1, H2, H3, H4) :- hop_count(N2, N1, H1), hop_count(N3, N1, H2), hop_add(N2, N1, H3), hop_add(N3, N1, H4), (((H1 + H2) + H3) + H4) = Num, #node(N3), #hopc(Num), #node(N1), #hopc(H1), #node(N2), #hopc(H3), #hopc(H2), #hopc(H4).
direct_link(N1, N2, right) :- N2 = (N1 + 1), #node(N1), #node(N2).
direct_link(7, 0, right).
skip_link(N1, N2, right) :- N2 = (N1 + 2), #node(N1), #node(N2).
skip_link(6, 0, right).
skip_link(7, 1, right).
direct_link(N1, N2, left) :- direct_link(N2, N1, right), #node(N1), #node(N2).
skip_link(N1, N2, left) :- skip_link(N2, N1, right), #node(N1), #node(N2).
link(N1, N2, Dir) :- direct_link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
link(N1, N2, Dir) :- skip_link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
sending(0).
sending(1).
id(N1, N2, N1) :- sending(N1), -bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
partner(N1, N2, N3) :- sending(N1), sending(N3), N1 != N3, -bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N3), #node(N1), #node(N2).
sent_to(N1, N2, good) :- sending(N1), -bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
hop_count(N1, N2, 0) :- sending(N1), -bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
integrity(N1, N2) :- sending(N1), -bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
pair_cong(N1, N2) :- sending(N1), -bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
omit(N1, N2) | -omit(N1, N2) :- bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
:- 1 < #count{0: omit(N1, N2)}, bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
:- 0 > #count{0: omit(N1, N2)}, bad_node(N1), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
partner(N1, N2, N3) | -partner(N1, N2, N3) :- bad_node(N1), -omit(N1, N2), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N3), #node(N1), #node(N2).
:- 1 < #count{0, N3: partner(N1, N2, N3), #node(N3)}, bad_node(N1), -omit(N1, N2), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
:- 1 > #count{0, N3: partner(N1, N2, N3), #node(N3)}, bad_node(N1), -omit(N1, N2), link(N1, N2, QuantifiedVar0), #direction(QuantifiedVar0), #node(N1), #node(N2).
accepted(N, Data) :- inline_accept(N, Data, QuantifiedVar0), #data(Data), #direction(QuantifiedVar0), #node(N).
accepted(N, Data) :- recon_accept(N, QuantifiedVar0), #data(Data), #direction(QuantifiedVar0), #node(N).
bad :- bad_accepted.
bad_node(N) | -bad_node(N) :- #node(N).
:- 2 < #count{0, N: bad_node(N), #node(N)}.
:- 0 > #count{0, N: bad_node(N), #node(N)}.
:- 1 < #count{0: bad}.
:- 1 > #count{0: bad}.
-skip_link(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not skip_link(CWA_Var_1, CWA_Var_2, CWA_Var_3), #skip_link_1_termS(CWA_Var_1), #skip_link_3_termS(CWA_Var_3), #skip_link_2_termS(CWA_Var_2).
-sending(CWA_Var_1) :- not sending(CWA_Var_1), #sending_1_termS(CWA_Var_1).
-bad_accepted :- not bad_accepted.
-hop_add(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not hop_add(CWA_Var_1, CWA_Var_2, CWA_Var_3), #hop_add_2_termS(CWA_Var_2), #hop_add_1_termS(CWA_Var_1), #hop_add_3_termS(CWA_Var_3).
-recon_accept(CWA_Var_1, CWA_Var_2) :- not recon_accept(CWA_Var_1, CWA_Var_2), #recon_accept_2_termS(CWA_Var_2), #recon_accept_1_termS(CWA_Var_1).
-hop_count(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not hop_count(CWA_Var_1, CWA_Var_2, CWA_Var_3), #hop_count_3_termS(CWA_Var_3), #hop_count_1_termS(CWA_Var_1), #hop_count_2_termS(CWA_Var_2).
-sent_to(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not sent_to(CWA_Var_1, CWA_Var_2, CWA_Var_3), #sent_to_1_termS(CWA_Var_1), #sent_to_2_termS(CWA_Var_2), #sent_to_3_termS(CWA_Var_3).
-omit(CWA_Var_1, CWA_Var_2) :- not omit(CWA_Var_1, CWA_Var_2), #omit_2_termS(CWA_Var_2), #omit_1_termS(CWA_Var_1).
-accepted(CWA_Var_1, CWA_Var_2) :- not accepted(CWA_Var_1, CWA_Var_2), #accepted_2_termS(CWA_Var_2), #accepted_1_termS(CWA_Var_1).
-not_discordant(CWA_Var_1, CWA_Var_2, CWA_Var_3, CWA_Var_4) :- not not_discordant(CWA_Var_1, CWA_Var_2, CWA_Var_3, CWA_Var_4), #not_discordant_1_termS(CWA_Var_1), #not_discordant_3_termS(CWA_Var_3), #not_discordant_4_termS(CWA_Var_4), #not_discordant_2_termS(CWA_Var_2).
-bad :- not bad.
-adjusted_hop_sum(CWA_Var_1, CWA_Var_2, CWA_Var_3, CWA_Var_4) :- not adjusted_hop_sum(CWA_Var_1, CWA_Var_2, CWA_Var_3, CWA_Var_4), #adjusted_hop_sum_2_termS(CWA_Var_2), #adjusted_hop_sum_4_termS(CWA_Var_4), #adjusted_hop_sum_3_termS(CWA_Var_3), #adjusted_hop_sum_1_termS(CWA_Var_1).
-v_hop(CWA_Var_1) :- not v_hop(CWA_Var_1), #v_hop_1_termS(CWA_Var_1).
-frame_sent(CWA_Var_1, CWA_Var_2) :- not frame_sent(CWA_Var_1, CWA_Var_2), #frame_sent_2_termS(CWA_Var_2), #frame_sent_1_termS(CWA_Var_1).
-integrity(CWA_Var_1, CWA_Var_2) :- not integrity(CWA_Var_1, CWA_Var_2), #integrity_2_termS(CWA_Var_2), #integrity_1_termS(CWA_Var_1).
-inline_accept(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not inline_accept(CWA_Var_1, CWA_Var_2, CWA_Var_3), #inline_accept_1_termS(CWA_Var_1), #inline_accept_3_termS(CWA_Var_3), #inline_accept_2_termS(CWA_Var_2).
-id(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not id(CWA_Var_1, CWA_Var_2, CWA_Var_3), #id_1_termS(CWA_Var_1), #id_2_termS(CWA_Var_2), #id_3_termS(CWA_Var_3).
-is_node(CWA_Var_1) :- not is_node(CWA_Var_1), #is_node_1_termS(CWA_Var_1).
-aux_predicate(CWA_Var_1, CWA_Var_2, CWA_Var_3, CWA_Var_4, CWA_Var_5, CWA_Var_6, CWA_Var_7, CWA_Var_8) :- not aux_predicate(CWA_Var_1, CWA_Var_2, CWA_Var_3, CWA_Var_4, CWA_Var_5, CWA_Var_6, CWA_Var_7, CWA_Var_8), #aux_predicate_2_termS(CWA_Var_2), #aux_predicate_7_termS(CWA_Var_7), #aux_predicate_1_termS(CWA_Var_1), #aux_predicate_5_termS(CWA_Var_5), #aux_predicate_6_termS(CWA_Var_6), #aux_predicate_8_termS(CWA_Var_8), #aux_predicate_3_termS(CWA_Var_3), #aux_predicate_4_termS(CWA_Var_4).
-bad_node(CWA_Var_1) :- not bad_node(CWA_Var_1), #bad_node_1_termS(CWA_Var_1).
-direct_link(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not direct_link(CWA_Var_1, CWA_Var_2, CWA_Var_3), #direct_link_3_termS(CWA_Var_3), #direct_link_2_termS(CWA_Var_2), #direct_link_1_termS(CWA_Var_1).
-link(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not link(CWA_Var_1, CWA_Var_2, CWA_Var_3), #link_3_termS(CWA_Var_3), #link_2_termS(CWA_Var_2), #link_1_termS(CWA_Var_1).
-pair_cong(CWA_Var_1, CWA_Var_2) :- not pair_cong(CWA_Var_1, CWA_Var_2), #pair_cong_1_termS(CWA_Var_1), #pair_cong_2_termS(CWA_Var_2).
-partner(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not partner(CWA_Var_1, CWA_Var_2, CWA_Var_3), #partner_1_termS(CWA_Var_1), #partner_2_termS(CWA_Var_2), #partner_3_termS(CWA_Var_3).

display

v_hop. hop_count. sent_to. sending. aux_predicate. direct_link. frame_sent. bad_accepted. integrity. link. inline_accept. id. bad_node. skip_link. hop_add. pair_cong. recon_accept. adjusted_hop_sum. is_node. partner. omit. accepted. not_discordant. bad. 
