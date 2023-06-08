% Solución vista en clase:

% Punto 1:

% Predicado de aridad 2: esMaestroDe/2 -> Maestro y Elemento
esMaestroDe(toph, tierra).
esMaestroDe(katara, agua).
esMaestroDe(aang, tierra).
esMaestroDe(aang, fuego).
esMaestroDe(aang, agua).
esMaestroDe(zuko, fuego).

% No agregamos a Sokka, ya que por el principio de Universo Cerrado si no lo agregamos significa que no es maestro de algo.

% Agregar 5 más que quieran.

% Punto 2:

creoMovimiento(zaheer, volar).
creoMovimiento(aang, patinetaDeAire).
creoMovimiento(tenzin, torbellinoDeAire).

% Punto 3: 

tieneConexionEspiritual(zaheer).
tieneConexionEspiritual(bumi).
tieneConexionEspiritual(kai).
tieneConexionEspiritual(marquitos).

% Punto 4:

% La lógica de cuándo un maestro controla el aire es: aquellos que haya creado un movimiento O aquellos que tengan conexión espiritual:
% Planteamos entonces dos nuevas cláusulas de esMaestroDe, que serán las reglas que definan esta lógica:

esMaestroDe(Maestro, aire):-
  creoMovimiento(Maestro,_). %¿existe algún movimiento creado por este maestro?
  
esMaestroDe(Maestro, aire):-
  tieneConexionEspiritual(Maestro).

/*
Consultas (probar en consola):
esMaestro(_,aire). -> ¿Existe algún maestro aire?
esMaestro(Maestro, fuego). -> ¿Quiénes son los maestros fuego?
esMaestro(Maestro, Elemento). -> ¿Quiénes son los maestros y qué elemento controlan?
esMaestro(aang, Elemento) -> ¿Qué elementos sabe controlar Aang?
esMaestro(sokka,_). ->¿Sokka sabe controlar algún elemento?
*/

% Punto 5

% Para saber si tiene doble maestría, tenemos que saber si sabe controlar dos elementos Y que esos elementos sean diferentes
% tieneDobleMaestria/1 -> Maestro
tieneDobleMaestria(Maestro):-
  esMaestroDe(Maestro, Elemento1),
  esMaestroDe(Maestro, Elemento2),
  Elemento1 \= Elemento2.
  
% Para saber si un maestro no maneja el agua, quiero ligar primero el elemento que sabe controlar y fijarme que no sea agua
% noManejaAgua/1 -> Maestro
noManejaAgua(Maestro):-
  esMaestroDe(Maestro, Elemento),
  Elemento \= agua.
 
 % Para saber si dos maestros son compatriotas, tengo que fijarme que sepan controlar el mismo ejemplo, pero puedo hacerlo simplemente con la misma variable de elemento:
 % compatriotas/2 -> Maestro y Maestro
 compatriotas(Maestro1, Maestro2):-
  esMaestroDe(Maestro1, Elemento), 
  esMaestroDe(Maestro2, Elemento). 
  
