last_element([], _) :- false.
last_element([Element | []], Element).
last_element([_ | Tail], Element) :-
    last_element(Tail, Element).
