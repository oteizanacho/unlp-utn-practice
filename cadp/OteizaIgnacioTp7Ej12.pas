program TP7Ej12;

uses crt;

type

datos = record
		versionA:real;
		tamPan:real;
		ram:integer;
		end;
		
lista = ^nodo;

nodo = record
		elem:datos;
		sig:lista;
		end;

procedure puntoA (p:lista);

var
cant:integer;
version:real;

begin

while (p<>nil) do 
	begin
	cant:=0;
	version := p^.elem.versionA;
	while (p<>nil) and (version = p^.elem.versionA) do
		begin
		cant:=cant+1;
		p:=p^.sig;
		end;
	writeln('La cantidad de dispositivos con android version ',version,' es de: ',cant);
	readkey;
	end;	
end;

procedure puntoB (p:lista);

var
cant:integer;

begin

cant:=0;

while (p<>nil) do 
	begin
	if (p^.elem.ram > 3) and (p^.elem.tamPan<=5) then
		cant:=cant+1;
	p:=p^.sig;
	end;
writeln ('La cantidad de dispositivos con ram mayor a 3GB y a lo sumo 5 pulgadas de pantalla es ',cant);
readkey;
end;

procedure puntoC (p:lista);

var
cant:integer;
total,prom:real;

begin
cant:=0;
total:=0;

while (p<>nil) do
	begin
	total:=total + p^.elem.tamPan;
	cant:=cant+1;
	p:=p^.sig;
	end;
prom:= total/cant;
writeln('El tamaño promedio de las pantallas de todos los dispositivos es: ',prom);
readkey;
end;
	
var

l:lista;


BEGIN

puntoA(l);
puntoB(l);
puntoC(l);

END.

