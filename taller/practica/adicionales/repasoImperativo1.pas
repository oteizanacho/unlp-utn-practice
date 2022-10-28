program repasoImperativo1;

uses crt;

const

dias=7;

type

entradas = record
	cod:integer;
	asiento:integer;
	monto:real;
	dia:integer;
	end;

lista = ^nodo;

nodo = record
	dato:entradas;
	sig:lista;
	end;

lista2 = ^nodo2;

nodo2 = record
	cod:integer;
	cant:integer;
	sig:lista2;
	end;

vector = array [1..dias] of lista;

procedure lectura (var d:entradas);

begin
writeln('Ingrese codigo de funcion');
Randomize;
d.cod:= Random(50);
if (d.cod<>0) then
	begin
	writeln('Ingrese dia');
	d.dia:= Random (7) + 1;
	writeln('Ingrese asiento');
	d.asiento := Random (100);
	writeln('Ingrese monto');
	d.monto:= Random(1000);
	end;
clrscr;
end;

procedure insertarOrdenado (d:entradas; var l:lista);

var
aux,ant,act:lista;

begin
new(aux);
aux^.dato:=d;
aux^.sig:=nil;
act:=l;
ant:=l;


while ((act<>nil) and (act^.dato.cod < aux^.dato.cod)) do
	begin
	ant:=act;
	act:=act^.sig;	
	end;
if (ant=act) then
	l:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;
end;

procedure inicializar (var p:vector);

var
i:integer;

begin
for i:=1 to dias do
	p[i]:=nil
end;

procedure agregarEntrada (var LE:vector);

var
funcion:entradas;

begin
inicializar(LE);
lectura(funcion);
while (funcion.cod<>0) do
	begin
	insertarOrdenado(funcion,LE[funcion.dia]);
	lectura(funcion);
	end;
end;

procedure imprimirRecursivo(l:lista2);

begin
if (l<>nil) then
	begin
	writeln('Entradas totales: ', l^.cant);
	imprimirRecursivo(l^.sig);
	end;
end;

procedure imprimir(l:lista);

begin
if (l<>nil) then
	begin
	writeln('Codigo: ', l^.dato.cod);
	writeln('Asiento: ', l^.dato.asiento);
	writeln('Monto: ', l^.dato.monto:6:2);
	writeln('Dia: ', l^.dato.dia);
	writeln('------------------------------------');
	end;
end;

procedure agregarAdelante (var p:lista2; d:entradas; tot:integer);

var
aux:lista2;

begin
new(aux);
aux^.cod:=d.cod;
aux^.cant:=tot;
aux^.sig:=nil;
if (p=nil) then
	p:=aux
else
	begin
	aux^.sig:=p;
	p:=aux;
	end;
end;

procedure minimo (var v:vector; var e:entradas);

var
i,aux:integer;

begin
e.cod := 9999;
for i:=1 to dias do
	begin
	if ((v[i]<>nil) and (v[i]^.dato.cod <= e.cod)) then
		begin
		aux:=i;
		e:=v[i]^.dato;
		end;
	end;
if (e.cod<>9999) then
	v[aux]:= v[aux]^.sig;	
end;

procedure mergeConCorte (var v:vector; var l:lista2);

var
e,actual:entradas;
total:integer;

begin
l:=nil;
minimo(v,e);
while (e.cod<>9999) do
	begin
	actual:=e;
	total:=0;
	while (e.cod<>9999) and (e.cod = actual.cod) do
		begin
		total:= total+1;
		minimo(v,e);
		end;
	agregarAdelante(l,actual,total);
	end;
end;

var 

listaEntradas:vector;
listaTotal:lista2;
i:integer;

BEGIN

listaTotal:=nil;
agregarEntrada(listaEntradas);
for i:=1 to dias do
	imprimir(listaEntradas[i]);
mergeConCorte(listaEntradas,listaTotal);
imprimirRecursivo(listaTotal);
END.

