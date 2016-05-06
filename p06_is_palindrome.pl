is_palindrome(List) :-
    reverse_list_(List, List), !.

reverse_list_(List, Reversed_list) :-
    reverse_list_with_accumulator_(List, [], Reversed_list).

reverse_list_with_accumulator_([A], Acc, [A | Acc]).
reverse_list_with_accumulator_([H | T], Acc, Reversed_list) :-
    reverse_list_with_accumulator_(T, [H | Acc], Reversed_list).
