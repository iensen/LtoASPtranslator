
sorts

#node = 0..7.
#direction = {left, right}.
#data = {bad(3), bad(5), bad(7), bad(4), good, bad(0), bad(2), bad(1), bad(6)}.
#hopc = 0..10.
#case_num = 1..3.
#type_termS = #node + #direction + #data + #hopc + #case_num.
#rule_termS = {0, left, 2, bad(0), 4, bad(2), 11, 7, 12, 10, bad(7), 3, right, 1, bad(1), bad(3), 9, bad(4), 5, bad(6), bad(5), good, 8, 6}.
#prog_termS = #type_termS + #rule_termS.

predicates

bad_accepted(). discordant(#prog_termS, #prog_termS, #prog_termS, #prog_termS). v_hop(#prog_termS). adjusted_hop_sum(#prog_termS, #prog_termS, #prog_termS, #prog_termS). direct_link(#prog_termS, #prog_termS, #prog_termS). integrity(#prog_termS, #prog_termS). omit(#prog_termS, #prog_termS). id(#prog_termS, #prog_termS, #prog_termS). recon_case_met(#prog_termS, #prog_termS, #prog_termS). case(#prog_termS, #prog_termS, #prog_termS). partner(#prog_termS, #prog_termS, #prog_termS). link(#prog_termS, #prog_termS, #prog_termS). hop_add(#prog_termS, #prog_termS, #prog_termS). bad_node(#prog_termS). is_node(#prog_termS). skip_link(#prog_termS, #prog_termS, #prog_termS). recon_qualify_hop(#prog_termS, #prog_termS, #prog_termS). frame_sent(#prog_termS, #prog_termS). not_omit(#prog_termS, #prog_termS). inline_accept(#prog_termS, #prog_termS, #prog_termS). not_discordant(#prog_termS, #prog_termS, #prog_termS, #prog_termS). hop_count(#prog_termS, #prog_termS, #prog_termS). sending(#prog_termS). sent_to(#prog_termS, #prog_termS, #prog_termS). pair_cong(#prog_termS, #prog_termS). bad(). good_not_accepted(). recon_accept(#prog_termS, #prog_termS). accepted(#prog_termS, #prog_termS). inline_passed(#prog_termS). 

rules

is_node(N) :- #node(N).
v_hop(N) :- #hopc(N).
not_discordant(N1, N2, right, H) :- N2 > N1, (N2 - N1) = H, #node(N1), #node(N2), #hopc(H).
not_discordant(N1, N2, right, H) :- N2 < N1, ((N2 + 8) - N1) = H, #node(N1), #node(N2), #hopc(H).
not_discordant(N1, N2, left, H) :- N2 < N1, (N1 - N2) = H, #node(N1), #node(N2), #hopc(H).
not_discordant(N1, N2, left, H) :- N2 > N1, ((N1 + 8) - N2) = H, #node(N1), #node(N2), #hopc(H).
frame_sent(N1, N2) :- sent_to(N1, N2, Some0), #data(Some0), #node(N1), #node(N2).
hop_add(N1, N2, 1) :- direct_link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
hop_add(N1, N2, 2) :- skip_link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
adjusted_hop_sum(N1, N2, N3, Num) :- hop_count(N2, N1, H1), hop_count(N3, N1, H2), hop_add(N2, N1, H3), hop_add(N3, N1, H4), (((H1 + H2) + H3) + H4) = Num, #hopc(H4), #node(N2), #node(N1), #hopc(H3), #node(N3), #hopc(H1), #hopc(H2), #hopc(Num).
direct_link(N1, N2, right) :- N2 = (N1 + 1), #node(N1), #node(N2).
direct_link(7, 0, right).
skip_link(N1, N2, right) :- N2 = (N1 + 2), #node(N1), #node(N2).
skip_link(6, 0, right).
skip_link(7, 1, right).
direct_link(N1, N2, left) :- direct_link(N2, N1, right), #node(N1), #node(N2).
skip_link(N1, N2, left) :- skip_link(N2, N1, right), #node(N1), #node(N2).
link(N1, N2, Dir) :- direct_link(N1, N2, Some0), #node(N1), #node(N2), #direction(Dir), #direction(Some0).
link(N1, N2, Dir) :- skip_link(N1, N2, Some0), #node(N1), #node(N2), #direction(Dir), #direction(Some0).
sending(0).
sending(1).
id(N1, N2, N1) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
partner(N1, N2, N3) :- sending(N1), sending(N3), N1 != N3, -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #node(N3), #direction(Some0).
sent_to(N1, N2, good) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
hop_count(N1, N2, 0) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
integrity(N1, N2) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
pair_cong(N1, N2) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
case(1, N1, Dir) :- -sending(N1), sent_to(N2, N1, Data1), sent_to(N3, N1, Data2), skip_link(N2, N1, Dir), direct_link(N3, N1, Dir), hop_count(N2, N1, H), H != 1, id(N2, N1, N4), -discordant(N4, N1, Dir, (H + 2)), #node(N1), #node(N2), #direction(Dir), #data(Data2), #node(N3), #node(N4), #hopc(H), #data(Data1).
case(2, N1, Dir) :- -sending(N1), sent_to(N2, N1, Data), direct_link(N2, N1, Dir), skip_link(N3, N1, Dir), -frame_sent(N3, N1), hop_count(N2, N1, H), H >= 2, id(N2, N1, N4), -discordant(N4, N1, Dir, (H + 1)), #node(N1), #node(N2), #direction(Dir), #node(N3), #data(Data), #node(N4), #hopc(H).
case(3, N1, Dir) :- -sending(N1), sent_to(N2, N1, Data), skip_link(N2, N1, Dir), direct_link(N3, N1, Dir), -frame_sent(N3, N1), hop_count(N2, N1, H), H != 1, id(N2, N1, N4), -discordant(N4, N1, Dir, (H + 2)), #node(N1), #node(N2), #direction(Dir), #node(N3), #data(Data), #node(N4), #hopc(H).
sent_to(N2, N3, Data) :- sent_to(N1, N2, Data), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #data(Data), #case_num(C).
sent_to(N2, N3, Data) :- sent_to(N1, N2, Data), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #data(Data).
id(N2, N3, ID) :- id(N1, N2, ID), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #node(ID), #case_num(C).
id(N2, N3, ID) :- id(N1, N2, ID), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #node(ID).
partner(N2, N3, ID) :- partner(N1, N2, ID), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #node(ID), #case_num(C).
partner(N2, N3, ID) :- partner(N1, N2, ID), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #node(ID).
hop_count(N2, N3, (Count + 2)) :- hop_count(N1, N2, Count), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #hopc(Count), #node(N2), #node(N1), #direction(Dir), #node(N3), #case_num(C).
hop_count(N2, N3, (Count + 1)) :- hop_count(N1, N2, Count), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #hopc(Count), #node(N2), #node(N1), #direction(Dir), #node(N3).
pair_cong(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, 0), hop_count(N2, N3, 0), sent_to(N1, N3, Data), sent_to(N2, N3, Data), integrity(N1, N3), integrity(N2, N3), link(N3, N4, Dir), #node(N1), #node(N2), #direction(Dir), #node(N3), #data(Data), #node(N4).
pair_cong(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, 0), hop_count(N2, N3, Num), Num < 0, sent_to(N1, N3, Data), sent_to(N2, N3, Data), integrity(N1, N3), integrity(N2, N3), pair_cong(N2, N3), link(N3, N4, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #data(Data), #node(N4), #hopc(Num).
pair_cong(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, Num1), hop_count(N2, N3, Num2), Num1 != 0, pair_cong(N1, N3), link(N3, N4, Dir), #node(N2), #hopc(Num1), #node(N1), #node(N3), #direction(Dir), #node(N4), #hopc(Num2).
pair_cong(N2, N3) :- -bad_node(N2), case(C, N2, Dir), C != 1, link(N1, N2, Dir), hop_count(N1, N2, H), H != 0, pair_cong(N1, N2), link(N2, N3, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3), #hopc(H), #case_num(C).
integrity(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, 0), hop_count(N2, N3, 0), sent_to(N1, N3, Data), sent_to(N2, N3, Data), link(N3, N4, Dir), #node(N1), #node(N2), #direction(Dir), #node(N3), #data(Data), #node(N4).
integrity(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), integrity(N1, N3), integrity(N2, N3), sent_to(N1, N3, Data), sent_to(N2, N3, Data), link(N3, N4, Dir), #node(N1), #node(N2), #direction(Dir), #node(N3), #data(Data), #node(N4).
omit(N1, N2) | -omit(N1, N2) :- bad_node(N1), link(N1, N2, Some0), #node(N2), #node(N1), #direction(Some0).
:- 0 > #count{0, N1, N2: omit(N1, N2), #node(N1), #node(N2)}.
:- 1 < #count{0, N1, N2: omit(N1, N2), #node(N1), #node(N2)}.
sent_to(N1, N2, good) | sent_to(N1, N2, bad(N1)) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N2), #node(N1), #direction(Dir).
id(N1, N2, N3) | -id(N1, N2, N3) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N2), #node(N1), #direction(Dir), #node(N3).
:- 1 < #count{0, N3: id(N1, N2, N3), #node(N3)}, is_node(N1), is_node(N2), #node(N1), #node(N2).
:- 1 > #count{0, N3: id(N1, N2, N3), #node(N3)}, is_node(N1), is_node(N2), #node(N1), #node(N2).
partner(N1, N2, N3) | -partner(N1, N2, N3) :- bad_node(N1), not_omit(N1, N2), link(N1, N2, Some0), #node(N2), #node(N1), #node(N3), #direction(Some0).
:- 1 < #count{0, N3: partner(N1, N2, N3), #node(N3)}, is_node(N1), is_node(N2), #node(N1), #node(N2).
:- 1 > #count{0, N3: partner(N1, N2, N3), #node(N3)}, is_node(N1), is_node(N2), #node(N1), #node(N2).
hop_count(N1, N2, H) | -hop_count(N1, N2, H) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N2), #node(N1), #hopc(H), #direction(Dir).
:- 1 > #count{0, H: hop_count(N1, N2, H), #hopc(H)}, is_node(N1), is_node(N2), #node(N1), #node(N2).
:- 1 < #count{0, H: hop_count(N1, N2, H), #hopc(H)}, is_node(N1), is_node(N2), #node(N1), #node(N2).
integrity(N1, N2) | -integrity(N1, N2) :- bad_node(N1), link(N1, N2, Dir), #node(N2), #node(N1), #direction(Dir).
pair_cong(N1, N2) | -pair_cong(N1, N2) :- bad_node(N1), link(N1, N2, Dir), #node(N2), #node(N1), #direction(Dir).
inline_accept(N3, Data, Dir) :- -sending(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), integrity(N1, N3), integrity(N2, N3), sent_to(N1, N3, Data), sent_to(N2, N3, Data), id(N1, N3, N4), partner(N2, N3, N4), id(N2, N3, N5), partner(N1, N3, N5), #node(N5), #node(N2), #node(N1), #direction(Dir), #node(N3), #data(Data), #node(N4).
inline_passed(N) :- inline_accept(N, Data, Dir), #direction(Dir), #node(N), #data(Data).
recon_qualify_hop(N1, N2, Dir) :- direct_link(N1, N2, Dir), id(N1, N2, N3), hop_count(N1, N2, H), H >= 2, not_discordant(N3, N2, Dir, (H + 1)), #node(N1), #node(N2), #hopc(H), #direction(Dir), #node(N3).
recon_qualify_hop(N1, N2, Dir) :- skip_link(N1, N2, Dir), id(N1, N2, N3), hop_count(N1, N2, H), H != 1, not_discordant(N3, N2, Dir, (H + 2)), #node(N1), #node(N2), #hopc(H), #direction(Dir), #node(N3).
recon_accept(N1, Data) :- -sending(N1), -inline_passed(N1), sent_to(N2, N1, Data), sent_to(N3, N1, Data), N2 != N3, recon_qualify_hop(N2, N1, Dir1), recon_qualify_hop(N3, N1, Dir2), Dir1 != Dir2, recon_case_met(N1, N2, N3), #node(N1), #node(N2), #direction(Dir2), #data(Data), #node(N3), #direction(Dir1).
recon_case_met(N1, N2, N3) :- id(N2, N1, N4), id(N3, N1, N5), partner(N2, N1, N5), partner(N3, N1, N4), adjusted_hop_sum(N1, N2, N3, 7), #node(N5), #node(N4), #node(N1), #node(N2), #node(N3).
recon_case_met(N1, N2, N3) :- id(N2, N1, N), id(N3, N1, N), pair_cong(N2, N1), hop_count(N2, N1, H), H > 1, adjusted_hop_sum(N1, N2, N3, 8), #node(N1), #node(N2), #hopc(H), #node(N3), #node(N).
recon_case_met(N1, N2, N3) :- id(N2, N1, N4), id(N3, N1, N5), partner(N2, N1, N5), partner(N3, N1, N4), pair_cong(N2, N1), hop_count(N2, N1, H), H > 1, adjusted_hop_sum(N1, N2, N3, 9), #node(N5), #node(N1), #node(N2), #node(N3), #node(N4), #hopc(H).
accepted(N, Data) :- inline_accept(N, Data, Some0), #node(N), #data(Data), #direction(Some0).
accepted(N, Data) :- recon_accept(N, Some0), #node(N), #data(Data), #direction(Some0).
bad_accepted :- -sending(N), accepted(N, Data), Data != good, #node(N), #data(Data).
good_not_accepted :- -sending(N), -accepted(N, good), #node(N).
bad :- bad_accepted.
bad_node(N) | -bad_node(N) :- #node(N).
:- 0 > #count{0, N: bad_node(N), #node(N)}.
:- 2 < #count{0, N: bad_node(N), #node(N)}.
-good_not_accepted :- not good_not_accepted.
-inline_passed(CWA0) :- not inline_passed(CWA0), #prog_termS(CWA0).
-hop_add(CWA0, CWA1, CWA2) :- not hop_add(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-not_omit(CWA0, CWA1) :- not not_omit(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-is_node(CWA0) :- not is_node(CWA0), #prog_termS(CWA0).
-skip_link(CWA0, CWA1, CWA2) :- not skip_link(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-recon_qualify_hop(CWA0, CWA1, CWA2) :- not recon_qualify_hop(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-recon_accept(CWA0, CWA1) :- not recon_accept(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-accepted(CWA0, CWA1) :- not accepted(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-bad_accepted :- not bad_accepted.
-discordant(CWA0, CWA1, CWA2, CWA3) :- not discordant(CWA0, CWA1, CWA2, CWA3), #prog_termS(CWA3), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-inline_accept(CWA0, CWA1, CWA2) :- not inline_accept(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-pair_cong(CWA0, CWA1) :- not pair_cong(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-bad :- not bad.
-v_hop(CWA0) :- not v_hop(CWA0), #prog_termS(CWA0).
-direct_link(CWA0, CWA1, CWA2) :- not direct_link(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-partner(CWA0, CWA1, CWA2) :- not partner(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-link(CWA0, CWA1, CWA2) :- not link(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-sending(CWA0) :- not sending(CWA0), #prog_termS(CWA0).
-adjusted_hop_sum(CWA0, CWA1, CWA2, CWA3) :- not adjusted_hop_sum(CWA0, CWA1, CWA2, CWA3), #prog_termS(CWA3), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-frame_sent(CWA0, CWA1) :- not frame_sent(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-not_discordant(CWA0, CWA1, CWA2, CWA3) :- not not_discordant(CWA0, CWA1, CWA2, CWA3), #prog_termS(CWA3), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-integrity(CWA0, CWA1) :- not integrity(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-omit(CWA0, CWA1) :- not omit(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-id(CWA0, CWA1, CWA2) :- not id(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-case(CWA0, CWA1, CWA2) :- not case(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-bad_node(CWA0) :- not bad_node(CWA0), #prog_termS(CWA0).
-hop_count(CWA0, CWA1, CWA2) :- not hop_count(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-sent_to(CWA0, CWA1, CWA2) :- not sent_to(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).
-recon_case_met(CWA0, CWA1, CWA2) :- not recon_case_met(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA0), #prog_termS(CWA1).

display

bad_accepted. discordant. v_hop. adjusted_hop_sum. direct_link. integrity. omit. id. recon_case_met. case. partner. link. hop_add. bad_node. is_node. skip_link. recon_qualify_hop. frame_sent. not_omit. inline_accept. not_discordant. hop_count. sending. sent_to. pair_cong. bad. good_not_accepted. recon_accept. accepted. inline_passed. 
