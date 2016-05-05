last_but_one_element([], _) :- false.
last_but_one_element([_ | []], _) :- false.
last_but_one_element([LastButOne, _ | []], LastButOne) :- !.
last_but_one_element([_, Second | Tail], LastButOne) :-
    last_but_one_element([Second | Tail], LastButOne).
