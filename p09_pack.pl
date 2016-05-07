pack([], []).
pack([A], [[A]]).

pack([A, A | T], [[A | Packed_head] | Packed_tail]) :-
    pack([A | T], [Packed_head | Packed_tail]).

pack([A, B | T], [[A] | Packed_without_first]) :-
    A \== B,
    pack([B | T], Packed_without_first).
