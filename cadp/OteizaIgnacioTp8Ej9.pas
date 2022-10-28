program TP8ej9;

uses crt;

type

pelicula = record
	codPel:integer;
	titulo:string;
	codGen:integer;
	puntajeCri:real;
	end;
	
listaPel = ^nodo;

nodo = record
	elem:pelicula;
	sig:listaPel;
	end;
	
critica = record
	dni:integer;
	nomYape:string;
	codP:integer;
	puntaje:real;
	end;

listaCri = ^nodo2;

nodo2 = record
	elem:critica;
	sig:listaCri;
	end;

procedure insertarOrdenado (var p: listaCri; n: critica);
var
aux,ant,act:listaCri;

begin
new (aux);
aux^.elem:=n;
aux^.sig:=nil;
act:=p;
ant:=p;

while (act<>nil) and (act^.elem.codP<aux^.elem.codP) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (ant=act) then
	p:=aux
else
	begin
	ant^.sig:=aux;
	aux^.sig:=act;
	end;
end;

procedure leerCritica (var n:critica);
begin
writeln('Ingrese codigo de pelicula');
readln(n.codP);
if (n.codP<>-1) then
	begin
	writeln('Ingrese dni del critico');
	readln(n.dni);
	writeln('Ingrese nombre y apellido');
	readln(n.nomYape);
	writeln('Ingrese puntaje otorgado');
	readln(n.puntaje);
	end;
end;

function verifica (dni:integer):boolean;

var
dig,par,impar:integer;

begin
par:=0;
impar:=0;

while (dni<>0) do
	begin
	dig:= dni mod 10; 
	if ((dig mod 2)=0) then
		par:=par+1
	else
		impar:=impar+1;
	dni:= dni div 10;	
	end;
if (par=impar) then
	verifica:= true
else
	verifica:= false
end;

function maximo (puntos:real; max:real):boolean;
begin
if (puntos>max) then
	begin
	max:=puntos;
	maximo:=true;
	end
else
	maximo:=false;
end;

procedure buscarCod (l:listaPel; codigo:integer; var nodo:listaPel);
var
act:listaPel;

begin
act:=l;

while (act<>nil) and (act^.elem.codPel<> codigo) do 
	begin
	act:=act^.sig;
	end;
if (act<>nil) and (act^.elem.codPel=codigo) then
	nodo:=act;			//me guardo el nodo de igual codigo 
end;

procedure actualizarPuntajes (p:listaPel; cod:integer; puntaje:real);
var
act:listaPel;

begin
act:=p;

while (act<>nil) and (act^.elem.codPel<>cod) do
	begin
	act:=act^.sig;
	end;
if (act<>nil) and (act^.elem.codPel=cod) then
	act^.elem.puntajeCri:=puntaje;
end;

procedure eliminar (var p:listaPel; cod:integer);
var
ant,act:listaPel;

begin
act:=p;

while (act<>nil) and (act^.elem.codPel<>cod) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act<>nil) then
	begin
		if (act=p) then
			p:=p^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
	end;
end;



procedure recorrido (p:listaCri; var l:listaPel);
var
actual,cant,codigo:integer;
max,puntajes,prom:real;
n:listaPel;

begin
max:=-1;

while (p<>nil) do
	begin
	puntajes:=0;		//acumulo puntajes
	cant:=0;			//acumulo cantidad de criticas para desp promediar
	actual:=p^.elem.codP;
	while (p<>nil) and (actual = p^.elem.codP) do
		begin
		puntajes:= puntajes + p^.elem.puntaje;
		cant:=cant+1;
		if (maximo(p^.elem.puntaje,max)) then
			begin
			buscarCod(l,p^.elem.codP,n);	
			codigo:=n^.elem.codGen;
			end;
		if (verifica(p^.elem.dni)) then			
			writeln('Apellido y nombre: ',p^.elem.nomYape);
		end;
	//actualizo puntajes
	prom:=puntajes/cant;
	actualizarPuntajes(l,p^.elem.codP,prom);
	end;
writeln('El codigo de genero que mas puntaje obtuvo es: ',codigo);
end;




var
peliculas:listaPel;
criticas:listaCri;
dato:critica;
cod:integer;
rta:string;

BEGIN
peliculas:=nil;
cargarPeliculas(peliculas); 	//se dispone
criticas:=nil;
leerCritica(dato);
while (dato.codP<>-1) do
	begin
	insertarOrdenado(criticas,dato);
	leerCritica(dato);
	end;
recorrido (criticas,peliculas);

writeln('Desea eliminar pelicula?s/n');
readln(rta);
while (rta='s') do
	begin
	writeln('Ingrese codigo de pelicula');
	readln(cod);
	eliminar(peliculas,cod);
	writeln('Desea eliminar otra pelicula?');
	readln(rta);
	end;
END.

