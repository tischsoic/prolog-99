% Insert an element at a given position into a list.
% Example:
% ?- insert_at(alfa,[a,b,c,d],2,L).
% L = [a,alfa,b,c,d]

insert_at(El, List, 1, List_with_inserted_el) :-
    List_with_inserted_el = [El | List].
insert_at(El, [H | T], Position, List_with_inserted_el) :-
    Position > 1,
    Position_next is Position - 1,
    insert_at(El, T, Position_next, Tail_with_inserted_el),
    List_with_inserted_el = [H | Tail_with_inserted_el].
