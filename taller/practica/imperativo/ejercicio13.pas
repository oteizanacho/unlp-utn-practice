program ejercicio13;

uses crt;

const
dias=7;

type 

entrada = record
	dia:integer;
	cod:integer;
	asiento:integer;
	monto:real;
	end;
	
lista =^nodo;

nodo = record
	datos:entrada;
	sig:lista;
	end;

vector = array [1..dias] of lista;

procedure insertarOrdenado (var l:lista; e:entrada);

procedure leerEntrada (var l:lista);

var
e:entrada;

procedure cargarEntradas (var v:vector);

var
i:integer;

procedure minimo (var v:vector; var e:entrada);

var
i,aux:integer;

procedure mergeConCorte (var v:vec; lNueva:lista);

var
e:entrada;

var 
vec:vector;
listaEntradas:lista;

BEGIN
cargarEntradas(vec);
merge(vec,listaEntradas);	
END.

