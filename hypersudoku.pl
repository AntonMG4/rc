:- use_module(library(clpfd)).

/*

sudoku(?Sudoku9x9)
  es cierto si Sudoku9x9 unifica con un
  sudoku 9x9 váldo.
  1. Los valores de la matriz Sudoku están 
     en el rango de 1 a 9.
  2. Todos los valores por columnas tienes que
     ser únicos.
  3. Todos los valores por filas tienes que
     ser únicos
  4. En la matriz se definen 9 bloques de tamaño 3x3
     tomando las 3 primeras filas consecutivas, obtendremos
	 los tres primeros bloques 3x3.
	 En cada uno de los 9 bloques del sudoku los valores
	 tienen que ser distintos.
  

*/

sudoku(Rows) :-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
		
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is), 
		length(L1, 3), length(L2, 3), append([[_], L1, [_], L2, [_]], Bs), append(L1, L2, BN),
		length(L3, 3), length(L4, 3), append([[_], L3, [_], L4, [_]], Cs), append(L3, L4, CN),
		length(L5, 3), length(L6, 3), append([[_], L5, [_], L6, [_]], Cs), append(L5, L6, DN),
		length(L3, 3), length(L4, 3), append([[_], L3, [_], L4, [_]], Cs), append(L3, L4, CN),
		length(L3, 3), length(L4, 3), append([[_], L3, [_], L4, [_]], Cs), append(L3, L4, CN),
		length(L3, 3), length(L4, 3), append([[_], L3, [_], L4, [_]], Cs), append(L3, L4, CN),
		/* Terminar */
		
		
		

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).
		
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).
		
