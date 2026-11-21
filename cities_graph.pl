edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').

edge('Tabuk', 'Taif').

edge('Riyadh', 'Dammam').

edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').

edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').

travel(From, To, Path) :-
    go(From, To, [From], ReversedPath),
    reverse(ReversedPath, Path).

go(To, To, Visited, Visited).

go(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    go(Next, To, [Next|Visited], Path).

% ===== RESULTS =====

% 102 ?- travel('Dammam', 'Madinah', P).
% P = ['Dammam', 'Qatif', 'Madinah'] ;
% false.

% 103 ?- travel('Riyadh', 'Makkah', P).
% P = ['Riyadh', 'Dammam', 'Qatif', 'Madinah', 'Makkah'] ;
% false.

% 104 ?- travel('Makkah', 'Riyadh', P).
% P = ['Makkah', 'Madinah', 'Taif', 'Dammam', 'Riyadh'] ;
% P = ['Makkah', 'Madinah', 'Tabuk', 'Taif', 'Dammam', 'Riyadh'] ;
% P = ['Makkah', 'Riyadh'] ;
% false.

% 105 ?- travel('Makkah', 'Madinah', P).
% P = ['Makkah', 'Madinah'] ;
% P = ['Makkah', 'Riyadh', 'Dammam', 'Qatif', 'Madinah'] ;
% false.
