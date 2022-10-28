program ejercicioTeoria3;

uses crt;

const
dimF=5;

type

arbol = ^nodo;

nodo = record
	dato:integer;
	HI:arbol;
	HD:arbol;
	end;

procedure guardar(n:integer; var a:arbol);

begin
if (a=nil) then
	begin
	new(a);
	a^.dato:=n;
	a^.HI:=nil;
	a^.HD:=nil;
	end
else
	if (n<a^.dato) then
		guardar(n,a^.HI)
	else
		guardar(n,a^.HD);	
end;

procedure leer (var a:arbol);

var
i,num:integer;

begin
for i:=1 to dimF do
	begin
	writeln('Ingrese un numero');
	readln(num);
	guardar(num,a);
	end;
end;

function sumar (a:arbol):integer;

begin
if (a<>nil) then
	begin
	sumar:=a^.dato+sumar(a^.HI)+sumar(a^.HD);
	end
else 
	sumar:=0;
end;

procedure maximo (a:arbol; var max:integer);

begin
if (a<>nil) then
	begin
	if (a^.dato>max) then
		max:=a^.dato;
	maximo(a^.HI,max);
	maximo(a^.HD,max);
	end;
end;

var
ar:arbol;
max:integer;


BEGIN
leer(ar);
writeln('La suma total es de: ',sumar(ar));
max:=-999;
maximo(ar,max);
writeln('El valor maximo es: ',max);
readkey;
END.

