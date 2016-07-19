% Lotto: Draw N different random numbers from the set 1..M.
% The selected numbers shall be put into a result list.
% Example:
% ?- rnd_select(6,49,L).
% L = [23,1,17,33,21,37]
%
% Hint: Combine the solutions of problems P22 and P23.

% range(Start, End, Range_as_list)
:- [p22_create_a_list_containing_all_integers_within_a_given_range].
% rnd_select(List, To_select, Full_random_selection_list)
:- [p23_extract_a_given_number_of_randomly_selected_elements_from_a_list].

% rnd_select_lotto(Number_of_numbers, Maximum_number, List_of_numbers)
rnd_select_lotto(Number_of_numbers, Maximum_number, List_of_numbers) :-
    Number_of_numbers >= 0,
    Maximum_number >= 1,
    range(1, Maximum_number, Possible_numbers),
    rnd_select(Possible_numbers, Number_of_numbers, List_of_numbers).
