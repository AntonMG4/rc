/*

balanceado(+ArbolBinario) 
cierto si la diferencia de altura entre el subarbol izq y el dcho 
de todo nodo es como maximo 1 en valor absoluto

*/

altura(nil, 0).

altura(a(_, HI, HD), Altura2):- altura(HI, AltI), altura(HD, AltD),  Altura is max(AltI, AltD), Altura2 is Altura + 1.


balanceado(a(_,HI,HD)):- altura(HI, AI), altura(HD, AD), Dif is AI - AD, 1 =< abs(Dif), balanceado(HI), balanceado(HD).