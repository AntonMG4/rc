/*---------------------------------------------------
 primos_xy(+X, +Y, -ListaR)
   es cierto cuando ListaR unifica con una lista
   que contiene a los primos que van desde X hasta
  Y ambos incluidos en orden ascendente.
  
  primos_xy(1, 9, R)
  R = [1,2,3,5,7]
---------------------------------------------------*/


/*
  lista_divisores(+N, +Rango, -Lista)
    es cierto si Lista unifica con los divisores de N que
	van desde 1 hasta Rango [1,Rango]. Y es un número entre 1 y N.
	
  lista_divisores(8, 8, R).
  R=[1, 2, 4, 8]
	
*/

lista_divisores(_, 1, [1]).

lista_divisores(N, Y, [Y|R]) :- Y > 1, Y2 is Y-1, 0 is (N mod Y),
 lista_divisores(N, Y2, R).
 
lista_divisores(N, Y, R) :- Y > 1, Y2 is Y-1, M is (N mod Y),
 M \= 0,  lista_divisores(N, Y2, R).

/* 
primos_xy(Elem, Elem, [Elem]) :- lista_divisores(Elem, Elem, [Elem, 1]).
primos_xy(Elem, Elem, []) :- R \= [Elem, 1], lista_divisores(Elem, Elem, R).
 */
 
primos_xy(X, Y, []) :- X>Y.
primos_xy(X, Y, [Y|R]) :- X=<Y, Y2 is Y-1, lista_divisores(Y, Y, [_, _]), primos_xy(X, Y2, R).
primos_xy(X, Y, R) :- X=<Y, Y2 is Y-1, C \= [_,_], lista_divisores(Y, Y, C), primos_xy(X, Y2, R).