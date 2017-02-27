% Generate the combinations of K distinct objects chosen
% from the N elements of a list
% In how many ways can a committee of 3 be chosen
% from a group of 12 people? We all know that there
% are C(12,3) = 220 possibilities (C(N,K) denotes
% the well-known binomial coefficients). For pure mathematicians,
% this result may be great. But we want to really generate all
% the possibilities (via backtracking).
%
% Example:
% ?- combination(3,[a,b,c,d,e,f],L).
% L = [a,b,c] ;
% L = [a,b,d] ;
% L = [a,b,e] ;
% ....



combination(0, _, []).
combination(Elements_no, List, [One_combination_head | One_combination_tail]) :-
    Elements_no > 0,
    Elements_no_next is Elements_no - 1,
    in_list_combination_special(One_combination_head, List, Modified_list),
    combination(Elements_no_next, Modified_list, One_combination_tail).

in_list_combination_special(H, [H | T], T).
in_list_combination_special(El, [_   | T], Remainder) :-
    in_list_combination_special(El, T, Remainder).
