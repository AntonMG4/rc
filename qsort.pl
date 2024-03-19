/*

	qsort(+Lista, -R)
	es cierto si R unifica con una lista que contiene 
	los elementos de Lista ordenados de menor a mayor

	divide(+Pivote, +Lista, -Menores, -Mayores)
	es cierto si Menores unifica con una lista que contiene
	los elementos de Lista menores que el Pivote y Mayores
	los elementos mayores que el Pivote
	
*/

divide(_, [], [], []).

divide(Elem, [Cab|Resto], [Cab|R1], R2) :- Cab =< Elem, divide(Elem, Resto, R1, R2).
divide(Elem, [Cab|Resto], R1, [Cab|R2]) :- Cab > Elem, divide(Elem, Resto, R1, R2).

qsort([], []).
qsort([Elem],[Elem]).
qsort([Cab|Resto], R2) :- divide(Cab, Resto, Men, May), append(Menores, [Cab|Mayores], R2), 
qsort(Men, Menores), qsort(May, Mayores).
