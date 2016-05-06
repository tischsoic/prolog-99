flatten_list([], []) :- !.
flatten_list([H | T], Flattened) :-
    flatten_list(H, Flattened_head),
    flatten_list(T, Flattened_tail),
    merge_lists(Flattened_head, Flattened_tail, Flattened),
    !.
flatten_list(A, [A]) :- !.

merge_lists([], L, L).
merge_lists([H | T], L, [H | Merged_partly]) :-
    merge_lists(T, L, Merged_partly).
