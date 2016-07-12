% Example:
% ?- dupli([a,b,c],3,X).
% X = [a,a,a,b,b,b,c,c,c]
%
% What are the results of the goal:
% ?- dupli(X,3,Y).

duplicate_extended([], _, []).
duplicate_extended([H | T], N, Duplicated) :-
    duplicate_one_elemnt(H, N, Duplicated_head),
    duplicate_extended(T, N, Duplicated_tail),
    merge(Duplicated_head, Duplicated_tail, Duplicated).

duplicate_one_elemnt(_, 0, []).
duplicate_one_elemnt(El, 1, [El]).
duplicate_one_elemnt(El, N, [El | Duplicated]) :-
    N > 1,
    N_2 is N - 1,
    duplicate_one_elemnt(El, N_2, Duplicated).
