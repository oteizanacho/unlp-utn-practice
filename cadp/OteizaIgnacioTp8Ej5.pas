
program TP8Ej5;

uses crt;

const

toneladas = 30.5;

type

camion = record
		patente:string;
		fabricacion:integer;
		capacidad:real;
		end;

viaje = record
		codV:integer;
		codC:integer;
		distancia:real;
		destino:string;
		anioV:integer;
		dni:integer;
		end;
		
lista = ^nodo;

nodo = record
		elem:viaje;
		sig:lista;
		end;
		
camiones = array [1..100] of camion;

procedure leer (d:viaje);
begin
	writeln('Ingrese codigo de viaje');
	readln(d.codV);
	if (d.codV<>-1) then
		begin
			writeln('Ingrese codigo de camion');
			readln(d.codC);
			writeln('Ingrese distancia recorrida');
			readln(d.distancia);
			writeln('Ingrese ciudad de destino');
			readln(d.destino);
			writeln('Ingrese año en que se realizo el viaje');
			readln(d.anioV);
			writeln('Ingrese dni del chofer');
			readln(d.dni);
		end;
end;

procedure agregarOrdenado(var p:lista; n:viaje);
var
aux,act,ant:lista;

begin
new(aux);
aux^.elem:=n;
aux^.sig:=nil;
act:=p;
ant:=p;

while (act<>nil) and (act^.elem.codC<aux^.elem.codC) do 
	begin
	ant:=act;
	act:=act^.sig;
	end;
	
if (act=ant) then
	p:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;
end;

function mayor (km:real; max:real):boolean;
begin
	if (km>max) then 
		mayor:=true
	else
		mayor:=false
end;

function menor (km:real; min:real):boolean;
begin
	if (km<min) then 
		menor:=true
	else
		menor:=false
end;

procedure puntoB (var cant:integer; n:viaje ; cam:camiones);

var
anios:integer;

begin
	anios:= n.anioV - cam[n.codC].fabricacion;
	if (cam[n.codC].capacidad > toneladas) and (anios>5) then
		cant:=cant+1;
end;

function verifica (num:integer):boolean;
var
dig,i,impar:integer;

begin
	impar:=0;
	for i:=1 to 8 do 
		begin
			dig:=num mod 10;
			if ((dig mod 2) = 1) then
				impar:=impar+1		
		end;
	if (impar=8) then
		verifica:=true
	else
		verifica:=false
end;


procedure recorrer (l:lista; c:camiones);

var
cod,cantV:integer;				// para controlar codigo de camion;  c para cantidad de viajes
km,maximo,minimo:real;
pat1,pat2:string; 			//patentes

begin
cantV:=0;
maximo:=-1;
minimo:=9999;

while (l<>nil) do
	begin
	cod:=l^.elem.codC;
	km:=0;
		while (l<>nil) and (l^.elem.codC = cod) do
			begin
			km:=km+l^.elem.distancia;
			puntoB(cantV,l^.elem,c);
			l:=l^.sig;			
			end;
		if (l<>nil) and (mayor(km,maximo)) then
			begin
			pat1:=c[l^.elem.codC].patente;
			maximo:= km;
			end;
		if (l<>nil) and (menor(km,minimo)) then
			begin
			pat2:=c[l^.elem.codC].patente;
			minimo:=km;
			end;
		if (verifica(l^.elem.dni)) then
			writeln('Codigo de viaje con chofer con dni impar: ',l^.elem.codV);
	end;
writeln('La patente del camion que mas kilometros recorrio es: ',pat1);
writeln('La patente del camion que menos kilometros recorrio es: ',pat2);
writeln('La cantidad de viajes con camiones de mas de 30,5 toneladas de capacidad y antiguedad mayor a 5 años es de: ',cantV);
readkey;
end;

var

l:lista;
cam:camiones;
dato:viaje;


BEGIN
	l:=nil;
	cargarCamiones(cam); 	//se dispone
	leer(dato);
	while (dato.codV<>-1) do
		begin
		agregarOrdenado(l,dato);
		leer(dato);
		end;
	recorrer(l,cam);
END.

