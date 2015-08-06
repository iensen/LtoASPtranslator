sorts 

#ground_terms = {g(1, f(2)), a, f(2), h(1, f(2), f(g(3))), f(a), f(g(a)), 1}. 

predicates 

q(#ground_terms, #ground_terms, #ground_terms, #ground_terms). 
p(#ground_terms). 

rules 

p(a). p(f(a)). p(f(g(a))). 
q(1, f(2), g(1, f(2)), h(1, f(2), f(g(3)))). 
