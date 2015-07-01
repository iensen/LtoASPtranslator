
1<=|{disconnected}|<=1.
const n = 5.
type node = {1..n}.
const k = 2.
0 <= |{removed(node N)}| <= k-1.
edge(node X, node Y) if X%n = (Y + 1)%n.
edge(node X, node Y) if X%n = (Y + 2)%n.
maybe removed(node N).

reachable(node X, X) if not removed(X).
reachable(node X,node Y) if edge(X,Y)
and not removed(X)
and not removed(Y).
reachable(node X,node Y) if reachable(X,some node Z)
and reachable(Z,Y)
and not removed(X)
and not removed(Y)
and not removed(Z).
disconnected if
not reachable(some node X, some node Y)
and not removed(X)
and not removed(Y).

