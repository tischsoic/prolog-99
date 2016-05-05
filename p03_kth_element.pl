kth_element(H, [H | _], 1) :- !.
kth_element(Kth, [_ | Tail], K) :-
    K > 1,
    K_lower is K - 1,
    kth_element(Kth, Tail, K_lower).
