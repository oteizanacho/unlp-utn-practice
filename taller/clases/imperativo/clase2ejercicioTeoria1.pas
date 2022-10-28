
program teoria1;

uses crt;

const
dimF=8;

type 

lista = ^ nodo;

nodo = record
	dato:integer;
	sig:lista;
	end;
	
procedure agregarAdelante (var p:lista; num:integer);

var
aux:lista;

begin
new(aux);
aux^.dato:=num;
aux^.sig:=nil;

if (p=nil) then 
	p:=aux
else
	begin
	aux^.sig:=p;
	p:=aux;
	end;
end;

procedure leer (var p:lista);

var
i,n:integer;

begin
for i:=1 to dimF do
	begin
	writeln('Ingrese un numero entero');
	readln(n);
	agregarAdelante(p,n);
	end;
end;

procedure recursivo (p:lista);

begin
if (p<>nil) then
	begin
	writeln('Valor: ',p^.dato );
	p:=p^.sig;
	recursivo (p);
	end;
end;

{procedure recursivo2 (p:lista; i:integer);

begin
while (i>0) do
	begin
	writeln('Valor: ',p[i].dato);
	recursivo2(p,i-1);
	end;
end;}

procedure recursivo2 (p:lista);

begin
if (p<>nil) then
	begin
	recursivo2 (p^.sig);
	writeln('Valor: ',p^.dato );
	end
else
	writeln('*********');
end;



var
l:lista;

BEGIN
l:=nil;
leer(l);
recursivo(l);
readkey;
recursivo2(l);
readkey;	
END.

