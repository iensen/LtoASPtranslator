
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts

#node = 
	0..7.

#direction = 
	{left, right}.

#data = 
	{bad(3), bad(4), bad(7), bad(0), bad(5), bad(1), good, bad(2), bad(6)}.

#hopc = 
	0..10.

#case_num = 
	1..3.

#types = 
	#node + 
	#direction + 
	#data + 
	#hopc + 
	#case_num.

#rule_gterms = 
	{1, bad(3), bad(4), bad(3), 8, 2, bad(0), bad(0), bad(1), left, good, bad(6), 3, bad(7), bad(6), right, bad(1), bad(7), 6, bad(5), bad(4), bad(5), 5, bad(2), 0, 8, 7, 4, bad(2)}.

#universal = 
	#types + 
	#rule_gterms.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates

partner(#universal, #universal, #universal).
adjusted_hop_sum(#universal, #universal, #universal, #universal).
v_hop(#universal).
sent_to(#universal, #universal, #universal).
hop_add(#universal, #universal, #universal).
good_not_accepted().
bad_node(#universal).
pair_cong(#universal, #universal).
recon_qualify_hop(#universal, #universal, #universal).
skip_link(#universal, #universal, #universal).
is_node(#universal).
link(#universal, #universal, #universal).
recon_case_met(#universal, #universal, #universal).
bad_accepted().
recon_accept(#universal, #universal).
hop_count(#universal, #universal, #universal).
inline_accept(#universal, #universal, #universal).
bad().
case(#universal, #universal, #universal).
inline_passed(#universal).
not_discordant(#universal, #universal, #universal, #universal).
omit(#universal, #universal).
direct_link(#universal, #universal, #universal).
frame_sent(#universal, #universal).
integrity(#universal, #universal).
sending(#universal).
id(#universal, #universal, #universal).
discordant(#universal, #universal, #universal, #universal).
not_omit(#universal, #universal).
accepted(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules

-link(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not link(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-id(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not id(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-bad_node(CWA_Var0) :-
	not bad_node(CWA_Var0),
	#universal(CWA_Var0).

-inline_passed(CWA_Var0) :-
	not inline_passed(CWA_Var0),
	#universal(CWA_Var0).

-frame_sent(CWA_Var0, CWA_Var1) :-
	not frame_sent(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-v_hop(CWA_Var0) :-
	not v_hop(CWA_Var0),
	#universal(CWA_Var0).

-skip_link(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not skip_link(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-adjusted_hop_sum(CWA_Var0, CWA_Var1, CWA_Var2, CWA_Var3) :-
	not adjusted_hop_sum(CWA_Var0, CWA_Var1, CWA_Var2, CWA_Var3),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2),
	#universal(CWA_Var3).

-bad_accepted :-
	not bad_accepted.

-not_omit(CWA_Var0, CWA_Var1) :-
	not not_omit(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-recon_case_met(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not recon_case_met(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-bad :-
	not bad.

-omit(CWA_Var0, CWA_Var1) :-
	not omit(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-sending(CWA_Var0) :-
	not sending(CWA_Var0),
	#universal(CWA_Var0).

-accepted(CWA_Var0, CWA_Var1) :-
	not accepted(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-good_not_accepted :-
	not good_not_accepted.

-hop_count(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not hop_count(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-inline_accept(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not inline_accept(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-not_discordant(CWA_Var0, CWA_Var1, CWA_Var2, CWA_Var3) :-
	not not_discordant(CWA_Var0, CWA_Var1, CWA_Var2, CWA_Var3),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2),
	#universal(CWA_Var3).

-discordant(CWA_Var0, CWA_Var1, CWA_Var2, CWA_Var3) :-
	not discordant(CWA_Var0, CWA_Var1, CWA_Var2, CWA_Var3),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2),
	#universal(CWA_Var3).

-sent_to(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not sent_to(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-integrity(CWA_Var0, CWA_Var1) :-
	not integrity(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-partner(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not partner(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-recon_qualify_hop(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not recon_qualify_hop(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-direct_link(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not direct_link(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-is_node(CWA_Var0) :-
	not is_node(CWA_Var0),
	#universal(CWA_Var0).

-case(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not case(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-recon_accept(CWA_Var0, CWA_Var1) :-
	not recon_accept(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-hop_add(CWA_Var0, CWA_Var1, CWA_Var2) :-
	not hop_add(CWA_Var0, CWA_Var1, CWA_Var2),
	#universal(CWA_Var0),
	#universal(CWA_Var1),
	#universal(CWA_Var2).

-pair_cong(CWA_Var0, CWA_Var1) :-
	not pair_cong(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

is_node(N) :-
	#node(N).

v_hop(N) :-
	#hopc(N).

not_discordant(N1, N2, right, H) :-
	N2 > N1,
	(N2 - N1) = H,
	#node(N1).

not_discordant(N1, N2, right, H) :-
	N2 < N1,
	((N2 + 8) - N1) = H.

not_discordant(N1, N2, left, H) :-
	N2 < N1,
	(N1 - N2) = H.

not_discordant(N1, N2, left, H) :-
	N2 > N1,
	((N1 + 8) - N2) = H.

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(7)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(2)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(0)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(5)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(4)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(1)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, good),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(3)),
	#node(N1),
	#node(N2).

frame_sent(N1, N2) :-
	sent_to(N1, N2, bad(6)),
	#node(N1),
	#node(N2).

hop_add(N1, N2, 1) :-
	direct_link(N1, N2, right),
	#node(N1),
	#node(N2).

hop_add(N1, N2, 1) :-
	direct_link(N1, N2, left),
	#node(N1),
	#node(N2).

hop_add(N1, N2, 2) :-
	skip_link(N1, N2, right),
	#node(N1),
	#node(N2).

hop_add(N1, N2, 2) :-
	skip_link(N1, N2, left),
	#node(N1),
	#node(N2).

adjusted_hop_sum(N1, N2, N3, Num) :-
	hop_count(N2, N1, H1),
	hop_count(N3, N1, H2),
	hop_add(N2, N1, H3),
	hop_add(N3, N1, H4),
	(((H1 + H2) + H3) + H4) = Num,
	#node(N1),
	#node(N2),
	#node(N3),
	#hopc(Num),
	#hopc(H1),
	#hopc(H2),
	#hopc(H3),
	#hopc(H4).

direct_link(N1, N2, right) :-
	N2 = (N1 + 1),
	#node(N1),
	#node(N2).

direct_link((8 - 1), 0, right).

skip_link(N1, N2, right) :-
	N2 = (N1 + 2),
	#node(N1),
	#node(N2).

skip_link((8 - 2), 0, right).

skip_link((8 - 1), 1, right).

direct_link(N1, N2, left) :-
	direct_link(N2, N1, right),
	#node(N1),
	#node(N2).

skip_link(N1, N2, left) :-
	skip_link(N2, N1, right),
	#node(N1),
	#node(N2).

link(N1, N2, Dir) :-
	direct_link(N1, N2, right),
	#node(N1),
	#node(N2),
	#direction(Dir).

link(N1, N2, Dir) :-
	direct_link(N1, N2, left),
	#node(N1),
	#node(N2),
	#direction(Dir).

link(N1, N2, Dir) :-
	skip_link(N1, N2, right),
	#node(N1),
	#node(N2),
	#direction(Dir).

link(N1, N2, Dir) :-
	skip_link(N1, N2, left),
	#node(N1),
	#node(N2),
	#direction(Dir).

sending(0).

sending(1).

id(N1, N2, N1) :-
	link(N1, N2, right),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2),
	#node(N1).

id(N1, N2, N1) :-
	link(N1, N2, left),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2),
	#node(N1).

partner(N1, N2, N3) :-
	link(N1, N2, right),
	sending(N1),
	sending(N3),
	N1 != N3,
	-bad_node(N1),
	#node(N1),
	#node(N2),
	#node(N3).

partner(N1, N2, N3) :-
	link(N1, N2, left),
	sending(N1),
	sending(N3),
	N1 != N3,
	-bad_node(N1),
	#node(N1),
	#node(N2),
	#node(N3).

sent_to(N1, N2, good) :-
	link(N1, N2, right),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

sent_to(N1, N2, good) :-
	link(N1, N2, left),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

hop_count(N1, N2, 0) :-
	link(N1, N2, right),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

hop_count(N1, N2, 0) :-
	link(N1, N2, left),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

integrity(N1, N2) :-
	link(N1, N2, right),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

integrity(N1, N2) :-
	link(N1, N2, left),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

pair_cong(N1, N2) :-
	link(N1, N2, right),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

pair_cong(N1, N2) :-
	link(N1, N2, left),
	sending(N1),
	-bad_node(N1),
	#node(N1),
	#node(N2).

case(1, N1, Dir) :-
	-sending(N1),
	sent_to(N2, N1, Data1),
	sent_to(N3, N1, Data2),
	skip_link(N2, N1, Dir),
	direct_link(N3, N1, Dir),
	hop_count(N2, N1, H),
	H != 1,
	id(N2, N1, N4),
	-discordant(N4, N1, Dir, (H + 2)),
	#node(N1),
	#direction(Dir),
	#node(N2),
	#data(Data1),
	#node(N3),
	#data(Data2),
	#hopc(H),
	#node(N4).

case(2, N1, Dir) :-
	-sending(N1),
	sent_to(N2, N1, Data),
	direct_link(N2, N1, Dir),
	skip_link(N3, N1, Dir),
	-frame_sent(N3, N1),
	hop_count(N2, N1, H),
	H >= 2,
	id(N2, N1, N4),
	-discordant(N4, N1, Dir, (H + 1)),
	#node(N1),
	#direction(Dir),
	#node(N2),
	#data(Data),
	#node(N3),
	#hopc(H),
	#node(N4).

case(3, N1, Dir) :-
	-sending(N1),
	sent_to(N2, N1, Data),
	skip_link(N2, N1, Dir),
	direct_link(N3, N1, Dir),
	-frame_sent(N3, N1),
	hop_count(N2, N1, H),
	H != 1,
	id(N2, N1, N4),
	-discordant(N4, N1, Dir, (H + 2)),
	#node(N1),
	#direction(Dir),
	#node(N2),
	#data(Data),
	#node(N3),
	#hopc(H),
	#node(N4).

sent_to(N2, N3, Data) :-
	sent_to(N1, N2, Data),
	-bad_node(N2),
	case(C, N2, Dir),
	C != 2,
	skip_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#data(Data),
	#node(N1),
	#direction(Dir).

sent_to(N2, N3, Data) :-
	sent_to(N1, N2, Data),
	-bad_node(N2),
	case(2, N2, Dir),
	direct_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#data(Data),
	#node(N1),
	#direction(Dir).

id(N2, N3, ID) :-
	id(N1, N2, ID),
	-bad_node(N2),
	case(C, N2, Dir),
	C != 2,
	skip_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#node(ID),
	#node(N1),
	#direction(Dir).

id(N2, N3, ID) :-
	id(N1, N2, ID),
	-bad_node(N2),
	case(2, N2, Dir),
	direct_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#node(ID),
	#node(N1),
	#direction(Dir).

partner(N2, N3, ID) :-
	partner(N1, N2, ID),
	-bad_node(N2),
	case(C, N2, Dir),
	C != 2,
	skip_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#node(ID),
	#node(N1),
	#direction(Dir).

partner(N2, N3, ID) :-
	partner(N1, N2, ID),
	-bad_node(N2),
	case(2, N2, Dir),
	direct_link(N1, N2, Dir),
	link(N2, N3, Dir).

hop_count(N2, N3, Count) :-
	hop_count(N1, N2, (Count - 2)),
	-bad_node(N2),
	case(C, N2, Dir),
	C != 2,
	skip_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#hopc(Count),
	#node(N2),
	#case_num(C),
	#direction(Dir).

hop_count(N2, N3, Count) :-
	hop_count(N1, N2, (Count - 1)),
	-bad_node(N2),
	case(2, N2, Dir),
	direct_link(N1, N2, Dir),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#hopc(Count),
	#node(N1),
	#direction(Dir).

pair_cong(N3, N4) :-
	-bad_node(N3),
	skip_link(N1, N3, Dir),
	direct_link(N2, N3, Dir),
	case(1, N3, Dir),
	hop_count(N1, N3, 0),
	hop_count(N2, N3, 0),
	sent_to(N1, N3, Data),
	sent_to(N2, N3, Data),
	integrity(N1, N3),
	integrity(N2, N3),
	link(N3, N4, Dir),
	#node(N3),
	#node(N4),
	#node(N1),
	#direction(Dir),
	#data(Data).

pair_cong(N3, N4) :-
	-bad_node(N3),
	skip_link(N1, N3, Dir),
	direct_link(N2, N3, Dir),
	case(1, N3, Dir),
	hop_count(N1, N3, 0),
	hop_count(N2, N3, Num),
	Num < 0,
	sent_to(N1, N3, Data),
	sent_to(N2, N3, Data),
	integrity(N1, N3),
	integrity(N2, N3),
	pair_cong(N2, N3),
	link(N3, N4, Dir),
	#node(N3),
	#node(N4),
	#node(N1),
	#direction(Dir),
	#node(N2),
	#hopc(Num).

pair_cong(N3, N4) :-
	-bad_node(N3),
	skip_link(N1, N3, Dir),
	direct_link(N2, N3, Dir),
	case(1, N3, Dir),
	hop_count(N1, N3, Num1),
	hop_count(N2, N3, Num2),
	Num1 != 0,
	pair_cong(N1, N3),
	link(N3, N4, Dir),
	#node(N3),
	#node(N4),
	#node(N1),
	#direction(Dir),
	#node(N2),
	#hopc(Num1),
	#hopc(Num2).

pair_cong(N2, N3) :-
	-bad_node(N2),
	case(C, N2, Dir),
	C != 1,
	link(N1, N2, Dir),
	hop_count(N1, N2, H),
	H != 0,
	pair_cong(N1, N2),
	link(N2, N3, Dir),
	#node(N2),
	#node(N3),
	#case_num(C),
	#direction(Dir),
	#node(N1),
	#hopc(H).

integrity(N3, N4) :-
	-bad_node(N3),
	skip_link(N1, N3, Dir),
	direct_link(N2, N3, Dir),
	case(1, N3, Dir),
	hop_count(N1, N3, 0),
	hop_count(N2, N3, 0),
	sent_to(N1, N3, Data),
	sent_to(N2, N3, Data),
	link(N3, N4, Dir),
	#node(N3),
	#node(N4),
	#node(N1),
	#direction(Dir),
	#node(N2),
	#data(Data).

integrity(N3, N4) :-
	-bad_node(N3),
	skip_link(N1, N3, Dir),
	direct_link(N2, N3, Dir),
	case(1, N3, Dir),
	integrity(N1, N3),
	integrity(N2, N3),
	sent_to(N1, N3, Data),
	sent_to(N2, N3, Data),
	link(N3, N4, Dir),
	#node(N3),
	#node(N4),
	#node(N1),
	#direction(Dir),
	#node(N2).

omit(N1, N2) |
-omit(N1, N2) :-
	link(N1, N2, right),
	bad_node(N1),
	#node(N1),
	#node(N2).

omit(N1, N2) |
-omit(N1, N2) :-
	link(N1, N2, left),
	bad_node(N1),
	#node(N1),
	#node(N2).

:-	0 > #count{0, N2, N1: omit(N1, N2)}.

:-	1 < #count{0, N2, N1: omit(N1, N2)}.

sent_to(N1, N2, good) |
sent_to(N1, N2, bad(N1)) :-
	bad_node(N1),
	-omit(N1, N2),
	link(N1, N2, Dir),
	#node(N1),
	#node(N2),
	#direction(Dir).

id(N1, N2, N3) |
-id(N1, N2, N3) :-
	bad_node(N1),
	-omit(N1, N2),
	link(N1, N2, Dir),
	#node(N1),
	#node(N2),
	#node(N3),
	#direction(Dir).

:-	1 > #count{0, N3: id(N1, N2, N3), #node(N1), #node(N2), #node(N3)},
	is_node(N1),
	is_node(N2).

:-	1 < #count{0, N3: id(N1, N2, N3), #node(N1), #node(N2), #node(N3)},
	is_node(N1),
	is_node(N2).

partner(N1, N2, N3) |
-partner(N1, N2, N3) :-
	link(N1, N2, right),
	bad_node(N1),
	not_omit(N1, N2),
	#node(N1),
	#node(N2),
	#node(N3).

partner(N1, N2, N3) |
-partner(N1, N2, N3) :-
	link(N1, N2, left),
	bad_node(N1),
	not_omit(N1, N2),
	#node(N1),
	#node(N2),
	#node(N3).

:-	1 > #count{0, N3: partner(N1, N2, N3), #node(N1), #node(N2), #node(N3)},
	is_node(N1),
	is_node(N2).

:-	1 < #count{0, N3: partner(N1, N2, N3), #node(N1), #node(N2), #node(N3)},
	is_node(N1),
	is_node(N2).

hop_count(N1, N2, H) |
-hop_count(N1, N2, H) :-
	bad_node(N1),
	-omit(N1, N2),
	link(N1, N2, Dir),
	#node(N1),
	#node(N2),
	#hopc(H),
	#direction(Dir).

:-	1 > #count{0, H: hop_count(N1, N2, H), #node(N1), #node(N2), #hopc(H)},
	is_node(N1),
	is_node(N2).

:-	1 < #count{0, H: hop_count(N1, N2, H), #node(N1), #node(N2), #hopc(H)},
	is_node(N1),
	is_node(N2).

integrity(N1, N2) |
-integrity(N1, N2) :-
	bad_node(N1),
	link(N1, N2, Dir),
	#node(N1),
	#node(N2),
	#direction(Dir).

pair_cong(N1, N2) |
-pair_cong(N1, N2) :-
	bad_node(N1),
	link(N1, N2, Dir),
	#node(N1),
	#node(N2),
	#direction(Dir).

inline_accept(N3, Data, Dir) :-
	-sending(N3),
	skip_link(N1, N3, Dir),
	direct_link(N2, N3, Dir),
	integrity(N1, N3),
	integrity(N2, N3),
	sent_to(N1, N3, Data),
	sent_to(N2, N3, Data),
	id(N1, N3, N4),
	partner(N2, N3, N4),
	id(N2, N3, N5),
	partner(N1, N3, N5),
	#node(N3),
	#data(Data),
	#direction(Dir),
	#node(N1),
	#node(N2),
	#data(Data),
	#node(N4),
	#node(N5).

inline_passed(N) :-
	inline_accept(N, Data, Dir),
	#node(N),
	#data(Data),
	#direction(Dir).

recon_qualify_hop(N1, N2, Dir) :-
	direct_link(N1, N2, Dir),
	id(N1, N2, N3),
	hop_count(N1, N2, H),
	H >= 2,
	not_discordant(N3, N2, Dir, (H + 1)),
	#node(N1),
	#node(N2),
	#direction(Dir),
	#node(N3),
	#hopc(H).

recon_qualify_hop(N1, N2, Dir) :-
	skip_link(N1, N2, Dir),
	id(N1, N2, N3),
	hop_count(N1, N2, H),
	H != 1,
	not_discordant(N3, N2, Dir, (H + 2)),
	#node(N1),
	#node(N2),
	#direction(Dir),
	#node(N3),
	#hopc(H).

recon_accept(N1, Data) :-
	-sending(N1),
	-inline_passed(N1),
	sent_to(N2, N1, Data),
	sent_to(N3, N1, Data),
	N2 != N3,
	recon_qualify_hop(N2, N1, Dir1),
	recon_qualify_hop(N3, N1, Dir2),
	Dir1 != Dir2,
	recon_case_met(N1, N2, N3),
	#node(N1),
	#data(Data),
	#node(N2),
	#node(N3),
	#direction(Dir1),
	#direction(Dir2).

recon_case_met(N1, N2, N3) :-
	id(N2, N1, N4),
	id(N3, N1, N5),
	partner(N2, N1, N5),
	partner(N3, N1, N4),
	adjusted_hop_sum(N1, N2, N3, (8 - 1)),
	#node(N1),
	#node(N2),
	#node(N3),
	#node(N4),
	#node(N5).

recon_case_met(N1, N2, N3) :-
	id(N2, N1, N),
	id(N3, N1, N),
	pair_cong(N2, N1),
	hop_count(N2, N1, H),
	H > 1,
	adjusted_hop_sum(N1, N2, N3, 8),
	#node(N1),
	#node(N2),
	#node(N3),
	#node(N),
	#hopc(H).

recon_case_met(N1, N2, N3) :-
	id(N2, N1, N4),
	id(N3, N1, N5),
	partner(N2, N1, N5),
	partner(N3, N1, N4),
	pair_cong(N2, N1),
	hop_count(N2, N1, H),
	H > 1,
	adjusted_hop_sum(N1, N2, N3, (8 + 1)),
	#node(N1),
	#node(N2),
	#node(N3),
	#node(N4),
	#node(N5),
	#hopc(H).

accepted(N, Data) :-
	inline_accept(N, Data, left),
	#node(N),
	#data(Data).

accepted(N, Data) :-
	inline_accept(N, Data, right),
	#node(N),
	#data(Data).

accepted(N, Data) :-
	recon_accept(N, right),
	#node(N),
	#data(Data).

accepted(N, Data) :-
	recon_accept(N, left),
	#node(N),
	#data(Data).

bad_accepted :-
	-sending(N),
	accepted(N, Data),
	Data != good,
	#node(N),
	#data(Data).

good_not_accepted :-
	-sending(N),
	-accepted(N, good),
	#node(N).

bad :-
	bad_accepted.

bad_node(N) |
-bad_node(N) :-
	#node(N).

:-	0 > #count{0, N: bad_node(N), #node(N)}.

:-	2 < #count{0, N: bad_node(N), #node(N)}.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display

partner.
adjusted_hop_sum.
v_hop.
sent_to.
hop_add.
good_not_accepted.
bad_node.
pair_cong.
recon_qualify_hop.
skip_link.
is_node.
link.
recon_case_met.
bad_accepted.
recon_accept.
hop_count.
inline_accept.
bad.
case.
inline_passed.
not_discordant.
omit.
direct_link.
frame_sent.
integrity.
sending.
id.
discordant.
not_omit.
accepted.

