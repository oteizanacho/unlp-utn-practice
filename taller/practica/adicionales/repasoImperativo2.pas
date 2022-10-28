program repasoImperativo2;

uses crt;

const
dimF=300;

type 

oficina = record
	cod:integer;
	dni:integer;
	valor:real;
	end;
	
vector = array [1..dimF] of oficina;

procedure leer (var d: oficina);

begin
writeln('Ingrese codigo de oficina');
Randomize;
d.cod := Random (20);
//readln(d.cod);
if (d.cod<>0) then
	begin
	writeln('Ingrese dni del propietario');
	d.dni := Random(9);
	//readln(d.dni);
	writeln('Ingrese valor de la expensa');
	d.valor := Random(1000);
	//readln(d.valor);
	clrscr;
	end;
end;

procedure cargarVector(var v:vector; var i:integer);

var
p:oficina;

begin
leer(p);
i:=0;
while (p.cod<>-0) and (i<=dimF) do
	begin
	i:=i+1;
	v[i]:=p;
	leer(p);		
	end;
end;

procedure insercion (var v:vector; dim:integer);

var
j,i:integer;
actual:oficina;

begin
for i:=2 to dim do
	begin
	actual:=v[i];
	j:=i-1;
	while (j>0) and (v[j].cod > actual.cod) do
		begin
		v[j+1]:=v[j];
		j:=j-1;
		end;
	v[j+1]:=actual;
	end;
end;

procedure imprimir (v:vector; dim:integer);

var
i:integer;

begin
for i:=1 to dim do 
	begin
	writeln('Codigo: ', v[i].cod);
	writeln('---------------------');
	writeln('DNI: ', v[i].dni);
	writeln('---------------------');
	writeln('Valor: ', v[i].valor:8:4);
	writeln('---------------------');
	readkey;
	clrscr;
	end;
end;

procedure busqueda (v:vector; dim:integer; cod:integer);

var
centro,inf,sup:integer;
control:boolean;

begin
inf:=0;
sup:= dim-1;
control:= True;

while (control) and (inf<=sup) do
	begin
	centro:= (((sup - inf) div 2) + inf);
	if (v[centro].cod = cod) then
		begin
		writeln('Encontrado. DNI: ', v[centro].dni);
		control:=False;
		end
	else
		if (cod < v[centro].cod) then
			sup:= centro -1
		else
			inf:= centro+1
	end;
end;

var 

vec:vector;
dimL,c:integer;

BEGIN

cargarVector(vec,dimL);
writeln('Lista sin ordenar');
imprimir(vec,dimL);
readkey;
clrscr;
insercion(vec,dimL);
writeln('Lista ordenada');
imprimir(vec,dimL);
readkey;
clrscr;
writeln('Ingrese codigo para la busqueda');
readln(c);
busqueda(vec,dimL,c);


END.

