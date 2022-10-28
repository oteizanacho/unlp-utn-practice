
program practica4;

uses crt;

type


// ejercicio 2

{fecha = record
	anio:integer;
	mes:integer;
	dia:integer;
	end;

procedure leerCasamiento (var c:fecha);

begin
writeln('Ingrese anio del casamiento');
readln(c.anio);
if (c.anio<>2018) and (c.anio=2017) then
	begin
	writeln('Ingrese mes del casamiento');
	readln(c.mes);
	writeln('Ingrese dia del casamiento');
	readln(c.dia);	
	end;
end;}

// ejercicio 3

{info = record
	cue:integer;
	nombre:string;
	cantDocentes:integer;
	cantAlum:integer;
	localidad:string;
	end;

procedure leerEscuela (var e:info);

begin
writeln('Ingrese codigo unico de establecimiento');
readln(e.cue);
writeln('Ingrese nombre del establecimiento');
readln(e.nombre);
writeln('Ingrese cantidad de docentes');
readln(e.cantDocentes);
writeln('Ingrese cantidad de alumnos');
readln(e.cantAlum);
writeln('Ingrese localidad');
readln(e.localidad);
end;

function relacion (e:info):real;

begin
relacion:= e.cantAlum/e.cantDocentes
end;

procedure maximos (e:info; var max1,max2:real; var escuela1,escuela2:string; calculo:real);

begin
if (calculo>max1) then
	begin
	max2:=max1;
	escuela2:=escuela1;
	max1:=calculo;
	escuela1:=e.nombre;
	end
else
	if (calculo>max2) then
		begin
		max2:=calculo;
		escuela2:=e.nombre;
		end;
end;}

// ejercicio 4


{linea = record
	num:integer;
	cantMin:real;
	cantMB:real;
	end;


cliente = record
	cod:integer;
	lineas:linea;
	end;

procedure leerLinea(var l:linea);

begin
writeln('Ingrese numero del cliente');
readln(l.num);
writeln('Ingrese cantidad de minutos consumidos');
readln(l.cantMin);
writeln('Ingrese cantidad de MB consumidos');
readln(l.cantMB);
end;

procedure calculo (var c:cliente; var min,mb:real);

var
rta:char;

begin
min:=0;
mb:=0;
writeln('Ingresa linea? s/n');
readln(rta);
while (rta='s') do
	begin
	leerLinea(c.lineas);
	min:= min + (c.lineas.cantMin * 3.40);
	mb:= mb + (c.lineas.cantMB * 1.35);
	writeln('Ingresa otra linea?');
	readln(rta);
	end;
end;}

// ejercicio 5

{info = record
	localidad: string;
	apellido:string;
	cantVotos:integer;
	cantVotantes:integer;
	end;


procedure leerElecciones (var v:info);

begin
writeln('Ingrese localidad:');
readln(v.localidad);
writeln('Ingrese apellido:');
readln(v.apellido);
writeln('Ingrese cantidad de votos obtenidos:');
readln(v.cantVotos);
writeln('Ingrese cantidad de votantes:');
readln(v.cantVotantes);
end;

procedure maximos (var max1:integer; var max2: real; var nombre1,nombre2:string; v:info);

var
porcen:real;

begin
if (v.cantVotos>max1) then 
	begin
	max1:=v.cantVotos;
	nombre1:=v.apellido;
	end;
porcen:= (v.cantVotantes*100) / v.cantVotos;
if (porcen>max2) then
	begin
	max2:=porcen;
	nombre2:=v.apellido;
	end;
end;

procedure conteo (var eleccion:info);

var
max1:integer;	max2:real;	intendente1,intendente2:string;


begin
max1:=-1;
max2:=-1;
repeat
	leerElecciones(eleccion);
	maximos(max1,max2,intendente1,intendente2,eleccion);
until (eleccion.localidad='Zarate');
writeln('El intendente con mayor cantidad de votos es: ',intendente1,'.');
writeln('El intendente que obtuvo mayor porcentaje de votos es: ',intendente2,'.');
end;}

// ejercicio 6

