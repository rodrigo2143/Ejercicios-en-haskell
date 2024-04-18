% Hechos: Costo del transporte para diferentes lugares
transporte(roma, 20000).
transporte(londres, 25000).
transporte(tunez, 15000).

% Hechos: Costo del alojamiento por día en diferentes lugares y tipos de alojamiento
alojamiento(hotel, roma, 25000).
alojamiento(hotel, londres, 15000).
alojamiento(hotel, tunez, 10000).
alojamiento(hostal, roma, 15000).
alojamiento(hostal, londres, 10000).
alojamiento(hostal, tunez, 8000).
alojamiento(camping, roma, 10000).
alojamiento(camping, londres, 5000).
alojamiento(camping, tunez, 5000).

% Regla: Calcular el costo total del viaje
costo_total(Lugar, Alojamiento, Dias, CostoTotal) :-
    transporte(Lugar, CostoTransporte),
    alojamiento(Alojamiento, Lugar, CostoAlojamientoPorDia),
    CostoAlojamiento is CostoAlojamientoPorDia * Dias,
    CostoTotal is CostoTransporte + CostoAlojamiento.



horoscopo(aries, 21, 3, 20, 4).
horoscopo(tauro, 21, 4, 20, 5).
horoscopo(geminis, 21, 5, 20, 6).
horoscopo(cancer, 21, 6, 20, 7).
horoscopo(leo, 21, 7, 20, 8).
horoscopo(virgo, 21, 8, 20, 9).
horoscopo(libra, 21, 9, 20, 10).
horoscopo(escorpio, 21, 10, 20, 11).
horoscopo(sagitario, 21, 11, 20, 12).
horoscopo(capricornio, 21, 12, 20, 1).
horoscopo(acuario, 21, 1, 20, 2).
horoscopo(piscis, 21, 2, 20, 3).


signo(Dia, Mes, Signo) :-
    horoscopo(Signo, D1, M1, D2, M2),
    (
        (Mes = M1, Dia >= D1);
        (Mes = M2, Dia =< D2);
        (Mes > M1, Mes < M2)
    ).





% Hechos: Pacientes y enfermedades
enfermo_de(manuel, gripe).
tiene_sintoma(alicia, cansancio).
tiene_sintoma(ana, fiebre).

% Hechos: Relación entre síntomas y enfermedades
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).

% Hechos: Tratamientos y síntomas que alivian
elimina(vitaminas, cansancio).
elimina(aspirinas, fiebre).
elimina(jarabe, tos).

% Regla: Un tratamiento alivia un síntoma si el tratamiento elimina un síntoma que es síntoma de una enfermedad
alivia(X, Y) :-
    elimina(X, A),
    sintoma_de(A, Y).

% Regla: Un tratamiento se receta a un paciente si alivia un síntoma de la enfermedad del paciente
recetar_a(X, Y) :-
    enfermo_de(Y, A),
    alivia(X, A).

% Regla: Un paciente está enfermo de una enfermedad si tiene un síntoma que es síntoma de esa enfermedad
enfermo_de(X, Y) :-
    tiene_sintoma(X, Z),
    sintoma_de(Z, Y).
