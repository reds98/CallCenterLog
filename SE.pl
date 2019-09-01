:- consult('./DB.pl').

:- dynamic(respuestas/1).

causas():-
    write('Hay varias causas que pueden ocasionar que su impresora no funcione:'), nl,
    causa(C),
    write(C), nl,
    fail.

problema(imp_sin_elec):-
    busca_pregunta_no(imp_con_elec), !.

problema(no_drivers):-
    busca_pregunta_si(prim_vez),
    busca_pregunta_no(drivers), !.

problema(imp_sin_inter):-
    busca_pregunta_si(wifi),
    busca_pregunta_no(imp_con_inter), !.

problema(sin_tinta):-
    busca_pregunta_no(tinta), !.

problema(mal_cable):-
    busca_pregunta_no(cable), !.

problema(componente_malo):-
    busca_pregunta_si(liquido),
    busca_pregunta_si(imp_con_elec),
    busca_pregunta_no(enciende), !.

problema(sucia):-
    busca_pregunta_si(sonido),
    busca_pregunta_no(polvo), !.

problema(cambio_papel):-
    busca_pregunta_si(sonido),
    busca_pregunta_no(papel), !.

problema(sucia):-
    busca_pregunta_si(imp_borrosa),
    busca_pregunta_no(polvo), !.

problema(sin_resp).

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
    write(R), nl.

concatenar([], L, L).
concatenar([X|C1], L2, [X|C2]):-
    concatenar(C1, L2, C2).

buscar_respondido(P, R, [P, R|_]).
buscar_respondido(P, R, [_|C]):-
    buscar_respondido(P, R, C).





