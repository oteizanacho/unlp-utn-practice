program practica1ej1;

uses crt;

const 
dimF=300;

type

datos = record
	cod:integer;
	dni:integer;
	valor:real;
	end;
	
oficinas = array [1..dimF] of datos;


procedure agregar (var v:oficinas; d:datos; var dim:integer);
begin
dim:=dim+1;
v[dim]:=d;
end;


procedure leer (var d:datos);

begin
writeln('Ingrese codigo de identificacion');
readln(d.cod);
if (d.cod<>-1) then
	begin
	writeln('Ingrese dni del propietario');
	readln(d.dni);
	writeln('Ingrese valor de la expensa');
	readln(d.valor);
	end;
end;

procedure ordenar (var v:oficinas; dim:integer);

var
i,j:integer;
actual:datos;

begin
for i:=2 to dim do
	begin
	actual:=v[i];
	j:=i-1;
	while (j>0) and (v[j].cod>actual.cod) do
		begin
		v[j+1]:= v[j];
		j:=j-1;		
		end;
	v[j+1]:=actual;	
	end;
end;

procedure imprimir (v:oficinas;dim:integer);

var
i:integer;

begin
for i:=1 to dim do
	begin
	writeln('Codigo: ',v[i].cod);
	writeln('DNI: ',v[i].dni);
	writeln('Valor: ',v[i].valor: 6: 2);
	writeln('*********************');
	end;
end;

var

vector:oficinas;
data:datos;
dimL:integer;

BEGIN
dimL:=0;
leer(data);
while (data.cod<>-1) and (dimL<dimF) do
	begin
	agregar(vector,data,dimL);
	leer(data);
	end;
imprimir(vector,dimL);
readkey;
ordenar(vector,dimL);
imprimir(vector,dimL);
readkey;
END.

