type1	=	{0,1}.
type2	=	(a,b).

pred0.

pred1(type1 X).
pred1(type2 X) if pred0.

pred2(type1 X, type2 Y).