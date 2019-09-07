:- consult('./SE.pl').
/*

'########:::::'###:::::'######::'########:
 ##.... ##:::'## ##:::'##... ##: ##.....::
 ##:::: ##::'##:. ##:: ##:::..:: ##:::::::
 ########::'##:::. ##:. ######:: ######:::
 ##.... ##: #########::..... ##: ##...::::
 ##:::: ##: ##.... ##:'##::: ##: ##:::::::
 ########:: ##:::: ##:. ######:: ########:
........:::..:::::..:::......:::........::

'########::'########:
 ##.... ##: ##.....::
 ##:::: ##: ##:::::::
 ##:::: ##: ######:::
 ##:::: ##: ##...::::
 ##:::: ##: ##:::::::
 ########:: ########:
........:::........::

'########:::::'###::::'########::'#######:::'######::
 ##.... ##:::'## ##:::... ##..::'##.... ##:'##... ##:
 ##:::: ##::'##:. ##::::: ##:::: ##:::: ##: ##:::..::
 ##:::: ##:'##:::. ##:::: ##:::: ##:::: ##:. ######::
 ##:::: ##: #########:::: ##:::: ##:::: ##::..... ##:
 ##:::: ##: ##.... ##:::: ##:::: ##:::: ##:'##::: ##:
 ########:: ##:::: ##:::: ##::::. #######::. ######::
........:::..:::::..:::::..::::::.......::::......:::

*/
%Estos son los pronombres que posee la base de datos
pronombre_interrogativo([como]).
pronombre_interrogativo([donde]).
pronombre_interrogativo([por-que]).
pronombre_interrogativo([que]).
pronombre_interrogativo([cuales]).
pronombre_interrogativo([cual]).

%Estos son los Articulos que posee la base de datos
articulo(singular,masculino,[el]).
articulo(plural,masculino,[los]).
articulo(singular,femenino,[la]).
articulo(plural,femenino,[las]).
articulo(singular,femenino,[mi]).
articulo(singular,masculino,[mi]).

%Estas son los saludos  que posee la base de datos
saludo([hola]).
saludo([buenas]).

%Estas son los despedidas que posee la base de datos
despedidas([muchas,gracias]).
despedidas([hasta,luego]).
despedidas([adios]).
despedidas([gracias]).

%Estas son los sustantivos que posee la base de datos
sustantivo(singular,masculino,[callcenterlog]).
sustantivo(plural,femenino,[causas]).
sustantivo(plural,femenino,[razones]).
sustantivo(singular,masculino,[problematica]).
sustantivo(singular,femenino,[referencia]).
sustantivo(singular,femenino,[impresora]).
sustantivo(singular,masculino,[problema]).
sustantivo(singular,masculino,[error]).

%Estas son los verbos que posee la base de datos
verbo(singular,[come]).
verbo(plural,[son]).
verbo(singular,[este]).
verbo(singular,[esta]).
verbo(singular,[es]).
verbo(singular,[comen]).

%Estos son los adjetivo que posee la base de datos
adjetivo(singular,masculino,[electricidad]).
adjetivo(singular,masculino,[drivers]).
adjetivo(singular,masculino,[internet]).
adjetivo(singular,masculino,[tinta]).
adjetivo(singular,masculino,[cable]).
adjetivo(singular,masculino,[componente]).
adjetivo(singular,fememino,[sucia]).
adjetivo(singular,masculino,[papel]).
adjetivo(singular,masculino,[desalineado]).
adjetivo(singular,masculino,[mensaje]).
adjetivo(singular,masculino,[alarmas]).
adjetivo(singular,masculino,[malo]).
adjetivo(singular,femenino,[mala]).
adjetivo(plural,masculino,[malos]).
adjetivo(singular,femenino,[mala]).
adjetivo(singular,femenino,[rota]).
adjetivo(singular,masculino,[roto]).
adjetivo(singular,femenino,[corrupta]).
adjetivo(singular,femenino,[corrupto]).
adjetivo(singular,femenino,[jodida]).

%Estas son las conjuciones  que posee la base de datos
conjucion([que]).

%Estas son los adverbios  que posee la base de datos
adverbio([de]).

/*
'########::'##::: ##:'########:
 ##.... ##: ###:: ##: ##.....::
 ##:::: ##: ####: ##: ##:::::::
 ########:: ## ## ##: ######:::
 ##.... ##: ##. ####: ##...::::
 ##:::: ##: ##:. ###: ##:::::::
 ########:: ##::. ##: ##:::::::
........:::..::::..::..::::::::
*/

