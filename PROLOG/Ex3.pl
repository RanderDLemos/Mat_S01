expert_area(Aluno) :-
    completou(Aluno, X),
    materia(X, _, comp),
    completou(Aluno, Y),
    materia(Y, _, comp),
    X \= Y.

fraqueza_mat(Aluno) :-
    \+ (completou(Aluno, Z),
        materia(Z, _, mat)).
