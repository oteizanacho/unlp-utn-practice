program ejercicio12;

uses crt;

const
total=4;

type

fecha = record
	dia:integer;
	mes:integer;
	año:integer;
	end;


venta = record
	f:fecha;
	codP:integer;
	codS:integer;
	cant:integer;
	end;
	
lista = ^nodo;

nodo = record
	datos:venta;
	sig:lista;
	end;	
	
vector = array [1..total] of lista;

procedure insertarOrdenado (var l:lista; v:venta);

procedure leerVenta (var l:lista);

var
v:venta;

procedure cargarVentas (var v:vector);

var
i:integer;

procedure minimo (var v:vector; var v:venta );

var
i,aux:integer;

procedure mergeConCorte (var v:vector; lNueva:lista);

var
v:venta;


var 
vec:vector;
listaTotal:lista;

BEGIN
cargarVentas(vec);
merge(vec,listaTotal);
END.

