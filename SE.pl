:- consult('./DB.pl').
:- consult('./readin.pl').

/*
:'######::'####::'######::'########:'########:'##::::'##::::'###::::
'##... ##:. ##::'##... ##:... ##..:: ##.....:: ###::'###:::'## ##:::
 ##:::..::: ##:: ##:::..::::: ##:::: ##::::::: ####'####::'##:. ##::
. ######::: ##::. ######::::: ##:::: ######::: ## ### ##:'##:::. ##:
:..... ##:: ##:::..... ##:::: ##:::: ##...:::: ##. #: ##: #########:
'##::: ##:: ##::'##::: ##:::: ##:::: ##::::::: ##:.:: ##: ##.... ##:
. ######::'####:. ######::::: ##:::: ########: ##:::: ##: ##:::: ##:
:......:::....:::......::::::..:::::........::..:::::..::..:::::..::


'########:'##::::'##:'########::'########:'########::'########::'#######::
 ##.....::. ##::'##:: ##.... ##: ##.....:: ##.... ##:... ##..::'##.... ##:
 ##::::::::. ##'##::: ##:::: ##: ##::::::: ##:::: ##:::: ##:::: ##:::: ##:
 ######:::::. ###:::: ########:: ######::: ########::::: ##:::: ##:::: ##:
 ##...:::::: ## ##::: ##.....::: ##...:::: ##.. ##:::::: ##:::: ##:::: ##:
 ##:::::::: ##:. ##:: ##:::::::: ##::::::: ##::. ##::::: ##:::: ##:::: ##:
 ########: ##:::. ##: ##:::::::: ########: ##:::. ##:::: ##::::. #######::
........::..:::::..::..:::::::::........::..:::::..:::::..::::::.......:::
*/

:- dynamic(respuestas/1).

% Regla que se encarga de imprimir todas las posibles causas de algun
% problema.
causas():-
    write('Hay varias causas que pueden ocasionar que su impresora no funcione:'), nl,
    causa(C),
    write(C), nl,
    fail.

% Regla que se encarga de iniciar el proceso de busqueda de una
% solucion a un problema del usuario, se encarga de reiniciar la lista
% de respuestas y ademas retorna e imprime la solucion al problema del
% usuario.
solucionador():-
    write('Responda solamente con un Si. o No. a las siguientes preguntas:'), nl,
    retractall(respuestas(_)),
    assert(respuestas([])),
    problema(P),
    respuesta(P, R),
    write(R), nl.


% Regla que se encarga de revisar si una pregunta ha sido respondida
% previamente por el usuario, para evitar preguntarla nuevamente, adem�s
% en caso de que la pregunta ya fuese respondida, revisa si la
% respuesta del usuario fue un si o un no.
busca_pregunta(PalabraClave, RespuestaEsperada):-
    respuestas(Lista),
    buscar_respondido(PalabraClave, Respuesta, Lista), !,
    consultar_aux(RespuestaEsperada, Respuesta).

% Regla que se encarga de buscar la pregunta que se le realizar� al
% usuario.
busca_pregunta(PalabraClave, RespuestaEsperada):-
    pregunta(PalabraClave, Problema),
    consultar(PalabraClave, Problema, RespuestaEsperada).

% Regla que se encarga de imprimir la pregunta al usuario y recibir su
% respuesta.
consultar(PalabraClave, Problema, RespuestaEsperada):-
    write(Problema), nl,
    leer_input([Respuesta|_]),
    respuestas(Lista),
    concatenar(Lista, [PalabraClave, Respuesta], NuevaLista),
    retractall(respuestas(_)),
    assert(respuestas(NuevaLista)),
    consultar_aux(RespuestaEsperada, Respuesta).

% Hecho que se encarga de comparar la respuesta dada por el usuario y la
% esperada por el sistema experto.
consultar_aux(Respuesta, Respuesta).

% Hecho y regla que se encargan de concatenar 2 listas a una sola.
concatenar([], Lista, Lista).
concatenar([Cabeza|Cola1], Lista2, [Cabeza|Cola2]):-
    concatenar(Cola1, Lista2, Cola2).

% Hecho y regla que se encargan de buscar y retornar una respuesta del
% usuario de una pregunta realizada previamente.
buscar_respondido(Pregunta, Respuesta, [Pregunta, Respuesta|_]).
buscar_respondido(Pregunta, Respuesta, [_|Cola]):-
    buscar_respondido(Pregunta, Respuesta, Cola).

% Hecho y regla que se encargan de buscar e indicar si hay un elemento
% en una lista.
miembro(Elemento, [Elemento|_]).
miembro(Elemento, [_|Cola]):-
    miembro(Elemento, Cola).

% Regla que se encarga de leer un entrada del usuario y la retorna como
% una lista, donde cada elemento es una palabra de la oraci�n del
% usuario.
leer_input(Lista):-
    read_in(Lista).

