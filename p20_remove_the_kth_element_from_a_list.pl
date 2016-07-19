% Remove the K'th element from a list.
% Example:
% ?- remove_at(X,[a,b,c,d],2,R).
% X = b
% R = [a,c,d]

remove_at(Removed_el, [H | T], 1, List_with_removed_el) :-
    Removed_el = H,
    List_with_removed_el = T.
remove_at(Removed_el, [_ | T], Position, List_with_removed_el) :-
    Position > 1,
    Position_next is Position - 1,
    remove_at(Removed_el, T, Position_next, List_with_removed_el).
