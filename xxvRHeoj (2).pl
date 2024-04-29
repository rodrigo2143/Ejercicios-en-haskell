% Hechos de plantas y sus usos medicinales
planta(aspirina, dolor).
planta(diente_de_leon, laxante).
planta(manzanilla, digestion).
planta(abrojo, infecciones).
planta(acacia, garganta).
planta(acanto, desinflamante).
planta(aceitilla, cansancio_intelectual).
planta(achicoria, colicos).
planta(anis, acidez_estomacal).
planta(arnica, acne).
planta(yerbabuena, agruras).
planta(ajenjo, anemia).
planta(chilacayote, artritis).
planta(eucalipto, bronquitis).
planta(mostaza, bronconeumonia).
planta(limon, caspa).
planta(salvia, circulacion).
planta(menta, colicos).
planta(alcanfor, dolores_musculares).
planta(ciruela, estrenimiento).
planta(oregano, flemas).
planta(tabaco, hernia).
planta(ajo, hipertension).
planta(cebolla, laringitis).
planta(aguacate, lombrices).
planta(salvia, tos).
planta(manzanilla, vomito).

% Plantas adicionales asignadas y sus usos
planta(aconito, jaquecas_serias).
planta(aconito, dolor_de_muelas).
planta(aconito, ciatica).
planta(aconito, dolores_articulares).
planta(aconito, hidropesia).
planta(adormidera, dolor).
planta(adormidera, fiebre).
planta(adormidera, sueno).
planta(adormidera, tos).
planta(adormidera, asma).
planta(adormidera, diarrea).
planta(adormidera, disenteria).
planta(aguacate, afrodisiaco).
planta(aguacate, diabetico).
planta(aguacate, caida_de_pelo).
planta(aguacate, tina).

% Advertencias y prescripciones para plantas específicas
advertencia(aconito, venenosa).
prescripcion(aconito, requerida).

% Reglas en Prolog para consultar usos de las plantas

% Encontrar una planta adecuada para un síntoma específico
encontrar_planta_para_sintoma(Sintoma, Planta) :-
    planta(Planta, Sintoma).

% Listar todas las plantas que pueden ayudar con un síntoma específico
listar_plantas_para_sintoma(Sintoma, Plantas) :-
    findall(Planta, planta(Planta, Sintoma), Plantas).

% Sugerir una forma de uso basada en la planta y el síntoma
sugerir_uso(Planta, Sintoma, Uso) :-
    planta(Planta, Sintoma),
    (Planta == manzanilla, Uso = infusion;
     Planta == diente_de_leon, Uso = cocimiento;
     Planta == ajo, Uso = jugo).

% Recomendar tratamientos basados en múltiples síntomas
recomendar_tratamiento(Sintomas, Tratamientos) :-
    setof((Planta, Uso), (member(Sintoma, Sintomas), planta(Planta, Sintoma), sugerir_uso(Planta, Sintoma, Uso)), Tratamientos).

% Encontrar alternativas cuando la planta principal no está disponible
alternativa_para_planta(PlantaPrincipal, Alternativa) :-
    planta(PlantaPrincipal, Sintoma),
    planta(Alternativa, Sintoma),
    Alternativa \= PlantaPrincipal.
