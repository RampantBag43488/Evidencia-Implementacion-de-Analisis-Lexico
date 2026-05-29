% Evidencia: Implementacion de Analisis Lexico
% Lenguaje: HTML text-related tags

% -------------------------------------------------------
% Estados:
% q0 = estado inicial
% q1 = se leyo <
% q2 = se leyo </
% q3 = se reconocio una etiqueta valida
% q4 = estado de aceptacion
% --------------------------------------------------------

% Etiquetas validas
eti_valida(p).
eti_valida(h1).
eti_valida(h2).
eti_valida(h3).
eti_valida(h4).
eti_valida(h5).
eti_valida(h6).
eti_valida(strong).
eti_valida(em).
eti_valida(span).
eti_valida(mark).
eti_valida(small).
eti_valida(sub).
eti_valida(sup).

% Estado de aceptacion
estado_aceptacion(q4).

% Transiciones
mover(q0, q1, '<').
mover(q1, q2, '/').
mover(q1, q3, Etiq) :-
    eti_valida(Etiq).
mover(q2, q3, Etiq) :-
    eti_valida(Etiq).
mover(q3, q4, '>').

% Recibe un string como lista de simbolos y verifica si pertenece al
% lenguaje.
parse_dfa(Lista) :-
    parse_dfa_helper(Lista, q0).

% Caso base:
parse_dfa_helper([], EstadoActual) :-
    estado_aceptacion(EstadoActual).

% Caso recursivo:
parse_dfa_helper([Simbolo|Resto], EstadoActual) :-
    mover(EstadoActual, SigEstado, Simbolo),
    parse_dfa_helper(Resto, SigEstado).