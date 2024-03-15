/*

insercion(+Lista, -R)
	es cierto si R unifica una lista que contiene
	los elementos de Lista ordenados de menor a mayor.
	
*/
ordena(elem, [], [elem]).
ordena(e, [Cab|Resto], [Cab|R2]) :- e > Cab, ordena(e, Resto, R2).

ordena(e, [Cab|Resto],[e, Cab|Resto]) :- e =< Cab.

insercion([], []).

insercion([Elem], [Elem]).

insercion([Cabe|Resto], R) :- insercion(Resto, R2), ordena(Cabe, R2, R).