% Example:
% ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
% X = [a,b,d,e,g,h,k]

drop_nth(List, Nth_base, Formated_list) :-
    drop_nth_proper(List, Nth_base, Nth_base, Formated_list).

drop_nth_proper([], _, _, []).
drop_nth_proper([H | T], Nth_base, Nth_actual, Formated_list) :-
    Nth_actual == 1,
    drop_nth_proper(T, Nth_base, Nth_base, Formated_list_tail),
    Formated_list = Formated_list_tail.
drop_nth_proper([H | T], Nth_base, Nth_actual, Formated_list) :-
    Nth_actual > 1,
    Nth_actual_next is Nth_actual - 1,
    drop_nth_proper(T, Nth_base, Nth_actual_next, Formated_list_tail),
    Formated_list = [H | Formated_list_tail].


% take_k()
%
% drop_k([], _, []).
% drop_k([H_list | T_list], Number_of_elements_to_drop, List_with_droped_elements) :-
%     Number_of_elements_to_drop == 1,
%     List_with_droped_elements = T_list.
% drop_k([H_list | T_list], Number_of_elements_to_drop, List_with_droped_elements) :-
%     Number_of_elements_to_drop > 1,
%     Number_of_elements_to_drop_in_next_step is Number_of_elements_to_drop - 1,
%     drop_k(T_list, Number_of_elements_to_drop_in_next_step, List_with_droped_elements)
