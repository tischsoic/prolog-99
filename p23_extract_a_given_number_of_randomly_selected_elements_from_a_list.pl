% Extract a given number of randomly selected elements from a list.
% The selected items shall be put into a result list.
% Example:
% ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
% L = [e,d,a]
%
% Hint: Use the built-in random number generator random/2
% and the result of problem P20.

:- [p20_remove_the_kth_element_from_a_list].

rnd_select(_, 0, []).
rnd_select(List, To_select, Full_random_selection_list) :-
    To_select > 0,
    To_select_next is To_select - 1,
    length(List, List_length),
    random(1, List_length, Random_list_position),
    remove_at(Randomly_selected_el, List, Random_list_position, _),
    rnd_select(List, To_select_next, Random_selection_list),
    Full_random_selection_list = [Randomly_selected_el | Random_selection_list].
