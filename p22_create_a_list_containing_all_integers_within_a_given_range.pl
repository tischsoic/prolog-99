% Create a list containing all integers within a given range.
% Example:
% ?- range(4,9,L).
% L = [4,5,6,7,8,9]

range(Start, End, Range_as_list) :-
    Start == End,
    Range_as_list = [Start],
    !.
range(Start, End, Range_as_list) :-
    Start < End,
    Start_next is Start + 1,
    range(Start_next, End, Part_of_range),
    Range_as_list = [Start | Part_of_range],
    !.

% Simplified solution:
range_(R, R, [R]).
range_(Start, End, [Start | Part_of_range]) :-
    Start < End,
    Start_next is Start + 1,
    range(Start_next, End, Part_of_range).
