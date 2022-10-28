program TP7Ejercicio11;

uses crt;

type 

datos = record
		cod:integer;
		apellido:string;
		prom:real;
		end;
		
lista = ^nodo;

nodo = record
		elem:datos;
		sig:lista;
		end;
	
procedure insertarOrdenado(var p:lista; d:datos);

var
aux,ant,act:lista;

begin

new(aux);
aux^.elem:=d;
aux^.sig:=nil;
act:=p;
ant:=p;

while (act<>nil) and (act^.elem.prom > aux^.elem.prom) do
	begin
	ant:=act;
	act:=act^.sig;
	end;
	
if (act = ant) then 
	p:=aux
else
	ant^.sig:=aux;
	aux^.sig:=act;
end;

procedure leerAlumnos (var n:datos);
begin
writeln('Ingrese codigo de alumno');
readln(n.cod);
if (n.cod <>0) then
	begin
	writeln('Ingrese apellido del alumno');
	readln(n.apellido);
	writeln('Ingrese promedio');
	readln(n.prom);
	clrscr; 
	end;
end;

procedure imprimir (l:lista);
var
i:integer;
begin
i:=1;
while (l<>nil) and (i<=4) do 
	begin
	writeln('Mejor promedio nro: ',i,', es: ',l^.elem.apellido,', de numero de alumno: ',l^.elem.cod);
	i:=i+1;
	l:=l^.sig;
	end;
end;

var

alumnos:lista;
data:datos;

BEGIN

alumnos:=nil;
leerAlumnos(data);
while (data.cod <> 0) do 
	begin
	insertarOrdenado(alumnos,data);
	leerAlumnos(data);
	end;
imprimir(alumnos);

END.

