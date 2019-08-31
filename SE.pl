:- consult('./DB.pl').

:- dynamic(respuestas/1).

problema(imp_sin_elec):-
    busca_pregunta_no(imp_con_elec), !.

problema(imp_sin_inter):-
    busca_pregunta_si(wifi),
    busca_pregunta_no(imp_con_inter), !.

problema(eje):-
    busca_pregunta_si(wifi), !.

busca_pregunta_no(PC):-
    respuestas(L),
    buscar_respondido(PC, R, L), !,
    consultar_aux(no, R).

busca_pregunta_no(PC):-
    pregunta(PC, P),
    consultar_no(PC, P).

busca_pregunta_si(PC):-
    respuestas(L),
    buscar_respondido(PC, R, L), !,
    consultar_aux(si, R).

busca_pregunta_si(PC):-
    pregunta(PC, P),
    consultar_si(PC, P).

consultar_no(PC, P):-
    write(P), nl,
    read(R), nl,
    respuestas(L),
    concatenar(L, [PC, R], NL),
    retractall(respuestas(_)),
    assert(respuestas(NL)),
    consultar_aux(no, R).

consultar_si(PC, P):-
    write(P), nl,
    read(R), nl,
    respuestas(L),
    concatenar(L, [PC, R], NL),
    retractall(respuestas(_)),
    assert(respuestas(NL)),
    consultar_aux(si, R).

consultar_aux(R, R).

solucionador():-
    write('Responda solamente con un si. o no. a las siguientes preguntas:'), nl,
    retractall(respuestas(_)),
    assert(respuestas([])),
    problema(P),
    respuesta(P, R),
    write(R), nl,
    retract(respuestas(_)).

concatenar([], L, L).
concatenar([X|C1], L2, [X|C2]):-
    concatenar(C1, L2, C2).

buscar_respondido(P, R, [P, R|_]).
buscar_respondido(P, R, [_|C]):-
    buscar_respondido(P, R, C).





