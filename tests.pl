% Archivo de pruebas para la evidencia de Analisis Lexico
% Lenguaje: HTML text-related tags
%
% Uso:
% 1. Abrir SWI-Prolog.
% 2. Cargar el documento:
%    ?- consult('tests.pl').
% 3. Ejecutar todas las pruebas:
%    ?- correr_tests.

:- consult('Evidencia1.pl').

% CASOS VALIDOS
% Estos casos deben regresar true porque pertenecen 
% al lenguaje definido.

caso_valido(['<', p, '>']).
caso_valido(['<', '/', p, '>']).
caso_valido(['<', h1, '>']).
caso_valido(['<', '/', h1, '>']).
caso_valido(['<', h6, '>']).
caso_valido(['<', '/', h6, '>']).
caso_valido(['<', strong, '>']).
caso_valido(['<', '/', strong, '>']).
caso_valido(['<', em, '>']).
caso_valido(['<', '/', em, '>']).
caso_valido(['<', span, '>']).
caso_valido(['<', '/', span, '>']).
caso_valido(['<', mark, '>']).
caso_valido(['<', small, '>']).
caso_valido(['<', sub, '>']).
caso_valido(['<', sup, '>']).


% CASOS INVALIDOS
% Estos casos deben regresar false porque NO pertenecen al 
% lenguaje definido.

caso_invalido(['<', div, '>']).
caso_invalido(['<', '/', div, '>']).
caso_invalido(['<', img, '>']).
caso_invalido(['<', a, '>']).
caso_invalido(['<', h7, '>']).
caso_invalido(['<', '/', h8, '>']).
caso_invalido(['<', p]).
caso_invalido([p, '>']).
caso_invalido([p]).
caso_invalido(['<', strong]).
caso_invalido(['<', strong, '/', '>']).
caso_invalido(['<', '<', p, '>', '>']).
caso_invalido(['<', p, '>', extra]).
caso_invalido([]).
caso_invalido([hello]).
caso_invalido(['<', 'P', '>']).
caso_invalido(['<', ' ', h1, '>']).
caso_invalido(['<', span, class, '>']).


% correr_tests
%
% Ejecuta todos los casos validos e invalidos.
% Si todos pasan, imprime un mensaje de exito.
% Si alguno falla, muestra cual caso fallo.

correr_tests :-
    write('Ejecutando casos validos'), nl,
    probar_validos,
    write('Ejecutando casos invalidos'), nl,
    probar_invalidos,
    write('Todas las pruebas pasaron correctamente.'), nl.



% probar_validos
%
% Recorre todos los caso_valido.
% Cada caso debe hacer que parse_dfa regrese true.

probar_validos :-
    forall(
        caso_valido(Lista),
        (parse_dfa(Lista)->  
        format('OK valido: ~w~n', [Lista]); 
        format('ERROR: este caso debia ser valido: ~w~n', [Lista]))).


% probar_invalidos
%
% Recorre todos los caso_invalido.
% Cada caso debe hacer que parse_dfa regrese false.

probar_invalidos :-
    forall(
        caso_invalido(Lista),
        (parse_dfa(Lista)->  
        format('OK invalido: ~w~n', [Lista]);
        format('ERROR: este caso debia ser invalido: ~w~n', [Lista]))).