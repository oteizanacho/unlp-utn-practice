program ejercicio5;

uses crt;

const
dimF=20;

type

vector = array [1..dimF] of integer;

procedure cargar (var v:vector);
var
i:integer;

begin
for i:=1 to dimF do
	begin
	writeln('Ingrese un numero entero');
	readln(v[i]);
	end;
end;

function maximo (v;vector; i:integer):integer;
var
max:integer;

begin
if (i=dimF) then
	maximo:=v[i];
else 
	begin
	max:=maximo(v,i+1);
	if (max>v[i]) then
		maximo:=max;
	else
		maximo:=v[i];	
	end;
end;	


function sumarLista (l:lista);

begin
if (l=nil) then 
	sumarLista:=0
else
	sumarLista:= l^.dato + sumarLista(l^.sig);
end;

var
vec:vector;


BEGIN
cargar(vec);
	
END.