{info = record
	marca:string;
	linea:string;
	cores:integer;
	velocidad:real;
	nanometros:integer;
	end;

procedure leerMicro (var m:info);

begin
writeln('Ingrese cores del procesador');
readln(m.cores);
if (m.cores<>0) then
	begin
	writeln('Ingrese marca del procesador');
	readln(m.marca);
	writeln('Ingrese linea del procesador');
	readln(m.linea);
	writeln('Ingrese velocidad del procesador');
	readln(m.velocidad);
	writeln('Ingrese nanometros del procesador');
	readln(m.nanometros);
	end;
end;

procedure maximos (var max1,max2:integer;	var marca1,marca2:string; cant:integer; actual:string);

begin
if (cant>max1) then
	begin
	max2:=max1;
	marca2:=marca1;
	max1:=cant;
	marca1:=actual;
	end
else
	if (cant>max2) then
		begin
		max2:=cant;
		marca2:=actual;
		end
end;

function cumple (m:info):boolean;

begin
cumple:=(m.cores>2) and (m.nanometros<=22);
end;

function cumple2 (m:info):boolean;

begin
cumple2:=((((m.marca='intel') or (m.marca='amd')) and (m.cores>1)) and (m.velocidad>=2));
end;


procedure calculos (var proce:info);

var

cant14Nm,cantRelojes,m1,m2:integer;	actual,marca1,marca2:string;	micro:info;	

begin
m1:=-1;
m2:=-1;
cantRelojes:=0;
leerMicro(micro);
while (micro.cores<>0) do
	begin
	actual:=micro.marca;
	cant14Nm:=0;
	while (micro.cores<>0) and (micro.marca=actual) do
		begin
		if (cumple(micro)) then
			begin
			writeln('Marca: ',micro.marca,'.');
			writeln('Linea: ',micro.linea,'.');
			end;
		if (cumple2(micro)) then
			cantRelojes:=cantRelojes+1;
		if (micro.nanometros>14) then
			cant14Nm:=cant14Nm+1;
		leerMicro(micro);
		end;
	maximos(m1,m2,marca1,marca2,cant14Nm,actual);
	end;
writeln('La marca con mayor cantidad de procesadores con transistores de 14nm es: ',marca1,', y la segunda es: ',marca2,'.');
end;}


// ejercicio 7

{info = record
	nombre:string;
	uni:string;
	cantInves:integer;
	cantBecarios:integer;
	end;
	

procedure leerCentro (var c:info);

begin
writeln('Ingrese cantidad de investigadores del centro');
readln(c.cantInves);
if (c.cantInves<>0) then
	begin
	writeln('Ingrese nombre abreviado del centro');
	readln(c.nombre);
	writeln('Ingrese universidad a la que pertenece');
	readln(c.uni);
	writeln('Ingrese cantidad de becarios del centro');
	readln(c.cantBecarios);
	end;
end;

procedure maximos (var max1,max2:integer; var centro1,centro2:string; cant:integer; nombre:string);

begin
if (cant>max1) then
	begin
	max2:=max1;
	centro1:=centro2;
	max1:=cant;
	centro1:=nombre;
	end
else
	if (cant>max2) then
		begin
		max2:=cant;
		centro2:=nombre;
		end;
end;

procedure maxInvestigadores (var max:integer; var nombre:string; cant:integer; nuevo:string);

begin
if (cant>max) then
	begin
	max:=cant;
	nombre:=nuevo;
	end;
end;



procedure procesoInformacion (var centro:info);

var
cantCentros,maximo1,maximo2,maxInves,totalInves:integer;	nombre1,nombre2,actual,uni:string;

begin
maximo1:=-1;
maximo2:=-1;
leerCentro(centro);
while (centro.cantInves<>0) do
	begin
	actual:=centro.uni;
	maxInves:=-1;
	totalInves:=0;
	cantCentros:=0;
	while (centro.cantInves<>0) and (actual=centro.uni) do
		begin
		cantCentros:=cantCentros+1;
		maximos(maximo1,maximo2,nombre1,nombre2,centro.cantBecarios,centro.nombre);
		maxInvestigadores(maxInves,uni,centro.cantInves,centro.uni);
		totalInves:=totalInves+centro.cantInves;
		leerCentro(centro);
		end;
	maxInvestigadores(maxInves,uni,totalInves,actual);
	writeln('La cantidad total de centros para la universidad ',actual,' es: ',cantCentros,'.');
	end;
writeln('La universidad con mayor cantidad de investigadores es: ',uni,'.');
writeln('El centro con mayor cantidad de becarios es: ',nombre1,', y el segundo es: ',nombre2,'.');
end;}


// ejercicio 8

