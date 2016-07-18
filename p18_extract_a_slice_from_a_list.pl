% Extract a slice from a list.
% Given two indices, I and K, the slice is the list containing
% the elements between the I'th and K'th element of the original
% list (both limits included). Start counting the elements with 1.
%
% Example:
% ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
% X = [c,d,e,f,g]

slice([_ | T], Left_bound, Right_bound, Sliced_list) :-
    Left_bound > 1,
    Left_bound_next is Left_bound - 1,
    Right_bound_next is Right_bound - 1,
    slice(T, Left_bound_next, Right_bound_next, Sliced_list).
slice([H | T], 1, Right_bound, Sliced_list) :-
    Right_bound > 1,
    Right_bound_next is Right_bound - 1,
    slice(T, 1, Right_bound_next, Sliced_list_rest),
    Sliced_list = [H | Sliced_list_rest].
slice([H | _], 1, 1, [H]) .
