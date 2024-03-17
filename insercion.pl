/*

insercion(+Lista, -R)
	es cierto si R unifica una lista que contiene
	los elementos de Lista ordenados de menor a mayor.
	
*/
ordena(Elem, [], [Elem]).

ordena(Elem, [Cab|Resto], [Cab|R2]) :- 
Elem > Cab, ordena(Elem, Resto, R2).

ordena(Elem, [Cab|Resto],[Elem, Cab|Resto]) :-
Elem =< Cab.

insercion([], []).
insercion([Elem], [Elem]).

insercion([Cabe|Resto], R) :- 
insercion(Resto, R2), ordena(Cabe, R2, R).