{doc = record
	dni:integer;
	nombre:string;
	apellido:string;
	email:string;
	end;



info = record
	cod:integer;
	titulo:string;
	docente:doc;
	cantAlum:integer;
	nombre:string;
	localidad:string;
	end;

procedure leerDocente ( var c:doc);

begin
writeln('Ingrese dni del docente');
readln(c.dni);
writeln('Ingrese nombre del docente');
readln(c.nombre);
writeln('Ingrese apellio del docente');
readln(c.apellido);
writeln('Ingrese mail del docente');
readln(c.email);
end;



procedure leerProyecto (var p:info);

begin
writeln('Ingrese codigo del proyecto');
readln(p.cod);
if (p.cod<>-1) then
	begin
	writeln('Ingrese titulo del proyecto');
	readln(p.titulo);
	writeln('Ingrese cantidad de alumnos del proyecto');
	readln(p.cantAlum);
	writeln('Ingrese nombre de la escuela');
	readln(p.nombre);
	writeln('Ingrese localidad del proyecto');
	readln(p.localidad);
	leerDocente(p.docente);
	end;
end;

function cumple(num:integer):boolean;

var
par,impar,dig:integer;

begin
par:=0;
impar:=0;
while (num<>0) do
	begin
	dig:= num mod 10;
	if ((dig mod 2) =0) then
		par:=par+1
	else
		impar:=impar+1;
	num:=num div 10;
	end;
cumple:=(par=impar);
end;

procedure maximos(var max1,max2:integer; cant:integer; var nom1,nom2:string; nuevo:string);

begin
if (cant>max1) then
	begin
	max2:=max1;
	nom2:=nom1;
	max1:=cant;
	nom1:=nuevo;
	end
else
	if (cant>max2) then
		begin
		max2:=cant;
		nom2:=nuevo;
		end;
end;

procedure procesarProyecto(var proyecto:info);

var
localActual,escuActual,nombre1,nombre2:string; totalEsc,escXLocal,alumnos,max1,max2:integer;

begin
max1:=-1;					//
max2:=-1;					//maximos para el punto b
totalEsc:=0;								// total de escuelas 
leerProyecto(proyecto);
while (proyecto.cod<>-1) do					// corte de control por codigo
	begin
	escXLocal:=0;							// escuelas por localidad 
	localActual:=proyecto.localidad;		// localidad actual
	while (proyecto.cod<>-1) and (proyecto.localidad=localActual) do			// corte de control por localidad
		begin		
		alumnos:=0;						// contador de alumnos
		escXLocal:=escXLocal+1;				// escuelas por localidad
		escuActual:=proyecto.nombre;		// escuela actual
		while (proyecto.cod<>-1) and (proyecto.localidad=localActual) and (proyecto.nombre=escuActual) do			// corte de control por escuela 
			begin
			alumnos:=alumnos+proyecto.cantAlum;		// acumulador de alumnos por escuela 
			if (proyecto.localidad='daireaux') and (cumple(proyecto.cod)) then
				writeln('Titulo: ',proyecto.titulo);
			end;
		end;
	maximos(max1,max2,alumnos,nombre1,nombre2,escuActual);
	writeln('La cantida de escuelas en la localidad ',localActual,' es de: ',escXLocal,'.');
	totalEsc:=totalEsc+escXLocal;			// total de escuelas
	end;
writeln('La escual con mayor cantidad de alumnos participanes es: ',nombre1,', y la segunda es: ',nombre2,'.');
writeln('La cantidad total de escuelas es de: ',totalEsc,'.');
end;}



var 

// ejercicio 2		casamiento:fecha;	verano:integer;		dias:integer;

// ejercicio 3		escuela:info;	i,cant:integer;		max1,max2,calculo:real;		escuela1,escuela2:string;

// ejercicio 4		clientes:cliente; 	cantMin,cantMB:real;	i:integer;

// ejercicio 5		elecciones:info;	

// ejercicio 6		procesadores:info;

// ejercicio 7		centros:info;

// ejercicio 8		informacion:info;




BEGIN

// ejercicio 2

{verano:=0;
dias:=0;
leerCasamiento(casamiento);
while (casamiento.anio<>2018) and (casamiento.anio=2017) do 
	begin
	if (casamiento.mes>=1) and (casamiento.mes<=3) then
		verano:=verano+1;
	if (casamiento.dia<=10) then
		dias:=dias+1;
	leerCasamiento(casamiento);
	end;
writeln('La cantidad de casamientos realizados en verano fue de: ',verano,'.');
writeln('La cantidad de casamientos realizados en los primero 10 dias fue de: ',dias,'.');}

// ejercicio 3

{cant:=0;
max1:=-1;
max2:=-1;
for i:=1 to 2400 do
	begin
	leerEscuela(escuela);
	calculo:=relacion(escuela);
	if (escuela.localidad='la plata') then
		if (calculo>23435) then
			cant:=cant+1;
	maximos(escuela,max1,max2,escuela1,escuela2,calculo);
	end;
writeln('La cantidad de escuelas de La Plata que superan el promedio son: ',cant,'.');
writeln('La escuela con mejor relacion es: ',escuela1,', y la segunda mejor es: ',escuela2,'.');}

// ejercicio 4

{for i:=1 to 9300 do
	begin
	calculo(clientes,cantMin,cantMB);
	writeln('La cantidad a facturar por los minutos consumidos es: ',cantMin :4:2,'.');
	writeln('La cantidad a facturar por los MB consumidos es: ',cantMB :4:2,'.');
	end;}
	
// ejercicio 5


//conteo(elecciones);


// ejercicio 6

//calculos(procesadores);


// ejercicio 7

//procesoInformacion(centros);

// ejercicio 8

//procesarProyecto(informacion);



END.

