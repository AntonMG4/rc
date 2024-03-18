/*

	qsort(+Lista, -R)
	es cierto si R unifica con una lista que contiene 
	los elementos de Lista ordenados de menor a mayor

	divide(+Pivote, +Lista, -Menores, -Mayores)
	
*/

divide(_, [], [], []).

divide(Elem, [Cab|Resto], [Cab|R1], R2) :- Cab=<Elem, divide(Elem, Resto, R1, R2).
divide(Elem, [Cab|Resto], R1, [Cab|R2]) :- Cab>Elem, divide(Elem, Resto, R1, R2).

qsort([], []).
qsort([Cab|Resto], ) :- divide(Cab, Resto, Men, May), qsort(Resto, R).