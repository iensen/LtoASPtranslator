node = {1..n}.

n = 5.
k = 2.
0 <= |{removed(node N)}| <= k-1.
edge(node X, node Y) if X%n = (Y + 1)%n.
edge(node X, node Y) if X%n = (Y + 2)%n.
maybe removed(node N).

reachable(node X, X) if not removed(X).
reachable(node X,node Y) if edge(X,Y), not removed(X), not removed(Y).
reachable(node X,node Y) if reachable(X,some node Z), 
                            reachable(Z,Y),
                            not removed(X),
                            not removed(Y),
                            not removed(Z).


disconnected if not reachable(some node X, some node Y),
                not removed(X),
                not removed(Y).


1<=|{disconnected}|<=1.
