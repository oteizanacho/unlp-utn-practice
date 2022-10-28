
program TP5EJ9;

uses crt;

const

tam=500;

type

vector = array [1..tam] of string;

procedure leer (var v:vector; var dim:integer);
var
nombre:string;
begin
	dim:=0;
	writeln('Ingrese nombre');
	readln(nombre);
	while (dim<=tam)and(nombre<>'zzz') do
		begin
		dim:=dim+1;
		v[dim]:=nombre;
		writeln('Ingrese nombre');
		readln(nombre);
		end;
end;

procedure existe (v:vector; nom:string; var pos:integer; var esta:boolean; dim:integer);
var
i:integer;
begin
	esta:=false;
	i:=1;
	while (i<=dim) and (esta=false) do
		begin
			if (nom=v[i]) then
				begin
				esta:=true;
				pos:=i;			//me devuelve la posicion en la q se encontro el dato
				end
			else	
				i:=i+1;
		end;
end;

procedure eliminar (var v:vector;var dim: integer;var ok:boolean);
var
nombre:string;
i,j:integer;		//j es la pos
esta:boolean;
begin
	writeln('Ingrese nombre a eliminar');
	readln(nombre);
	existe(v,nombre,j,esta,dim);
	if (j<=tam) and (esta) then		 
		begin
		for i:=j to (dim-1) do
			v[i]:= v[i+1];
		ok:=true;
		dim:=dim-1;
		end
	else
		writeln('No se pudo eliminar');
end;

procedure insertar (var v:vector; nom:string; var dim:integer; var pude:boolean);
var
i:integer;
begin
	pude:=false;
	if ((dim+1)<=tam) then
		begin
		for i:=dim downto 4 do 
			v[i+1]:=v[i];
		pude:=true;
		v[4]:=nom;
		dim:=dim+1
		end;
end;

procedure agregar (var v:vector; nom:string; var dim:integer; var pude:boolean);
begin
	pude:=false;
	if ((dim+1)<=tam) then
		pude:=true;
		dim:=dim+1;
		v[dim]:=nom;
end;

var

vec:vector;
nombre:string;
dimL:integer;
ok:boolean;


BEGIN

leer(vec,dimL);
eliminar(vec,dimL,ok);
writeln('Ingrese nombre a insertar');
readln(nombre);
insertar(vec,nombre,dimL,ok);
if (ok) then
	writeln('Valor insertado')
else
	writeln('No se pudo insertar');
writeln('Ingrese nombre a agregar');
readln(nombre);
agregar(vec,nombre,dimL,ok);
if (ok) then
	writeln('Valor agregado')
else
	writeln('No se pudo agregar valor');
readkey;
END.

