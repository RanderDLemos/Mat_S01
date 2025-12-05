forte_influencia(X) :-
    materia(X, C, _),
    C > 5,
    exige(A, X),
    exige(B, X),
    A \= B.
