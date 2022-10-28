program TP7Ej7;

uses crt;

datos = record
		dni:integer;
		apellido:string;
		nombre:string;
		nota:real;
		end;
		
lista = ^ nodo;

nodo = record
		elem:datos;
		sig:lista;
		end;

vector = array [1..5] of lista; 

procedure inicializar (var v:vector);
var 
i:integer;
begin
	for i:=1 to 5 do
		v[i]:=nil;
end;

procedure asignarTurno (var v:vector; n:lista; i:integer);
begin
	if (v[i]=nil) then
		v[i]:=n;
	else
		n^.sig:=v[i];
		v[i]:=n;	
end;

function turno(c:integer):integer;
begin
	if((c mod 2) = 0) then
		turno:=1
	else
		turno:=4
end;


procedure recorrer (l:lista; var v:vector);
var
cant:integer;
begin
cant:=0;
while (l <> nil) do
	if (l^.elem.nota >= 8) then
		asignarTurno(v,l,turno(cant));
	else
		if (l^.elem.nota >= 5) and (l^.elem.nota <8) then
				asignarTurno(v,l,);

end;

BEGIN

turnos:vector;
	
END.

