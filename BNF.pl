<<<<<<< HEAD

:- consult('./SE.pl').

=======
:- consult('./se.pl').
>>>>>>> BDD

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
sustantivo(singular,masculino,[gato]).
sustantivo(singular,femenino,[gata]).
sustantivo(plural,masculino,[gatos]).
sustantivo(plural,femenino,[gatas]).
sustantivo(singular,masculino,[pescado]).
%sustantivo(singular,femenino,[mala]).
sustantivo(singular,femenino,[mierda]).
sustantivo(singular,femenino,[impresora]).
%Estas son los verbos que posee la base de datos
verbo(singular,[come]).
verbo(plural,[son]).
verbo(singular,[este]).
verbo(singular,[esta]).
verbo(singular,[es]).
verbo(singular,[comen]).
%Estos son los adjetivo que posee la base de datos
adjetivo(singular,masculino,[malo]).
adjetivo(singular,femenino,[mala]).
adjetivo(plural,masculino,[malos]).
adjetivo(singular,femenino,[mala]).
adjetivo(singular,femenino,[rota]).
adjetivo(singular,masculino,[roto]).
adjetivo(singular,femenino,[corrupta]).
adjetivo(singular,femenino,[corrupto]).

%Estas son las conjuciones  que posee la base de datos
conjucion([que]).
%Estas son los adverbios  que posee la base de datos
adverbio([de]).
%Estas son los adverbios  que posee la base de datos


null(['']).

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
sinonimo(mala,[mierda,jodido,mala]).
sinonimo(causas,[razones,causas,problemas,inconvenientes]).
/*
pregunta(Oracion):-
    pronombre_interrogativo(P),
    verbo(Y,V),
    sustantivo(Y,X,N),
    append(P,V,N,Oracion),!.
*/

sintagma_nexo(Nexo) :-
    adverbio(A),
    articulo(X,Y,C),
    append(A,C,Nexo).
%*************************************************************************
 sintagma_segundaparte(SP):-
    sustantivo(X,Y,S),
    adjetivo(X,Y,A),
    append(S,A,SP).

sintagma_interrogativo(SI):-
    pronombre_interrogativo(P),
    verbo(Y,V),
    append(P,V,SI).

sintagma_interrogativo(SI):-
    pronombre_interrogativo(P),
    sustantivo(X,Y,S),
    append(P,S,SI).

sintagma_parte1(P1):-
    sustantivo(X,Y,S),
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

sintagma_nominal(SN) :- sustantivo(Y,X,SN).
sintagma_nominal(SN) :- articulo(Y,X,A),sustantivo(Y,X,N),append(A,N,SN).

sintagma_verbal(SV) :-
    verbo(Y,V),
    adjetivo(Y,X,Z),
    append(V,Z,SV)
    .

sintagma_verbal(SV) :-
    verbo(Y,V),
    sintagma_nominal(SN),
    append(V,SN,SV).

oracion(O) :-
    sintagma_nominal(SN),
    sintagma_verbal(SV),
    append(SN,SV,O), !.
oracion(O) :-
    write('La oracion esta mal redactada, el formato de oracion es:....'), nl, fail.

inicio_de_conversacion(P):-
    saludo(S),sustantivo(Y,X,N),
    append(S,N,P),
    write('Hola en que le puedo ayudar guapeton'),nl,!.
inicio_de_conversacion(P):-
    write('No se de que esta hablando loco'),nl,fail.

mitad_de_conversacion(O):-
    oracion(O), sinonimo(mala,X), miembro(Y,X), miembro(Y,O),solucionador(),!.

semi_final_de_conversacion(O):-
    null(O), !, write('Algo mas que pueda ayudarle?'), nl,fail.

semi_final_de_conversacion(O):-
    miembro(si,O),!,
    callcenterlog_aux.

semi_final_de_conversacion(O):-
    miembro(no, O),!.

semi_final_de_conversacion(O):-
    write('No entiendo de que mierdas esta hablando'),nl,fail.

final_de_conversacion(O):-
    despedidas(D),sustantivo(Y,X,N),
    append(D,N,O),
    write('Fue un placer ayudarlo'),nl,!.

final_de_conversacion(O):-
    write('Escriba bien'), nl, fail.
