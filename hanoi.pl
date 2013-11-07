% Author:
% Date: 2013-11-07


% ([1,2,8],[3,4,5],[6,7])

start(([1,2,3,4,5],[],[])).
finish(([],[],[1,2,3,4,5])).

% Move from left
route(([H|T], [Q|R], S), (T, [H,Q|R], S)) :- H < Q.
route(([H|T], S, [Q|R]), (T, S, [H,Q|R])) :- H < Q.
route(([H|T], [], S), (T, [H], S)).
route(([H|T], S, []), (T, S, [H])).

% Move from middle
route((A, [B|C], [D|E]), (A, C, [B,D|E])) :- B < D.
route(([D|E], [B|C], A), ([B,D|E], C, A)) :- B < D.
route(([], [H|T], S), ([H], T, S)).
route((S, [H|T], []), (S, T, [H])).

% Move from right
route((A, [B|C], [D|E]), (A, [D,B|C], E)) :- D < B.
route(([B|C], A, [D|E]), ([D,B|C], A, E)) :- D < B.
route(([], S, [H|T]), ([H], S, T)).
route((S, [], [H|T]), (S, [H], T)).

travelSafeLog(A, A, _, []).
travelSafeLog(A, C, Closed, [A-B|Steps]) :-
           route(A, B),
           not(member(B, Closed)),
           travelSafeLog(B, C, [B|Closed], Steps).



solve(Steps) :- start(A), finish(B), travelSafeLog(A, B, [], Steps).