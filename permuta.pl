
permuta([], []).
permuta([Cab|Resto], R2) :- permuta(Resto, R), append(L1, L2, R), append(L1, [Cab|L2], R2).