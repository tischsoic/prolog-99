% Given a run-length code list generated as specified in problem P11.
% Construct its uncompressed version.
% ?- example decode([[4,a],b,[2,c],[2,a],d,[4,e]],X).
% X = [a,a,a,a,b,c,c,a,a,d,e,e,e,e]
decode([], []).
decode([Encoded_H | Encoded_T], Decoded) :-
    expand(Encoded_H, Expanded_head),
    decode(Encoded_T, Decoded_T),
    append(Expanded_head, Decoded_T, Decoded).

expand([N, El], Expanded) :-
    repeat(N, El, Expanded),
    !.
expand(El, [El]).

repeat(0, _, []).
repeat(N, El, [El | List]) :-
    Next_repeat_N is N - 1,
    repeat(Next_repeat_N, El, List).


% Alternative solution
decode_([], []).
decode_([H | T], [H | Decoded_T]) :-
    \+ is_list(H),
    decode_(T, Decoded_T).
decode_([[1, El] | T], [El | Decoded_T]) :-
    decode_(T, Decoded_T).
decode_([[N, El] | T], [El | Decoded_Rest]) :-
    N > 1,
    N_decreased is N - 1,
    decode_([[N_decreased, El] | T], Decoded_Rest).