%
sinonimo(mala,[jodida,mala,rota,corrupta]).
sinonimo(causas,[razones,causas]).
sinonimo(referencia,[referencia]).
sinonimo(problematica,[problema,error,problematica]).

%
sintagma_nexo(Nexo) :-
    adverbio(A),
    articulo(_,_,C),
    append(A,C,Nexo).
%*************************************************************************
sintagma_segundaparte(SP):-
    sustantivo(X,Y,S),
    adjetivo(X,Y,A),
    append(S,A,SP).

sintagma_interrogativo(SI):-
    pronombre_interrogativo(P),
    verbo(_,V),
    append(P,V,SI).

sintagma_interrogativo(SI):-
    pronombre_interrogativo(P),
    sustantivo(_,_,S),
    append(P,S,SI).

sintagma_parte1(P1):-
    sustantivo(X,_,S),
    verbo(X,V),
    append(S,V,P1).

sintagma_predicado1(Oracion):-
    sintagma_interrogativo(P),
    sintagma_nominal(SV),
    append(P,SV,Oracion).

sintagma_predicado1(Oracion):-
    pronombre_interrogativo(P),
    sintagma_parte1(S1),
    append(P,S1,Oracion).

sintagma_predicado2(Predicado2):-
    sintagma_nexo(N),
    sintagma_segundaparte(P2),
    append(N,P2,Predicado2).

sintagma_preguntaCompleja(PC):-
    sintagma_predicado1(S1),
    sintagma_predicado2(S2),
    append(S1,S2,PC).

pregunta(Oracion):-
    sintagma_interrogativo(SI),
    sintagma_nominal(SN),
    append(SI,SN,Oracion).

sintagma_nominal(SN):-
    sustantivo(_,_,SN).
sintagma_nominal(SN):-
    articulo(Y,X,A),
    sustantivo(Y,X,N),
    append(A,N,SN).

sintagma_verbal(SV) :-
    verbo(Y,V),
    adjetivo(Y,_,Z),
    append(V,Z,SV).

sintagma_verbal(SV) :-
    verbo(_,V),
    sintagma_nominal(SN),
    append(V,SN,SV).

oracion(O) :-
    sintagma_nominal(SN),
    sintagma_verbal(SV),
    append(SN,SV,O), !.

oracion(_) :-
    write('La oracion esta mal redactada, el formato de oracion es:....'), nl, fail.

inicio_de_conversacion(P):-
    saludo(S),sustantivo(_,_,N),
    append(S,N,P),
    write('Hola en que le puedo ayudar?'),nl,!.
inicio_de_conversacion(_):-
    write('Debe escribir segun el formato.'),nl,fail.

mitad_de_conversacion(O):-
    sintagma_preguntaCompleja(O),
    sinonimo(causas,X),
    miembro(Y,X),
    miembro(Y,O),!,
    not(causas()).
mitad_de_conversacion(O):-
    sintagma_preguntaCompleja(O),
    sinonimo(referencia,X),
    miembro(Y,X),
    miembro(Y,O),
    sinonimo(problematica,Z),
    miembro(W,Z),
    miembro(W,O),
    adjetivo(_, _, [A|_]),
    miembro(A,O),!,
    referencia(A,L),
    write('Claro, la referencia es:'), nl,
    write(L), nl.
mitad_de_conversacion(O):-
    oracion(O),
    sinonimo(mala,X),
    miembro(Y,X),
    miembro(Y,O),!,
    solucionador().
mitad_de_conversacion(_):-
    write('Debe escribir segun el formato.'),nl,fail.

semi_final_de_conversacion(O):-
    miembro(si,O),!,
    write('Claro, cual es el problema?'),nl,
    callcenterlog_aux.
semi_final_de_conversacion(O):-
    miembro(no, O),!,
    write('De acuerdo'),nl.
semi_final_de_conversacion(_):-
    write('Debe escribir segun el formato.'),nl,fail.

final_de_conversacion(O):-
    despedidas(D),sustantivo(_,_,N),
    append(D,N,O),
    write('Fue un placer ayudarlo.'),nl,!.
final_de_conversacion(_):-
    write('Debe escribir segun el formato.'), nl, fail.












