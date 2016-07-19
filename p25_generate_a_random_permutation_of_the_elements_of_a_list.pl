% Generate a random permutation of the elements of a list.
% Example:
% ?- rnd_permu([a,b,c,d,e,f],L).
% L = [b,a,d,c,e,f]
%
% Hint: Use the solution of problem P23.

% rnd_select(List, To_select, Full_random_selection_list)
:- [p23_extract_a_given_number_of_randomly_selected_elements_from_a_list].

rnd_permu(List, Permuted_list) :-
    length(List, List_length),
    rnd_select(List, List_length, Permuted_list).
