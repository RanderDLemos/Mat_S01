topo(M) :-
    materia(M, _, _),
    \+ exige(M, _).

folha(M) :-
    materia(M, _, _),
    \+ exige(_, M).
