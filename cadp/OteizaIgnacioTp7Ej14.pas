program TP7Ej14;

uses crt;

type

datos = record
		cod:integer;
		dia:integer;
		facultad:string;
		transporte:integer;
		end;
		
lista = ^nodo;

nodo = record
		elem:datos;
		sig:lista;
		end;

alumnos = array [1..1300] of lista;

tabla = array [1..5] of real;			//tabla de precios

medios = array [1..5] of integer;  		//medios de transporte

procedure leer (var d:datos);

begin

writeln('Ingrese codigo de alumno');
readln(d.cod);
if (d.cod<>-1) then 
	begin
	writeln('Ingrese dia del mes');
	readln(d.dia);
	writeln('Ingrese facultad');
	readln(d.facultad);
	writeln('Ingrese tipo de transporte');
	readln(d.transporte);
	end;
end;

procedure inicializar (var v:alumnos);

var
i:integer;

begin

for i:=1 to 1300 do
	v[i]:=nil
end;

procedure agregarAdelante (var v:alumnos; n:datos);
var
aux:lista;

begin

new(aux);
aux^.elem:=n;
aux^.sig:=nil;

if (v[n.cod]=nil) then
	v[n.cod]:=aux
else
	aux^.sig:=v[n.cod];
	v[n.cod]:=aux;
end;

procedure puntoAyB(v:alumnos; tab:tabla);

var
viajes,cantV,cantT,dia,i,transp:integer;
total:real;

begin
cantT:=0;
cantV:=0;
for i:=1 to 1300 do 
	begin
	while (v[i]<>nil) do
		begin
		dia:=v[i]^.elem.dia;
		total:=0;
		viajes:=0;
		while (v[i]<>nil) and (v[i]^.elem.dia = dia) do
			begin
			viajes:=viajes+1;
			transp:=v[i]^.elem.transporte; 		//tipo de transporte usado	
			total:=total + tab[transp];
			v[i]:=v[i]^.sig;		
			end;
		if (viajes>6) then
			cantV:=cantV+1;
		if (total>80) then
			cantT:=cantT+1;
		end;
	end;
writeln('La cantidad de alumnos que realizan mas de 6 viajes por dia es de: ',cantV);
writeln('La cantidad de alumnos que gasta mas de $80 por dia es de: ',cantT);
end;

procedure puntoD(v:alumnos);

var
i,j,transp,cant,combinaciones:integer;
viajes:medios;
bici:boolean;

begin
combinaciones:=0;
for i:=1 to 1300 do
	begin
	cant:=0;
	bici:=false;
	for j:=1 to 5 do 
		viajes[j]:=0;
	while (v[i]<>nil) do
		begin
		transp:=v[i]^.elem.transporte;
		viajes[transp]:=1;
		if (transp=5) then
			bici:=true;
		v[i]:=v[i]^.sig;
		end;
	for j:=1 to 5 do
		cant:=cant+viajes[j];
	if (cant>=2) and (bici) then
		combinaciones:=combinaciones+1;	
	end;
writeln('La cantidad de alumnos que combinan bicicleta con otro transporte es de: ',combinaciones);
end;

procedure puntoC(var med:medios; v:alumnos);
var
i,j,transp:integer;

begin

for j:=1 to 5 do
	med[j]:=0;
for i:=1 to 1300 do 
	begin
	while (v[i]<>nil) do 
		begin
		transp:=v[i]^.elem.transporte;
		med[transp]:=med[transp]+1;
		v[i]:=v[i]^.sig		
		end;
	//ordeno vector de mayor a menor e imprimo 2
	end;
end;




var

dat:datos;
vec:alumnos;
t:tabla;
m:medios;
BEGIN

inicializar(vec);
leer(dat);
while (dat.cod<>-1) do
	begin
	agregarAdelante(vec,dat);
	leer(dat);	
	end;
puntoAyB(vec,t);
puntoC(medios,vec);	
puntoD(vec);
END.
