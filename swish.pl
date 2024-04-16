% Definición de la regla principal
bottles_of_beer :-
    bottles_of_beer(99). % Comenzamos con 99 botellas

% Caso base: no hay más botellas
bottles_of_beer(0) :-
    write('No more bottles of beer on the wall, no more bottles of beer.'), nl,
    write('Go to the store and buy some more, 99 bottles of beer on the wall.'), nl.

% Caso general: imprimir el verso correspondiente y llamar recursivamente con una botella menos
bottles_of_beer(N) :-
    N > 0,
    write(N), write(' bottle(s) of beer on the wall, '), write(N), write(' bottle(s) of beer.'), nl,
    write('Take one down and pass it around, '), Next is N - 1, write(Next), write(' bottle(s) of beer on the wall.'), nl,
    bottles_of_beer(Next).
