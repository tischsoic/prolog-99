% Example:
% ?- dupli([a,b,c,c,d],X).
% X = [a,a,b,b,c,c,c,c,d,d]

duplicate([], []).
duplicate([H | T], [H, H | Duplicated_tail]) :-
    duplicate(T, Duplicated_tail).
