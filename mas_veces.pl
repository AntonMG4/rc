/* 
	comprime -> recibe una lista y devuelve el numero de veces 
    que se repite el elemento respecto a sus vecinos
*/

% Caso Base
comprime([], []).
comprime([E], [(E, 1)]).

% Cuando el elemento es igual a su vecino
comprime([Cab, Cab|Resto], [(Cab,N2)|R]) :- comprime([Cab|Resto], [(Cab,N)|R]), N2 is N+1.

% Cuando el elemento es distinto de su vecino 
comprime([Cab1, Cab2|Resto], [(Cab1, 1)|R]) :- comprime([Cab2|Resto], R), Cab1 \= Cab2.

/* 
	mas_veces(+Lista, -Elem, -N)
	Elem unifica con el elemento que se repite mas veces en Lista y N es el numero
	de veces que se repite
*/

/*
	mayorN(+Lista, -Elem, -N)
	Elem unifica con el elemento que se repite mas veces en Lista y N es el numero
	de veces que se repite
*/

mayorN([(Cab, N)], Cab, N).
mayorN([(Cab, N2)|Resto], Cab, N2) :- mayorN(Resto, _, N), N2 >= N.
mayorN([(_, N2)|Resto], E, N) :- mayorN(Resto, E, N), N2 < N.


mas_veces(Lista, Elem, N) :- msort(Lista, Lord), comprime(Lord, R), mayorN(R, Elem, N).
