% Author:
% Date: 2013-10-18

append([],A,A).
append([H|T],A,[H|R]) :- append(T,A,R).

a([H|T]) :- a([H|T],H).
a([],_).
a([H|T],Prev) :- H >= Prev, a(T,H).

b(X,X) :- a(X).
b(X,Y) :- append(A,[H1,H2|B],X), H1 > H2, append(A,[H2,H1|B],X1), b(X1,Y).

len2([], Acc, Acc).
len2([_|T], Acc, R) :- B is Acc + 1, len2(T, B, R).

len2(List, R) :- len2(List, 0, R).


take([H|T], H, T).
take([H|T], R, [H|S]) :- take(T, R, S).
