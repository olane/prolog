% Author:
% Date: 2013-10-21

take([H|T], H, T).
take([H|T], R, [H|S]) :- take(T, R, S).

perm([],[]).
perm(L,[H|T]) :- take(L,H,R), perm(R,T).


% dutch flag

flag(In, Out) :- perm(In, Out), checkColours(Out).

checkColours(L) :- checkRed(L).

checkRed([red|T]) :- checkRed(T).
checkRed(L) :- checkWhite(L).

checkWhite([white|T]) :- checkWhite(T).
checkWhite(L) :- checkBlue(L).

checkBlue([blue|T]) :- checkBlue(T).
checkBlue([]).