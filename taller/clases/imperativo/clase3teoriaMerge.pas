program teoriaMerge;

uses crt;

const
cantE=3;

type 

lista =^nodo;

nodo = record 
	dato:string;
	sig:lista;
	end;

estantes = array [1..cantE] of lista;

procedure agregarAtras (var l,ult:lista; d:string);

var
aux:lista;

begin

new(aux);
aux^.dato:=d;
aux^.sig:=nil;

if (l=nil) then 
	l:=aux
else
	ult^.sig:=aux;
ult:=aux;
end;

procedure generarEstante(var e:lista);

var
libro:string;
ultimo:lista;

begin
writeln('Ingrese libro');
readln(libro);
	while (libro<>'ZZZ') do
		begin
		agregarAtras(e,ultimo,libro);
		writeln('Ingrese nuevo libro');
		readln(libro);
		end;
end;

procedure minimo (var E1,E2:lista; var min:string);

begin

min:='ZZZ';
if (E1<>nil) and (E2<>nil) then
	if (E1^.dato) <= (E2^.dato) then
		begin
		min:=E1^.dato;
		E1:=E1^.sig;
		end
	else 
		begin
		min:=E2^.dato;
		E2:=E2^.sig;		
		end
else 
	if (E1<>nil) and (E2=nil) then 
		begin
		min:=E1^.dato;
		E1:=E1^.sig;	
		end
	else 
		if (E1=nil) and (E2<>nil) then 
			begin
			min:=E2^.dato;
			E2:=E2^.sig;
			end;
end;


procedure merge (E1,E2:lista; var Enuevo:lista);

var
min:string;
ultimo:lista;

begin
min:='AAA';
Enuevo:=nil;
minimo(E1,E2,min);
while (min<>'ZZZ') do
	begin
	agregarAtras(Enuevo,ultimo,min);
	minimo(E1,E2,min);
	end;
end;

procedure minimoNuevo(var v:estantes; var min:string);

var
i,aux:integer;

begin
aux:=0;
min:='ZZZ';
for i:=1 to cantE do
	begin
	if (v[i]<>nil) and ((v[i]^.dato) <= (min)) then 
		begin
		min:=v[i]^.dato;
		aux:=i;
		end;
	end;
if (min<>'ZZZ') then 
	v[aux]:=v[aux]^.sig;
end;

procedure mergeNuevo(vec:estantes; var Enuevo:lista);

var
min:string;
ultimo:lista;

begin
min:='AAA';
Enuevo:=nil;
minimoNuevo(vec,min);
while (min<>'ZZZ') do
	begin
	agregarAtras(Enuevo,ultimo,min);
	minimoNuevo(vec,min);
	end;
end;

procedure imprimirTodos (v:estantes);

var
i:integer;

begin
for i:=1 to cantE do
	begin
	writeln('*****Estante: ',i,'*****');
	while (v[i]<>nil) do
		begin
		writeln('Libro: ',v[i]^.dato);
		v[i]:=v[i]^.sig;		
		end;
	end;
end;

procedure imprimir (l:lista);

begin

while (l<>nil) do
	begin
	writeln('Libro: ',l^.dato);
	l:=l^.sig
	end;
end;

procedure cargarTodos(var v:estantes);

var
i:integer;

begin
for i:=1 to cantE do
	generarEstante(v[i]);
end;

var
estante1,estante2:lista;
estanteNuevo:lista;
todos:estantes;

BEGIN
{generarEstante(estante1);
writeln('*****Estante 1*****');
imprimir(estante1);
readkey;
clrscr;
generarEstante(estante2);
writeln('*****Estante 2*****');
imprimir(estante2);
readkey;
clrscr;
merge(estante1,estante2,estanteNuevo);
writeln('*****Merge*****');
imprimir(estanteNuevo);
readkey;
clrscr;}
cargarTodos(todos);
imprimirTodos(todos);
mergeNuevo(todos,estanteNuevo);
writeln('*****Merge2*****');
imprimir(estanteNuevo);
readkey;
END.

