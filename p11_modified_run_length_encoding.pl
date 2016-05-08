encode_modified(List, Encoded) :-
    pack(List, Packed),
    encode_modified_for_packed_list(Packed, Encoded).

encode_modified_for_packed_list([], []).
encode_modified_for_packed_list(
    [[Head_of_head | Tail_of_head] | T],
    [Encoded_head | Encoded_tail]
) :-
    length([Head_of_head | Tail_of_head], N),
    format(Head_of_head, N, Encoded_head),
    encode_modified_for_packed_list(T, Encoded_tail).

format(E, 1, E) :- !.
format(E, Length, [Length, E]) :-
    Length \== 1.


% Implemented using original encode predicate

encode_modified_(List, Encoded_modified) :-
    encode(List, Encoded),
    modify(Encoded, Encoded_modified).

modify([], []).
modify([[1, El] | T], [El | Encoded_modified_tail]) :-
    modify(T, Encoded_modified_tail).
modify([[N, El] | T], [[N, El] | Encoded_modified_tail]) :-
    N > 1,
    modify(T, Encoded_modified_tail).
