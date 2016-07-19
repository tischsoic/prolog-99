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
    split_position(Rotate_by, List_length, Split_position),
    split(List, Split_position, First_list, Second_list),
    append(Second_list, First_list, Rotated_list),
    !.

split_position(_, 0, 0) :- !.
split_position(Rotate_by, List_length, Split_position) :-
    List_length \== 0,
    Split_position is (Rotate_by mod List_length),
    !.
