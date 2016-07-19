% Rotate a list N places to the left.
% Examples:
% ?- rotate([a,b,c,d,e,f,g,h],3,X).
% X = [d,e,f,g,h,a,b,c]
%
% ?- rotate([a,b,c,d,e,f,g,h],-2,X).
% X = [g,h,a,b,c,d,e,f]
%
% Hint: Use the predefined predicates length/2 and append/3,
% as well as the result of problem P17.

:- [p17_split_a_list_into_two_parts].

rotate(List, Rotate_by, Rotated_list) :-
    length(List, List_length),
    simplified_rotation_number(Rotate_by, List_length, Simplified_rotate_by),
    split_position(Simplified_rotate_by, List_length, Split_position),
    split(List, Split_position, First_list, Second_list),
    append(Second_list, First_list, Rotated_list),
    !.

split_position(Simplified_rotate_by, _, Simplified_rotate_by) :-
    Simplified_rotate_by >= 0,
    !.
split_position(Simplified_rotate_by, List_length, Split_position) :-
    Simplified_rotate_by < 0,
    Split_position is List_length + Simplified_rotate_by,
    !.

simplified_rotation_number(_, 0, 0) :- !.
simplified_rotation_number(0, _, 0) :- !.
simplified_rotation_number(Rotate_by, List_length, Simplified_rotate_by) :-
    Rotate_by \== 0,
    List_length \== 0,
    Rotate_by_abs is abs(Rotate_by),
    Simplified_rotate_by_positive
        is Rotate_by_abs - div(Rotate_by_abs, List_length) * List_length,
    Simplified_rotate_by is sign(Rotate_by) * Simplified_rotate_by_positive.
