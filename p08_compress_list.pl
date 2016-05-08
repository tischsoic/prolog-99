compress_list([], []).
compress_list([A], [A]).

compress_list([A, B | T], [A | Compressed_rest]) :-
    A \== B,
    compress_list([B | T], Compressed_rest).

compress_list([A, A | T], Compressed_rest) :-
    compress_list([A | T], Compressed_rest).
