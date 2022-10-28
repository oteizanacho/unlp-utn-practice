program ejercicio4;

uses crt;

type

lista =^nodo;

nodo = record
	dato:integer;
	sig:lista;
	end;

procedure guardar(var p:lista; d:integer);

var
aux:lista;

begin
new(aux);
aux^.dato:=d;
aux^.sig:=nil;

if (p=nil) then
	p:=aux
else
	begin
	aux^.sig:=p;
	p:=aux;	
	end;
end;

procedure leer (n:integer);

begin
writeln('Ingrese un numero entero');
readln(n);
end;

function minimo (l:lista):integer;

begin
if (l=nil) then
	minimo:=999
else
	begin
	minimo:=minimo(l^.sig);
	if (l^.dato<minimo) then
		minimo:=l^.dato
	end;
end;





function minimo2 (l:lista):integer;
var
min:integer;

begin
if (l=nil) then
	minimo:=999
else
	begin
	min:=minimo(l^.sig);
	if (l^.dato<min) then
		minimo:=l^.dato
	else
		minimo:=min;
	end;
end;






function maximo (l:lista):integer;

begin
if (l=nil) then
	maximo:=0
else
	begin
	maximo:=maximo(l^.sig);
	if (l^.dato>maximo) then
		maximo:=l^.dato
	end;
end;

function encontre (l:lista; dato:integer):boolean;

begin
if (l=nil) then
	encontre:=False
else
	begin
	encontre:=encontre(l^.sig,dato);
	if (l^.dato=dato) then
		encontre:=True;
	end;
end;



function encontre2 (l:lista; dato:integer):boolean;

begin
if (l=nil) then
	encontre:=False
else
	begin

	if (l^.dato=dato) then
		encontre:=True
	else
		encontre:=encontre(l^.sig,dato);
	end;
end;








var
p:lista;
num:integer;

BEGIN
p:=nil;
leer(num);
while (num<>0) do
	begin
	guardar(p,num);
	leer(num);
	end;
minimo(p);
readkey;
maximo(p);
readkey;

END.

