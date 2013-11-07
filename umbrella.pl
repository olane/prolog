% Author: Oli Lane
% Date: 2013-11-07

%  Solution to the Umbrella puzzle (number 2) here: http://www.puzz.com/classic.html

% (h, c, h, c, c) means Andy is in the house, Brenda in the car, Carl in the house and Dana in the car, and the umbrella is in the car (in that order)
% Use solve(S, 17). to find solutions.

% Route(A, B, T) means we can get from A to B in time T

route((c,c,A,B,c), (h,h,A,B,h), 2).
route((c,A,c,B,c), (h,A,h,B,h), 5).
route((c,A,B,c,c), (h,A,B,h,h), 10).
route((A,c,c,B,c), (A,h,h,B,h), 5).
route((A,c,B,c,c), (A,h,B,h,h), 10).
route((A,B,c,c,c), (A,B,h,h,h), 10).

route((c,A,B,C,c), (h,A,B,C,h), 1).
route((A,c,B,C,c), (A,h,B,C,h), 2).
route((A,B,c,C,c), (A,B,h,C,h), 5).
route((A,B,C,c,c), (A,B,C,h,h), 10).

route((h,A,B,C,h), (c,A,B,C,c), 1).
route((A,h,B,C,h), (A,c,B,C,c), 2).
route((A,B,h,C,h), (A,B,c,C,c), 5).
route((A,B,C,h,h), (A,B,C,c,c), 10).



start((c,c,c,c,c)).
finish((h,h,h,h,_)).

travelSafeLog(A, A, _, [], 0).
travelSafeLog(A, C, Closed, [A-B|Steps], Time) :-
           route(A, B, T),
           not(member(B, Closed)),
           travelSafeLog(B, C, [B|Closed], Steps, R),
           Time is T + R.



solve(Steps, Time) :- start(A), finish(B), travelSafeLog(A, B, [], Steps, Time).