list_length(0, []).
list_length(Length, [_ |T]) :-
    list_length(Tail_length, T),
    Length is Tail_length + 1.
