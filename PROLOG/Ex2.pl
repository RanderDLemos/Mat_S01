nao_finalizou(Aluno, Modulo) :-
    exige(_, Modulo),
    \+ completou(Aluno, Modulo).

liberado(Aluno, Modulo) :-
    materia(Modulo, _, Grupo),
    Grupo \= base,
    \+ (exige(Modulo, Req),
        \+ completou(Aluno, Req)).
