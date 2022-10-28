program teoriaMerge2;

uses crt;

const

cantE=2;

type

cadena25= string [25];

lista = ^nodo;

gastos = record
	impuesto:cadena25;
	monto:real;
	end;

nodo=record
	dato:gastos;
	sig:lista;
	end;
	
vector = array [1..cantE] of lista;

{procedure agregarAtras (var l,ult:lista; d:string; m:real);

var
aux:lista;

begin

new(aux);
aux^.impuesto:=d;
aux^.monto:=m;
aux^.sig:=nil;

if (l=nil) then 
	l:=aux
else
	ult^.sig:=aux;
ult:=aux;
end;}

procedure insertarOrdenado (var l:lista; n:gastos);

var
aux,act,ant:lista;

begin

new (aux);
aux^.dato:=n;
aux^.sig:=nil;
act:=l;
ant:=l;

while (act<>nil) and (act^.dato.impuesto < aux^.dato.impuesto) do
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

procedure generarEstructura(var l:lista);

var
g:gastos;

begin

writeln('Ingrese nombre de impuesto');
readln(g.impuesto);
while (g.impuesto<>'ZZ') do
	begin
	writeln('Ingrese monto');
	readln(g.monto);
	insertarOrdenado(l,g);
	writeln('Ingrese nuevo impuesto');
	readln(g.impuesto);
	end;
writeln('*****Carga finalizada*****');
end;

procedure cargarTodos(var vec:vector);

var
i:integer;

begin
for i:=1 to cantE do
	generarEstructura(vec[i]);
end;

procedure minimo(var todos:vector; var g:gastos);

var
i,aux:integer;

begin
g.impuesto:='ZZ';
for i:=1 to cantE do
	begin
	if (todos[i]<>nil) and ((todos[i]^.dato.impuesto) <= (g.impuesto)) then
		begin
		aux:=i;
		g.impuesto:= todos[i]^.dato.impuesto;
		g.monto:=todos[i]^.dato.monto;
		end;
	end;
if (g.impuesto<>'ZZ') then
	todos[aux]:= todos[aux]^.sig;
end;

procedure merge(vec:vector; var nuevo:lista);

var
g:gastos;
montoTotal:real;
actual:cadena25;

begin
nuevo:=nil;
minimo(vec,g);
while (g.impuesto<>'ZZ') do
	begin
	actual:=g.impuesto;
	montoTotal:=0;
	while (g.impuesto<>'ZZ') and (g.impuesto=actual) do
		begin
		montoTotal:=montoTotal+g.monto;
		minimo(vec,g);
		end;
	insertarOrdenado(nuevo,g);
	end;
end;

procedure imprimirTodos (v:vector);

var
i:integer;

begin
for i:=1 to cantE do
	begin
	writeln('*****Estante: ',i,'*****');
	while (v[i]<>nil) do
		begin
		writeln('Impuesto: ',v[i]^.dato.impuesto);
		writeln('Monto: ',v[i]^.dato.monto:6:2);
		v[i]:=v[i]^.sig;		
		end;
	end;
end;

procedure imprimir (l:lista);

begin

while (l<>nil) do
	begin
	writeln('Impuesto: ',l^.dato.impuesto);
	writeln('Monto: ',l^.dato.monto:6:2);
	l:=l^.sig
	end;
end;



var
estantes:vector;
totalMontos:lista;

BEGIN

cargarTodos(estantes);
imprimirTodos(estantes);
readkey;
merge(estantes,totalMontos);
writeln('*****Merge*****');
imprimir(totalMontos);
readkey;
END.

