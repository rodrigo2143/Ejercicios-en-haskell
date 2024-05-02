%1) Código fuente del programa
% Insertar un elemento en un árbol binario de búsqueda
insertar(X, nil, tree(X, nil, nil)).
insertar(X, tree(Elemento, Izquierda, Derecha), tree(Elemento, NuevaIzquierda, Derecha)) :-
    X < Elemento,
    insertar(X, Izquierda, NuevaIzquierda).
insertar(X, tree(Elemento, Izquierda, Derecha), tree(Elemento, Izquierda, NuevaDerecha)) :-
    X > Elemento,
    insertar(X, Derecha, NuevaDerecha).

% Iniciar el árbol con elementos específicos
iniciar_arbol(Arbol) :-
    insertar(7, nil, ArbolTemp1),
    insertar(3, ArbolTemp1, ArbolTemp2),
    insertar(9, ArbolTemp2, ArbolTemp3),
    insertar(1, ArbolTemp3, ArbolTemp4),
    insertar(5, ArbolTemp4, Arbol).

% Búsqueda de un elemento en el árbol
buscar(Elemento, tree(Elemento, _, _)).
buscar(Elemento, tree(_, Izquierda, _)) :- buscar(Elemento, Izquierda).
buscar(Elemento, tree(_, _, Derecha)) :- buscar(Elemento, Derecha).

% Recorrido Preorden (raíz, izquierda, derecha)
preorden(nil, []).
preorden(tree(Elemento, Izquierda, Derecha), Lista) :-
    preorden(Izquierda, ListaIzq),
    preorden(Derecha, ListaDer),
    append([Elemento|ListaIzq], ListaDer, Lista).

% Recorrido Inorden (izquierda, raíz, derecha)
inorden(nil, []).
inorden(tree(Elemento, Izquierda, Derecha), Lista) :-
    inorden(Izquierda, ListaIzq),
    inorden(Derecha, ListaDer),
    append(ListaIzq, [Elemento|ListaDer], Lista).

% Recorrido Posorden (izquierda, derecha, raíz)
posorden(nil, []).
posorden(tree(Elemento, Izquierda, Derecha), Lista) :-
    posorden(Izquierda, ListaIzq),
    posorden(Derecha, ListaDer),
    append(ListaIzq, ListaDer, ListaTemp),
    append(ListaTemp, [Elemento], Lista).

% 2) Conclusión de la manipulación de árboles binarios
%La manipulación de árboles binarios en Prolog es un ejemplo claro de cómo 
%los lenguajes de programación lógica pueden simplificar ciertas tareas de estructuras
% de datos complejas. Prolog, con su enfoque en reglas y patrones de coincidencia, es 
% particularmente adecuado para operaciones recursivas como los recorridos de árboles. 
% La búsqueda y los recorridos son directos gracias a la naturaleza recursiva de las definiciones
%  de árboles y las operaciones pueden ser expresadas de manera muy concisa. 

