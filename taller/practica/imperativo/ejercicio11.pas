program ejercicio11;

uses crt;

const
generos=8;

type

lista = ^nodo;

pelicula = record
	cod:integer;
	genero:integer;
	puntaje:real;
	end;

nodo = record
	datos:pelicula;	
	sig:lista;
	end;
	
vector = array [1..generos] of lista;

procedure insertarOrdenado(var l:lista; n:pelicula);

var
act,ant,aux:lista;

begin
new(aux);
aux^.datos:=n;
aux^.sig:=nil;
act:=l;
ant:=l;

while (act<>nil) and (act^.datos.cod < aux^.datos.cod) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act=ant) then
	l:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;
end;

procedure leerPelicula (var l:lista);

var
p:pelicula;

begin
writeln ('Ingrese codigo de pelicula');
readln(p.cod);
while (p.cod<>-1) do
	begin
	writeln('Ingrese codigo de genero');
	readln(p.genero);
	writeln('Ingrese puntaje promedio otorgado');
	readln(p.puntaje);
	insertarOrdenado(l,p)
	end;
writeln('*****Carga finalizada*****');
end;

procedure cargar (var v:vector);

var
i:integer;

begin
for i:=1 to generos do
	leerPelicula(v[i]);
end;


//merge de vectos de listas

procedure minimo(var v:vector; var p:pelicula);

var
i,aux:integer;

begin
p.cod:=9999;
for i:=1 to generos do
	begin
	if (v[i]<>nil) and (v[i]^.datos.cod <= p.cod) then
		begin
		aux:=i;
		p:=v[i]^.datos;
		end;
	end;
if (p.cod<>9999) then
	v[aux]:=v[aux]^.sig;
end;

procedure mergePeliculas (v:vector; var l:lista);

var
p:pelicula;

begin
l:=nil;
minimo(v,p);
while (p.cod<>9999) do
	begin
	insertarOrdenado(l,p);
	minimo(v,p);
	end;
end;

var 
vec:vector;
listaCod:lista;

BEGIN
cargar(vec);
mergePeliculas(vec,listaCod);
END.

