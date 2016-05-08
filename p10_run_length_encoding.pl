encode([], []).
encode([H | T], [[Beginning_count, H] | Encoded_rest_of_list]) :-
    encode_only_beginning([H | T], Beginning_count, Rest_of_list),
    encode(Rest_of_list, Encoded_rest_of_list).


encode_only_beginning([], 0, []).
encode_only_beginning([_], 1, []).
encode_only_beginning([A, A | T], Total_count, Rest_of_list) :-
    encode_only_beginning([A | T], Count, Rest_of_list),
    Total_count is 1 + Count.
encode_only_beginning([A, B | T], 1, [B | T]) :-
    A \== B.


% Solution implemented using pack and length predicates

encode_([], []).
encode_(List, Encoded) :-
    pack(List, Packed_list),
    encode_packed(Packed_list, Encoded),
    !.

encode_packed([], []).
encode_packed([[H_Head | H_Tail] | T], [[N, H_Head] | Tail_encoded]) :-
    length([H_Head | H_Tail], N),
    encode_packed(T, Tail_encoded).
