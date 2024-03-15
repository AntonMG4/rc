/*

comprime(+Lista, -Resultado)
 es cierto si Resultado unifica con una lista 
 de la siguiente forma
 
 ? comprime([a,a,a,b,b,c,c,a], R).
 R = [(a,3), (b,2), (c,2), (a,1)].
 
 Variantes:
 V1:
 ? comprime([a,a,a,b,b,c,c,a], R).
 R = [(a,3), (b,2), (c,2), a].
 
 V2:
 ? comprime([a,a,a,b,b,c,c,a], R).
 R = [a-3, b-2, c-2, a-1].

*/

% Caso base
comprime([], []).

% Caso si solo hay uno
comprime([Elem], [(Elem, 1)]).

% Caso recursivo cuando son iguales
comprime([Cab|Resto], [(Cab,N2)|R]) :- 
	comprime(Resto, [(Cab,N)|R]), N2 is N+1.

% Caso recursivo cuando son distintos
comprime([Cab|Resto], [(Cab,1),(CabR,N)|R]) :- 
	comprime(Resto, [(CabR,N)|R]), Cab \= CabR.