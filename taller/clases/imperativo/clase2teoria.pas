program untitled;

uses crt;

type 

lista = ^nodo;

nodo = record
	dato:integer;
	sig:lista;
	end;
	
arbol = ^nodoA;

nodoA = record
	dato:integer;
	HI:arbol;
	HD:arbol;
	end;
	

procedure sumar (var total:integer; l:lista);

begin
if (l<>nil) then
	begin
	total:= total+l^.dato;
	l:=l^.sig;
	sumar(total,l);
	end;
end;

{procedure suma (l:lista; var sum:integer);
begin
if (l=nil) then
	sum:=0;
else
	begin
	suma(l^.sig,sum);
	sum:=sum+l^.dato;
	end;
end;
}

function factorial (n:integer):integer;

begin
if (n=0) then
	factorial:=1
else
	factorial:=n*factorial(n-1);
end;

procedure duplicar (a:arbol);

begin
if (a<>nil) then
	begin
	a^.dato:=a^.dato*2;
	duplicar(a^.HI);
	duplicar(a^.HD);
	end;
end;

procedure imprimirArbol (a:arbol);

begin
if (a<>nil) then
	begin
	if (a^.dato>=10) then
		if (a^.dato<=20) then
			begin
			writeln(a^.dato);
			imprimirArbol (a^.HI);
			imprimirArbol (a^.HD);
			end
		else
			imprimirArbol (a^.HI)
	else
		imprimirArbol (a^.HD);
	end;
end;

var
p:lista;
cuenta:integer;

BEGIN
p:=nil;
cuenta:=0;
sumar(cuenta,p);
writeln('El resultado es: ',cuenta);
readkey;
END.

