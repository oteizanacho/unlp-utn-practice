program parcial2;

uses crt;


type

fecha = record
	dia:integer;
	mes:integer;
	anio:integer;
	end;

venta = record
	f:fecha;
	cod:integer;
	cant: integer;
	monto: real;
	end;

lista = ^nodo;

nodo = record
	elem:venta;
	sig:lista;
	end;

puntoA = record
	cod:integer;
	cant:integer;
	end;




arbol = ^nodo2;

nodo2 = record
	dato:puntoA;
	HI:arbol;
	HD:arbol;
	end;
	




procedure insertarOrdenado (var p:lista; n:venta);
var
aux,ant,act:lista;

begin
new(aux);
aux^.elem:=n;
aux^.sig:=nil;
ant:=p;
act:=p;

while (act<>nil) and (act^.elem.cod<aux^.elem.cod) do
  begin
  ant:=act;
  act:=act^.sig;
  end;

if (act=ant) then  // principio o lista vacia
  p:=aux
else  // medio o final
  ant^.sig:=aux;
aux^.sig:=act;
end;






procedure leerFecha (var f:fecha);

begin
writeln('Ingrese dia');
readln(f.dia);
writeln('Ingrese mes');
readln(f.mes);
writeln('Ingrese anio');
readln(f.anio);
end;



procedure leer (var d:venta);

begin
writeln('Ingrese codigo de producto');
readln(d.cod);
if (d.cod<>-1) then
	begin
	writeln('Ingrese cantidad vendida');
	readln(d.cant);
	writeln('Ingrese monto total de la venta');
	readln(d.monto);
	leerFecha(d.f);
	end;
end;



procedure cargarVentas ( var l:lista);

var
v:venta;

begin
l:=nil;
leer(v);
while (v.cod<>-1) do
	begin
	insertarOrdenado(l,v);
	leer(v);
	end;
end;


procedure crearArbol (var a:arbol; cod:integer; cant:integer);

begin
if (a=nil) then
	begin
	new(a);
	a^.dato.cod:=cod;
	a^.dato.cant:=cant;
	a^.HI:=nil;
	a^.HD:=nil;
	end
else
	if (cod = a.dato.cod) then
		begin
		a^.dato.cant:= a^.dato.cant + cant;
		end
	else
		begin
		if (cod<a^.dato.cod) then
			crearArbol(a^.HI,cod,cant)
		else
			crearArbol(a^.HD,cod,cant)
	end;
end;




procedure generarArbol (var ab:arbol; l:lista);

var
actual:venta;

begin

while (l<>nil) do
	begin
	crearArbol(ab,actual.cod,total);
	l:=l^.sig;	
	end;
end;

function busqueda (a:arbol;cant:integer):integer;

begin
if (a<>nil) then
	begin
	if (a^.dato.cant > cant) then
		busqueda := 1 + busqueda(a^.HI,cant) + busqueda (a^.HD,cant)
	else
		busqueda:= 0 + busqueda(a^.HI,cant) + busqueda (a^.HD,cant);
	end
else
	busqueda:=0;
end;

procedure puntoB (ab:arbol);

var
c:integer;

begin

writeln('Ingrese cantidad a buscar');
readln(c);
writeln('La cantidad es: ', busqueda(ab,c));
end;

procedure imprimir (p:lista);

begin
while (p <> nil) do
	begin
	writeln(p^.elem.cod);
	p:= p^.sig;
	end;
end;



var 
p:lista;
arb:arbol;






BEGIN
cargarVentas(p);
generarArbol(arb,p);
puntoB(arb);
	
END.

