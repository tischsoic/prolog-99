add_element_to_list_end(E, [], [E]) :- !.
add_element_to_list_end(E, [H | T], [H | List_with_element]) :-
    add_element_to_list_end(E, T, List_with_element).
