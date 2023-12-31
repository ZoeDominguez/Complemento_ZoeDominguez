%EscaPdeP

%persona(Apodo, Edad, Peculiaridades).
persona(ale, 15, [claustrofobia, cuentasRapidas, amorPorLosPerros]).
persona(agus, 25, [lecturaVeloz, ojoObservador, minuciosidad]).
persona(fran, 30, [fanDeLosComics]).
persona(rolo, 12, []).


%esSalaDe(NombreSala, Empresa).
esSalaDe(elPayasoExorcista, salSiPuedes).
esSalaDe(socorro, salSiPuedes).
esSalaDe(linternas, elLaberintoso).
esSalaDe(guerrasEstelares, escapepepe).
esSalaDe(fundacionDelMulo, escapepepe).
esSalaDe(fundi, escapepepe).

%terrorifica(CantidadDeSustos, EdadMinima).
%familiar(Tematica, CantidadDeHabitaciones).
%enigmatica(Candados).

%sala(Nombre, Experiencia).
sala(elPayasoExorcista, terrorifica(100, 18)).
sala(socorro, terrorifica(20, 12)).
sala(linternas, familiar(comics, 5)).
sala(guerrasEstelares, familiar(futurista, 7)).
sala(fundacionDelMulo, terrorifica(20,30)).

sala(fundi, terrorifica(20,30)).
%Punto 1

dificultadDeExperiencia(terrorifica(CantidadDeSustos, EdadMinima),Nivel):-
    Nivel is CantidadDeSustos - EdadMinima.

dificultadDeExperiencia(familiar(futurista, _), Nivel):-
    Nivel is 15.

dificultadDeExperiencia(familiar(Tematica,CantidadDeHabitaciones), Nivel):-
    Tematica \= futurista,
    Nivel is CantidadDeHabitaciones.


dificultadDeExperiencia(enigmatica(Candados), Nivel):-
    length(Candados, Nivel).
    
nivelDeDificultadDeLaSala(Sala, Dificultad):-
    sala(Sala, Experiencia),
    dificultadDeExperiencia(Experiencia,Dificultad).

%Punto 2
esClaustrofobica(Persona):-
    persona(Persona,_,Peculiaridades),
    member(claustrofobia, Peculiaridades).
    

puedeSalir(Persona, Sala):-
    not(esClaustrofobica(Persona)),
    nivelDeDificultadDeLaSala(Sala, 1).

puedeSalir(Persona, Sala):-
    persona(Persona,Edad, _),
    not(esClaustrofobica(Persona)),
    nivelDeDificultadDeLaSala(Sala, Dificultad),
    Edad > 13,
    Dificultad <5.

%Punto 4
esSalaNoTerrorifica(Sala):-
    sala(Sala, _),
    not(sala(Sala, terrorifica(_,_))).

noEsMacabra(Empresa):-
    esSalaDe(Sala, Empresa),
    esSalaNoTerrorifica(Sala).

esMacabra(Empresa):-
    esSalaDe(_,Empresa),
    not(noEsMacabra(Empresa)).
   
%no tiene otra experiencia que no sea terrorrifica
    
% forall(esSalaDe(Sala,Empresa), sala(Sala, terrorifica(_,_))).
    
