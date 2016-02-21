
sorts

#node = 0..7.
#direction = {left, right}.
#data = {bad(6), bad(3), bad(5), bad(4), bad(2), bad(1), good, bad(0), bad(7)}.
#hopc = 0..10.
#case_num = 1..3.
#type_termS = #node + #direction + #data + #hopc + #case_num.
#rule_termS = {5, 0, bad(3), bad(5), 6, bad(6), 3, 8, 10, 1, bad(4), bad(1), left, 12, 2, bad(7), 11, 7, bad(2), good, bad(0), 9, 4, right}.
#prog_termS = #type_termS + #rule_termS.

predicates

recon_qualify_hop(#prog_termS, #prog_termS, #prog_termS). pair_cong(#prog_termS, #prog_termS). not_discordant(#prog_termS, #prog_termS, #prog_termS, #prog_termS). omit(#prog_termS, #prog_termS). frame_sent(#prog_termS, #prog_termS). direct_link(#prog_termS, #prog_termS, #prog_termS). bad_node(#prog_termS). inline_passed(#prog_termS). recon_case_met(#prog_termS, #prog_termS, #prog_termS). skip_link(#prog_termS, #prog_termS, #prog_termS). v_hop(#prog_termS). good_not_accepted(). partner(#prog_termS, #prog_termS, #prog_termS). bad_accepted(). hop_count(#prog_termS, #prog_termS, #prog_termS). adjusted_hop_sum(#prog_termS, #prog_termS, #prog_termS, #prog_termS). hop_add(#prog_termS, #prog_termS, #prog_termS). sent_to(#prog_termS, #prog_termS, #prog_termS). link(#prog_termS, #prog_termS, #prog_termS). bad(). accepted(#prog_termS, #prog_termS). integrity(#prog_termS, #prog_termS). recon_accept(#prog_termS, #prog_termS). is_node(#prog_termS). sending(#prog_termS). case(#prog_termS, #prog_termS, #prog_termS). id(#prog_termS, #prog_termS, #prog_termS). inline_accept(#prog_termS, #prog_termS, #prog_termS). 

rules

is_node(N) :- #node(N).
v_hop(N) :- #hopc(N).
not_discordant(N1, N2, right, H) :- N2 > N1, (N2 - N1) = H, #hopc(H), #node(N1), #node(N2).
not_discordant(N1, N2, right, H) :- N2 < N1, ((N2 + 8) - N1) = H, #hopc(H), #node(N1), #node(N2).
not_discordant(N1, N2, left, H) :- N2 < N1, (N1 - N2) = H, #hopc(H), #node(N1), #node(N2).
not_discordant(N1, N2, left, H) :- N2 > N1, ((N1 + 8) - N2) = H, #hopc(H), #node(N1), #node(N2).
frame_sent(N1, N2) :- sent_to(N1, N2, Some0), #node(N1), #node(N2), #data(Some0).
hop_add(N1, N2, 1) :- direct_link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
hop_add(N1, N2, 2) :- skip_link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
adjusted_hop_sum(N1, N2, N3, Num) :- hop_count(N2, N1, H1), hop_count(N3, N1, H2), hop_add(N2, N1, H3), hop_add(N3, N1, H4), (((H1 + H2) + H3) + H4) = Num, #node(N2), #hopc(Num), #node(N3), #hopc(H4), #node(N1), #hopc(H2), #hopc(H3), #hopc(H1).
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
id(N1, N2, N1) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
partner(N1, N2, N3) :- sending(N1), sending(N3), N1 != N3, -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0), #node(N3).
sent_to(N1, N2, good) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
hop_count(N1, N2, 0) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
integrity(N1, N2) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
pair_cong(N1, N2) :- sending(N1), -bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
case(1, N1, Dir) :- -sending(N1), sent_to(N2, N1, Data1), sent_to(N3, N1, Data2), skip_link(N2, N1, Dir), direct_link(N3, N1, Dir), hop_count(N2, N1, H), H != 1, id(N2, N1, N4), not_discordant(N4, N1, Dir, (H + 2)), #hopc(H), #node(N2), #node(N3), #data(Data2), #node(N1), #direction(Dir), #node(N4), #data(Data1).
case(2, N1, Dir) :- -sending(N1), sent_to(N2, N1, Data), direct_link(N2, N1, Dir), skip_link(N3, N1, Dir), -frame_sent(N3, N1), hop_count(N2, N1, H), H >= 2, id(N2, N1, N4), not_discordant(N4, N1, Dir, (H + 1)), #hopc(H), #node(N2), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4).
case(3, N1, Dir) :- -sending(N1), sent_to(N2, N1, Data), skip_link(N2, N1, Dir), direct_link(N3, N1, Dir), -frame_sent(N3, N1), hop_count(N2, N1, H), H != 1, id(N2, N1, N4), not_discordant(N4, N1, Dir, (H + 2)), #hopc(H), #node(N2), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4).
sent_to(N2, N3, Data) :- sent_to(N1, N2, Data), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N3), #node(N1), #case_num(C), #data(Data), #direction(Dir).
sent_to(N2, N3, Data) :- sent_to(N1, N2, Data), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N1), #node(N2), #data(Data), #direction(Dir), #node(N3).
id(N2, N3, ID) :- id(N1, N2, ID), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N3), #node(N1), #case_num(C), #direction(Dir), #node(ID).
id(N2, N3, ID) :- id(N1, N2, ID), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N1), #node(N2), #direction(Dir), #node(ID), #node(N3).
partner(N2, N3, ID) :- partner(N1, N2, ID), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N3), #node(N1), #case_num(C), #direction(Dir), #node(ID).
partner(N2, N3, ID) :- partner(N1, N2, ID), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N1), #node(N2), #direction(Dir), #node(ID), #node(N3).
hop_count(N2, N3, (Count + 2)) :- hop_count(N1, N2, Count), -bad_node(N2), case(C, N2, Dir), C != 2, skip_link(N1, N2, Dir), link(N2, N3, Dir), #node(N2), #node(N3), #hopc(Count), #node(N1), #case_num(C), #direction(Dir).
hop_count(N2, N3, (Count + 1)) :- hop_count(N1, N2, Count), -bad_node(N2), case(2, N2, Dir), direct_link(N1, N2, Dir), link(N2, N3, Dir), #node(N1), #node(N2), #direction(Dir), #node(N3), #hopc(Count).
pair_cong(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, 0), hop_count(N2, N3, 0), sent_to(N1, N3, Data), sent_to(N2, N3, Data), integrity(N1, N3), integrity(N2, N3), link(N3, N4, Dir), #node(N2), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4).
pair_cong(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, 0), hop_count(N2, N3, Num), Num < 0, sent_to(N1, N3, Data), sent_to(N2, N3, Data), integrity(N1, N3), integrity(N2, N3), pair_cong(N2, N3), link(N3, N4, Dir), #node(N2), #hopc(Num), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4).
pair_cong(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, Num1), hop_count(N2, N3, Num2), Num1 != 0, pair_cong(N1, N3), link(N3, N4, Dir), #node(N2), #node(N3), #hopc(Num2), #node(N1), #hopc(Num1), #direction(Dir), #node(N4).
pair_cong(N2, N3) :- -bad_node(N2), case(C, N2, Dir), C != 1, link(N1, N2, Dir), hop_count(N1, N2, H), H != 0, pair_cong(N1, N2), link(N2, N3, Dir), #hopc(H), #node(N2), #node(N3), #node(N1), #case_num(C), #direction(Dir).
integrity(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), hop_count(N1, N3, 0), hop_count(N2, N3, 0), sent_to(N1, N3, Data), sent_to(N2, N3, Data), link(N3, N4, Dir), #node(N2), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4).
integrity(N3, N4) :- -bad_node(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), case(1, N3, Dir), integrity(N1, N3), integrity(N2, N3), sent_to(N1, N3, Data), sent_to(N2, N3, Data), link(N3, N4, Dir), #node(N2), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4).
omit(N1, N2) | -omit(N1, N2) :- bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
:- 0 > #count{0: omit(N1, N2)}, bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
:- 1 < #count{0: omit(N1, N2)}, bad_node(N1), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
sent_to(N1, N2, good) | sent_to(N1, N2, bad(N1)) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
id(N1, N2, N3) | -id(N1, N2, N3) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir), #node(N3).
:- 1 > #count{0, N3: id(N1, N2, N3), #node(N3)}, bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
:- 1 < #count{0, N3: id(N1, N2, N3), #node(N3)}, bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
partner(N1, N2, N3) | -partner(N1, N2, N3) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0), #node(N3).
:- 1 > #count{0, N3: partner(N1, N2, N3), #node(N3)}, bad_node(N1), -omit(N1, N2), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
:- 1 < #count{0, N3: partner(N1, N2, N3), #node(N3)}, bad_node(N1), -omit(N1, N2), link(N1, N2, Some0), #node(N1), #node(N2), #direction(Some0).
hop_count(N1, N2, H) | -hop_count(N1, N2, H) :- bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #hopc(H), #node(N1), #node(N2), #direction(Dir).
:- 1 > #count{0, H: hop_count(N1, N2, H), #hopc(H)}, bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
:- 1 < #count{0, H: hop_count(N1, N2, H), #hopc(H)}, bad_node(N1), -omit(N1, N2), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
integrity(N1, N2) | -integrity(N1, N2) :- bad_node(N1), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
pair_cong(N1, N2) | -pair_cong(N1, N2) :- bad_node(N1), link(N1, N2, Dir), #node(N1), #node(N2), #direction(Dir).
inline_accept(N3, Data, Dir) :- -sending(N3), skip_link(N1, N3, Dir), direct_link(N2, N3, Dir), integrity(N1, N3), integrity(N2, N3), sent_to(N1, N3, Data), sent_to(N2, N3, Data), id(N1, N3, N4), partner(N2, N3, N4), id(N2, N3, N5), partner(N1, N3, N5), #node(N2), #node(N3), #node(N1), #direction(Dir), #data(Data), #node(N4), #node(N5).
inline_passed(N) :- inline_accept(N, Data, Dir), #direction(Dir), #data(Data), #node(N).
recon_qualify_hop(N1, N2, Dir) :- direct_link(N1, N2, Dir), id(N1, N2, N3), hop_count(N1, N2, H), H >= 2, not_discordant(N3, N2, Dir, (H + 1)), #hopc(H), #node(N1), #node(N2), #direction(Dir), #node(N3).
recon_qualify_hop(N1, N2, Dir) :- skip_link(N1, N2, Dir), id(N1, N2, N3), hop_count(N1, N2, H), H != 1, not_discordant(N3, N2, Dir, (H + 2)), #hopc(H), #node(N1), #node(N2), #direction(Dir), #node(N3).
recon_accept(N1, Data) :- -sending(N1), -inline_passed(N1), sent_to(N2, N1, Data), sent_to(N3, N1, Data), N2 != N3, recon_qualify_hop(N2, N1, Dir1), recon_qualify_hop(N3, N1, Dir2), Dir1 != Dir2, recon_case_met(N1, N2, N3), #node(N2), #direction(Dir1), #node(N3), #node(N1), #direction(Dir2), #data(Data).
recon_case_met(N1, N2, N3) :- id(N2, N1, N4), id(N3, N1, N5), partner(N2, N1, N5), partner(N3, N1, N4), adjusted_hop_sum(N1, N2, N3, 7), #node(N1), #node(N2), #node(N5), #node(N4), #node(N3).
recon_case_met(N1, N2, N3) :- id(N2, N1, N), id(N3, N1, N), pair_cong(N2, N1), hop_count(N2, N1, H), H > 1, adjusted_hop_sum(N1, N2, N3, 8), #hopc(H), #node(N1), #node(N2), #node(N3), #node(N).
recon_case_met(N1, N2, N3) :- id(N2, N1, N4), id(N3, N1, N5), partner(N2, N1, N5), partner(N3, N1, N4), pair_cong(N2, N1), hop_count(N2, N1, H), H > 1, adjusted_hop_sum(N1, N2, N3, 9), #hopc(H), #node(N2), #node(N3), #node(N1), #node(N5), #node(N4).
accepted(N, Data) :- inline_accept(N, Data, Some0), #data(Data), #direction(Some0), #node(N).
accepted(N, Data) :- recon_accept(N, Some0), #data(Data), #direction(Some0), #node(N).
bad_accepted :- -sending(N), accepted(N, Data), Data != good, #data(Data), #node(N).
good_not_accepted :- -sending(N), -accepted(N, good), #node(N).
bad :- bad_accepted.
bad_node(N) | -bad_node(N) :- #node(N).
:- 0 > #count{0, N: bad_node(N), #node(N)}.
:- 2 < #count{0, N: bad_node(N), #node(N)}.
:- 1 > #count{0: bad}.
:- 1 < #count{0: bad}.
-inline_passed(CWA0) :- not inline_passed(CWA0), #prog_termS(CWA0).
-bad :- not bad.
-good_not_accepted :- not good_not_accepted.
-recon_accept(CWA0, CWA1) :- not recon_accept(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-integrity(CWA0, CWA1) :- not integrity(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-bad_accepted :- not bad_accepted.
-is_node(CWA0) :- not is_node(CWA0), #prog_termS(CWA0).
-sending(CWA0) :- not sending(CWA0), #prog_termS(CWA0).
-recon_qualify_hop(CWA0, CWA1, CWA2) :- not recon_qualify_hop(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-hop_count(CWA0, CWA1, CWA2) :- not hop_count(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-v_hop(CWA0) :- not v_hop(CWA0), #prog_termS(CWA0).
-recon_case_met(CWA0, CWA1, CWA2) :- not recon_case_met(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-frame_sent(CWA0, CWA1) :- not frame_sent(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-inline_accept(CWA0, CWA1, CWA2) :- not inline_accept(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-not_discordant(CWA0, CWA1, CWA2, CWA3) :- not not_discordant(CWA0, CWA1, CWA2, CWA3), #prog_termS(CWA3), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-omit(CWA0, CWA1) :- not omit(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-direct_link(CWA0, CWA1, CWA2) :- not direct_link(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-sent_to(CWA0, CWA1, CWA2) :- not sent_to(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-id(CWA0, CWA1, CWA2) :- not id(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-pair_cong(CWA0, CWA1) :- not pair_cong(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-skip_link(CWA0, CWA1, CWA2) :- not skip_link(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-bad_node(CWA0) :- not bad_node(CWA0), #prog_termS(CWA0).
-adjusted_hop_sum(CWA0, CWA1, CWA2, CWA3) :- not adjusted_hop_sum(CWA0, CWA1, CWA2, CWA3), #prog_termS(CWA3), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-link(CWA0, CWA1, CWA2) :- not link(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-partner(CWA0, CWA1, CWA2) :- not partner(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-hop_add(CWA0, CWA1, CWA2) :- not hop_add(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).
-accepted(CWA0, CWA1) :- not accepted(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-case(CWA0, CWA1, CWA2) :- not case(CWA0, CWA1, CWA2), #prog_termS(CWA2), #prog_termS(CWA1), #prog_termS(CWA0).

display

recon_qualify_hop. pair_cong. not_discordant. omit. frame_sent. direct_link. bad_node. inline_passed. recon_case_met. skip_link. v_hop. good_not_accepted. partner. bad_accepted. hop_count. adjusted_hop_sum. hop_add. sent_to. link. bad. accepted. integrity. recon_accept. is_node. sending. case. id. inline_accept. 
