program tp7Ej5;

uses crt;

type


datos = record 
		nombre: string;
		duracion: integer;
		costoCons: real;
		costoMant: real;
		rango:integer;
		end;
		
lista = ^sonda;

sonda = record
		elem: datos;
		sig:lista;
		end;
		
rangos = array [1..7] of lista; 


procedure maxima (n:datos; var max:datos);
var
costoTotal:real;
begin
	costoTotal:= n.costoCons + n.costoMant;
	if ((max.costoCons + max.costoMant) < costoTotal) then 
		max:=n
end;





procedure agregar (n:datos; var v:rangos);		//agregar adelante
var
aux:lista;

begin
	new(aux);
	aux^.elem := n;
	aux^.sig := nil;
	if (v[n.rango] = nil) then
		v[n.rango] := aux
	else
		begin
		aux^.sig := v[n.rango];
		v[n.rango] := aux;
	end;
end;

procedure leer (var v:rangos; var totalSondas:integer; var duracionTotal:integer; var costoTotal:real);

var

nodo:datos;

begin

	repeat
		writeln('Ingrese nombre de la sonda');
		readln(nodo.nombre);
		writeln('Ingrese duración estimada de la misión');
		readln(nodo.duracion);
		writeln('Ingrese el costo de construcción de la sonda');
		readln(nodo.costoCons);
		writeln('Ingrese el costo de mantenimiento de la sonda');
		readln(nodo.costoMant);
		writeln('Ingrese categoría del rango a estudiar');
		readln(nodo.rango);
		agregar(nodo,v);
		totalSondas:= totalSondas + 1;
		duracionTotal:= duracionTotal + nodo.duracion;
		costoTotal:= costoTotal + nodo.costoCons;
		until (nodo.nombre = 'GAIA');
end;

procedure inicializar (var p:rangos);
var
i:integer;
begin
	for i:= 1 to 7 do
		p[i]:=nil;
end;

procedure recorrer (p:rangos; pDur:real ; pCos:real);
var
i,cantDur,cant:integer;
aux:lista;
nodoMax:datos;
begin
i:=1;
cantDur:=0;
nodoMax.costoCons:= 0;		//le doy valores para que no de error cuando trate de comparar
nodoMax.costoMant:= 0;
while (i<=7) do
	begin
	cant:=0;			//para saber la cantidad de sondas en cada rango
	aux:= p[i];
	while (aux<>nil) do
		begin
		if (aux^.elem.duracion > pDur) then
			cantDur:=cantDur + 1; 					//cantidad de sondas que superan la duracion promedio
		if (aux^.elem.costoCons > pCos) then
			writeln('La sonda', aux^.elem.nombre, ' supera el costo promedio de construccion');
		maxima(aux^.elem,nodoMax);
		aux := aux^.sig;
		cant:=cant +1;
		end;
	writeln('La cantidad de sondas en el rango ',i,'son : ',cant);
	i:= i+1;
	end;
writeln('La cantidad de sondas cuya duracion supera el promedio de duraciones es: ',cantDur);
writeln('La sonda mas costosa es: ',nodoMax.nombre);
end;


var

L:rangos;
totalS:integer; 	//total de sondas
costo:real; 		// costo de construccion
duracion:integer; 	//duracion de la sonda
promDur,promCosto:real; 		//promedios

BEGIN
inicializar (L);
leer(L,totalS,duracion,costo);	
promDur:= (duracion * 100) / totalS;
promCosto:= (costo*100) / totalS;
recorrer(L,promDur,promCosto);
	
END.

