
bin2gen(a(N, nil, nil), a(N, [])).

bin2gen(a(Cab, HI, HD), R):- bin2gen(HI, R2), bin2gen(HD, R3), R = a(Cab, [R2, R3]).