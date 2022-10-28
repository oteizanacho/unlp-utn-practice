program repasoImperativo3;

uses crt;

type

auto = record
	patente:string;
	fabricacion:integer;
	marca:string;
	modelo:integer;
	end;

arbol = ^nodo;

nodo = record
	dato:auto;
	HI:arbol;
	HD:arbol;
	end;

lista = ^nodo2;

nodo2 = record
	dato:auto;
	sig:lista;
	end;
	
vector = array [2010..2018] of lista;

procedure leer (var d:auto);

begin
writeln('Ingrese patente');
readln(d.patente);
writeln('Ingrese ano de fabricacion');
readln(d.fabricacion);
writeln('Ingrese marca');
readln(d.marca);
writeln('Ingrese modelo');
readln(d.modelo);
end;

procedure crearArbol(var a:arbol; d:auto);

begin
if (a=nil) then
	begin
	new(a);
	a^.dato:=d;
	a^.HI:=nil;
	a^.HD:=nil;
	end
else
	if (d.patente < a^.dato.patente) then
		crearArbol(a^.HI,d)
	else
		crearArbol(a^.HD,d)
end;

procedure cargar (var ab:arbol);

var
p:auto;
rta:string;

begin
rta:='si';
while (rta='si') do 
	begin
	leer(p);
	crearArbol(ab,p);
	writeln('Desea cargar otro auto?');
	readln(rta);
	clrscr;
	end;
end;

function buscarMarca (ab: arbol; m:String):integer;

begin
if (ab<>nil) then
	begin
	if (ab^.dato.marca = m) then
		buscarMarca := 1 + buscarMarca(ab^.HI,m) + buscarMarca(ab^.HD,m)
	else
		buscarMarca := 0 + buscarMarca(ab^.HI,m) + buscarMarca(ab^.HD,m);
	end
else
	buscarMarca:=0;
end;

procedure agregarAdelante(var l:lista; d:auto);

var
aux:lista;

begin
new(aux);
aux^.dato:=d;
aux^.sig:=nil;
if (l=nil)then
	l:=aux
else
	begin
	aux^.sig:=l;
	l:=aux;
	end;
end;

procedure puntoC (ab:arbol; var v:vector);

begin
if (ab<>nil) then
	agregarAdelante(v[ab^.dato.fabricacion],ab^.dato);
	puntoC(ab^.HI,v);
	puntoC(ab^.HD,v);
end;

function puntoD (a:arbol; dato:String):integer;

begin
if (a=nil) then
	puntoD:=0
	else
		if (a^.dato.patente = dato) then
			puntoD:=a^.dato.fabricacion
		else
			if (dato < a^.dato.patente) then
				puntoD:= puntoD(a^.HI,dato)
			else 
				puntoD:= puntoD(a^.HD,dato)
end;

procedure buscarPatente (a:arbol);

var
pat:String;
anio:integer;

begin
writeln('Ingrese patente a buscar');
readln(pat);
anio:=puntoD(a,pat);
if (anio<>0) then
	writeln('El anio de fabricacion del auto con patente ', pat, ' es: ',anio);
end;

procedure buscarPorMarca(ad:arbol);

var
marca:string;

begin
writeln('Ingrese nombre de marca');
readln(marca);
writeln('La cantidad de autos de la marca ', marca, ' es: ', buscarMarca(marca));
end;


var 

ab:arbol;
vec:vector;

BEGIN
cargar(ab);
puntoC(ab,vec);
buscarPatente(ab);
buscarPorMarca(ab);
END.

