% Example:
% ?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [[4,a],b,[2,c],[2,a],d,[4,e]]
%
% Solution should be direct, that is implemented
% without other predicates

encode_direct([], []).
encode_direct([H_list_to_encode | T_list_to_encode], Encoded_list) :-
    count_beginning([H_list_to_encode | T_list_to_encode], Count_beginning, Rest_to_encode),
    format_encoding(H_list_to_encode, Count_beginning, Encoded_begining_formated),
    encode_direct(Rest_to_encode, Encoded_rest),
    Encoded_list = [Encoded_begining_formated | Encoded_rest].

% Supportive predicate encoding only beginning of list

format_encoding(First_element, 1, First_element).
format_encoding(First_element, Count_altogether, Formated_encoding) :-
    Count_altogether \== 1,
    Formated_encoding = [Count_altogether, First_element].

count_beginning([X], 1, []).
count_beginning([X, X | T], Count_altogether, Rest_to_encode) :-
    count_beginning([X | T], Rest_count, Rest_to_encode),
    Count_altogether is Rest_count + 1.
count_beginning([X, Y | T], 1, [Y | T]) :-
    X \== Y.
