% Hechos que mencionan algunas causas de problemas que puede tener la
% impresora.
causa('- Su impresora no est� conectada.').
causa('- No tiene los drivers instalados.').
causa('- La impresora no est� en la misma red que su computadora.').
causa('- Su impresora no tiene tinta.').
causa('- El cable de su impresora esta da�ado').
causa('- Su impresora puede estar sucia, por lo que se debe limpiar.').
causa('- Los cabezales pueden estar desalineados.').

% Hechos que contienen las preguntas que el sistema le realizar� al
% usuario, est� constituido por la palabra clave del problema (solo lo
% ve el programa) y la oraci�n del problema que ser� imprimida para
% mostrarsela al usuario.
pregunta(imp_con_elec, '�Revis� que la impresora se encuentre conectada?').
pregunta(prim_vez, '�Es la primera vez que utiliza la impresora?').
pregunta(drivers, '�Ya instal� los drivers de su impresora?').
pregunta(wifi, '�Su impresora es WiFi?').
pregunta(imp_con_inter, '�Su impresora est� conectada a la misma red que su computadora?').
pregunta(tinta, '�Su impresora tiene suficiente tinta en todos sus cartuchos?').
pregunta(cable, '�Verific� que el cable de su impresora se encuentre en buenas condiciones?').
pregunta(liquido, '�Ha derramado alg�n l�quido sobre la impresora?').
pregunta(polvo, '�Su impresora ha sido limpiada correctamente recientemente?').
pregunta(sonido, '�Su impresora suena mal cuando se mueve?').
pregunta(enciende, '�Su impresora enciende?').
pregunta(papel, '�El papel usado se encuentra en buenas condiciones?').
pregunta(imp_borrosa, '�Su impresi�n se ve borrosa?').
pregunta(imp_vieja, '�Impresora vieja?').
pregunta(cabezales, '�La impresi�n aparece desalineada?').
pregunta(errores, '�La impresora est� encendida pero sigue sin funcionar?').
pregunta(pantalla_mensajes, '�La impresora posee pantalla?').
pregunta(alarmas_leds, '�La impresora presenta una alarma o leds que comunmente no est�n activados?').

% Hechos que contienen las respuestas que el sistema le mostrar� al
% usuario en caso de encontrar un problema, est� constituido por la
% palabra clave de la soluci�n (solo lo ve el programa) y la oraci�n de
% la soluci�n que mostrar� el programa.
respuesta(imp_sin_elec, 'Proceda a conectar su impresora a un tomacorriente.').
respuesta(no_drivers, 'Proceda a instalar los drivers de su impresora').
respuesta(imp_sin_inter, 'Proceda a conectar su impresora a la red.').
respuesta(sin_tinta, 'Proceda a cambiar �l/los cartuchos de tinta necesarios de su impresora.').
respuesta(mal_cable, 'Proceda a cambiar el cable de su impresora').
respuesta(componente_malo, 'Debe llevar su impresora a ser reparada, posiblemente se da�� un componente').
respuesta(sucia, 'Debe limpiar su impresora.').
respuesta(cambio_papel, 'Proceda a cambiar el tipo de papel utilizado.').
respuesta(sin_resp, 'El sistema no es capaz de atender su duda. Contacte un experto.').
respuesta(desalineado, 'Debe reajustar los cabezales en configuraciones de impresora.').
respuesta(mensaje, 'Siga las instrucciones que aparecen en la pantalla de su impresora').
respuesta(alarmas, 'Lea el manual de usuario sobre esta alarma o luz indicadora').







