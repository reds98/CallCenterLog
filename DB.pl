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
% Hechos que mencionan algunas causas de problemas que puede tener la
% impresora.
causa('- Su impresora no esta conectada.').
causa('- No tiene los drivers instalados.').
causa('- La impresora no esta en la misma red que su computadora.').
causa('- Su impresora no tiene tinta.').
causa('- El cable de su impresora esta malo').
causa('- Un componente puede estar malo').
causa('- Su impresora puede estar sucia, por lo que se debe limpiar.').
causa('- Le falta papel.').
causa('- Los cabezales pueden estar desalineados.').

% Hechos que contienen las preguntas que el sistema le realizara al
% usuario, esta constituido por la palabra clave del problema (solo lo
% ve el programa) y la oracion del problema que seria imprimido para
% mostrarselo al usuario.
pregunta(imp_con_elec, 'Reviso que la impresora se encuentre conectada?').
pregunta(prim_vez, 'Es la primera vez que utiliza la impresora?').
pregunta(drivers, 'Ya instalo los drivers de su impresora?').
pregunta(wifi, 'Su impresora es WiFi?').
pregunta(imp_con_inter, 'Su impresora esta conectada a la misma red que su computadora?').
pregunta(tinta, 'Su impresora tiene suficiente tinta en todos sus cartuchos?').
pregunta(cable, 'Verifico que el cable de su impresora se encuentre en buenas condiciones?').
pregunta(liquido, 'Ha derramado algun liquido sobre la impresora?').
pregunta(polvo, 'Su impresora ha sido limpiada correctamente recientemente?').
pregunta(sonido, 'Su impresora suena mal cuando se mueve?').
pregunta(enciende, 'Su impresora enciende?').
pregunta(papel, 'El papel usado se encuentra en buenas condiciones?').
pregunta(imp_borrosa, 'Su impresion se ve borrosa?').
pregunta(imp_vieja, 'Impresora vieja?').
pregunta(cabezales, 'La impresion aparece desalineada?').
pregunta(errores, 'La impresora esta encendida pero sigue sin funcionar?').
pregunta(pantalla_mensajes, 'La impresora posee pantalla?').
pregunta(alarmas_leds, 'La impresora presenta una alarma o leds que comunmente no estan activados?').

% Hechos que contienen las respuestas que el sistema le mostraran al
% usuario en caso de encontrar un problema, esta constituido por la
% palabra clave de la solucion (solo lo ve el programa) y la oracion
% de la solucion que mostrara el programa.
respuesta(imp_sin_elec, 'Proceda a conectar su impresora a un tomacorriente.').
respuesta(no_drivers, 'Proceda a instalar los drivers de su impresora').
respuesta(imp_sin_inter, 'Proceda a conectar su impresora a la red.').
respuesta(sin_tinta, 'Proceda a cambiar los cartuchos de tinta necesarios de su impresora.').
respuesta(mal_cable, 'Proceda a cambiar el cable de su impresora').
respuesta(componente_malo, 'Debe llevar su impresora a ser reparada, posiblemente se descompuso un componente').
respuesta(sucia, 'Debe limpiar su impresora.').
respuesta(cambio_papel, 'Proceda a cambiar el tipo de papel utilizado.').
respuesta(sin_resp, 'El sistema no es capaz de atender su duda. Contacte un experto.').
respuesta(desalineado, 'Debe reajustar los cabezales en configuraciones de impresora.').
respuesta(mensaje, 'Siga las instrucciones que aparecen en la pantalla de su impresora').
respuesta(alarmas, 'Lea el manual de usuario sobre esta alarma o luz indicadora').

% Hechos que contienen las referencias de un problema especifico,
% estan constituidos por la palabra clave del problema y el link de la
% pagina con la solucion a este.
referencia(electricidad, 'https://www.yoreparo.com/es/impresoras/preguntas/831836/mi-impresora-no-enciende').
referencia(drivers, 'http://support.ricoh.com/bb_v1oi/pub_e/oi_view/0001032/0001032602/view/Op_Guide/unv/0063.html').
referencia(internet, 'https://techlandia.com/arreglar-impresora-conexion-offline-como_15198/').
referencia(tinta, 'https://files.support.epson.com/htmldocs/xp201_/xp201_ug6/source/printers/source/ink_functions/tasks/xp200/removing_installing_cartridges_xp200.html').
referencia(cable, 'https://www.steren.com.gt/computacion/cables-usb').
referencia(componente, 'https://www.mareex.com/soporte-y-servicio/servicios-de-mantenimiento-y-reparacion-de-impresoras').
referencia(sucia, 'https://es.wikihow.com/limpiar-una-impresora').
referencia(papel, 'https://imprentaonline-naturaprint.com/5-tipos-de-papel-imprimir').
referencia(desalineado, 'https://ugp01.c-ij.com/ij/webmanual/PrinterDriver/W/MG3500%20series/1.0/ES/PPG/dg-c_alignment_auto.html').
referencia(mensaje, 'http://support.ricoh.com/bb_v1oi/pub_e/oi_view/0001062/0001062644/view/intro/int/0068.htm').
referencia(alarmas, 'https://www.oki.com/es/printing/support/user-manual/index.html').


% Reglas de los problemas que puede tener la impresora, se encargan de
% retornar la solucion del problema con base a las respuestas del
% usuario.
problema(imp_sin_elec):-
    busca_pregunta(imp_con_elec, no), !.
problema(no_drivers):-
    busca_pregunta(prim_vez, si),
    busca_pregunta(drivers, no), !.
problema(imp_sin_inter):-
    busca_pregunta(wifi, si),
    busca_pregunta(imp_con_inter, no), !.
problema(sin_tinta):-
    busca_pregunta(tinta, no), !.
problema(mal_cable):-
    busca_pregunta(cable, no), !.
problema(componente_malo):-
    busca_pregunta(liquido, si),
    busca_pregunta(imp_con_elec, si),
    busca_pregunta(enciende, no), !.
problema(sucia):-
    busca_pregunta(sonido, si),
    busca_pregunta(polvo, no), !.
problema(cambio_papel):-
    busca_pregunta(sonido, si),
    busca_pregunta(papel, no), !.
problema(sucia):-
    busca_pregunta(imp_borrosa, si),
    busca_pregunta(polvo, no), !.
problema(desalineado):-
    busca_pregunta(imp_borrosa, si),
    busca_pregunta(cabezales, si), !.
problema(mensaje):-
    busca_pregunta(errores, si),
    busca_pregunta(pantalla_mensajes, si), !.
problema(alarmas):-
    busca_pregunta(errores, si),
    busca_pregunta(alarmas_leds, si), !.
problema(sin_resp).







