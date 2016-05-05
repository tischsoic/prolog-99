reverse_list(List, Reversed_list) :-
    reverse_list_with_accumulator(List, [], Reversed_list).

reverse_list_with_accumulator([], Reversed_list, Reversed_list) :- !.
reverse_list_with_accumulator([H | T], Acc, Reversed_list) :-
    reverse_list_with_accumulator(T, [H | Acc], Reversed_list).
