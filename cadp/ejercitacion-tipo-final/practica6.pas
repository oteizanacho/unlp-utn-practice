program practica8;

uses crt;


type

// ejercicio 5


{data = record
	nombre:string;
	duracion:integer;
	costo:real;
	mantenimiento:real;
	rango:integer;
	end;

lista = ^ sonda;



sonda = record
	datos:data;
	sig:lista;
	end;
	
vector = array [1..7] of lista;


procedure leerSonda (var d:data);

begin
writeln('Ingrese nombre de la sonda');
readln(d.nombre);
writeln('Ingrese duracion de la sonda');
readln(d.duracion);
writeln('Ingrese costo de construccion de la sonda');
readln(d.costo);
writeln('Ingrese costo de mantenimiento de la sonda');
readln(d.mantenimiento);
writeln('Ingrese rango de espectro de la sonda');
readln(d.rango);
end;

procedure agregarAdelante (var v:vector; d:data);

var
aux:lista;

begin
new(aux);
aux^.datos:=d;
aux^.sig:=nil;

if (v[d.rango]=nil) then
	v[d.rango]:=aux
else
	begin
	aux^.sig:=v[d.rango];
	v[d.rango]:=aux;
	end;
end;

procedure maximoCostos (l:lista; var maximo:real; var sonda:string);

begin
if ((l^.datos.costo + l^.datos.mantenimiento)> maximo) then
	begin
	maximo:=l^.datos.costo + l^.datos.mantenimiento;
	sonda:=l^.datos.nombre;
	end;
end;

procedure iniciarVector(var v:vector);

var
i:integer;

begin
for i:=1 to 7 do
	v[i]:=nil
end;

function duracion (prom:real ; dura:integer):boolean;

begin
duracion:=dura>prom;
end;

function costoCons(prom:real; costo:real):boolean;

begin
costoCons:=costo>prom;
end;

procedure procesarDatos (promD,promC:real; var v:vector);

var
max:real;	sonda1:string;	i,cantDuracion,cant:integer;	aux:lista;


begin
max:=-1;
cantDuracion:=0;
iniciarVector(v);
i:=1;
while (i<=7) do
	begin
	cant:=0;
	aux:=v[i];
	while (aux<>nil) do
		begin
		cant:=cant+1;
		if (duracion(promD,aux^.datos.duracion)) then
			cantDuracion:=cantDuracion+1;
		if (costoCons(promC,aux^.datos.costo)) then
			writeln('La sonda ',aux^.datos.nombre,' supera los costos de construccion promedios.');
		maximoCostos(aux,max,sonda1);
		aux:=aux^.sig;
		end;
	writeln('La cantidad de sondas en el rango ',i,' son: ',cant,'.');
	i:=i+1;
	end;
writeln('La sonda mas costosa es: ',sonda1);
writeln('La cantidad de sondas que superan la duracion promedio es de: ',cantDuracion,'.');
end;

procedure agregarSonda (var vec:vector; var promDuracion,promCosto:real);

var
datos:data; cantSondas,contDuracion:integer;	contCostoCons:real;

begin
cantSondas:=0;
contDuracion:=0;
contCostoCons:=0;
repeat
	leerSonda(datos);
	cantSondas:=cantSondas+1;
	agregarAdelante(vec,datos);
	contDuracion:=contDuracion+datos.duracion;
	contCostoCons:=contCostoCons+datos.costo;	
until (datos.nombre = 'GAIA');
promDuracion:=(contDuracion * 100) / cantSondas;
promCosto:=(contCostoCons * 100) / cantSondas;
end;}


// ejercicio 7

{datos = record
	dni:integer;
	apellido:string;
	nombre:string;
	nota:real;
	end;

lista= ^alumno;

alumno = record
	elem:datos;
	sig:lista;
	end;
	
turnos = array [1..5] of lista;

contador = array [1..5] of integer;

procedure inicializarContador (var v:contador);

var
i:integer;

begin
for i:=1 to 5 do
	v[i]:=0;
end;

procedure inicializarTurnos (var v:turnos);

var
i:integer;

begin
for i:=1 to 5 do
	v[i]:=nil;
end;

procedure asignarTurno1 (var vec1:turnos; l:lista; var vec2:contador);

begin
if (vec2[1] <= vec2[4]) then
	begin
	if (vec1[1]=nil) then
		vec1[1]:=l
	else
		begin
		l^.sig:=vec1[1];
		vec1[1]:=l;
		end;
	end
else
	if (vec1[4] = nil) then
		vec1[4]:=l
	else
		begin
		l^.sig:=vec1[4];
		vec1[4]:=l;
		end;
end;

procedure asignarTurno2 (var vec1:turnos; l:lista; var vec2:contador);

begin
if (vec2[2] <= vec2[3]) and (vec2[2] <= vec2[5]) then
	begin
	if (vec1[2]=nil) then
		vec1[2]:=l
	else
		begin
		l^.sig:=vec1[2];
		vec1[2]:=l;
		end;
	end
else
	if (vec2[3] <= vec2[2]) and (vec2[3] <= vec2[5]) then
		begin
		if (vec1[3]=nil) then
		vec1[3]:=l
	else
		begin
		l^.sig:=vec1[3];
		vec1[3]:=l;
		end;
	end
else
	if (vec2[5] <= vec2[2]) and (vec2[5] <= vec2[3]) then
		begin
		if (vec1[5]=nil) then
		vec1[5]:=l
	else
		begin
		l^.sig:=vec1[5];
		vec1[5]:=l;
		end;
	end
end;







procedure recorrer (l:lista; var vecTurnos:turnos; var vecCont:contador);

begin
while (l<>nil) do
	begin
	if (l^.elem.nota>=8) then
		asignarTurno1(vecTurnos,l,vecCont)
	else
		if (l^.elem.nota>=5) and (l^.elem.nota<8) then
			asignarTurno2(vecTurnos,l,vecCont);
	l:=l^.sig;
	end;
end;}


// ejercicio 11

{datos = record
	num:integer;
	ape:string;
	prom:real;
	end;

lista = ^alumno;

alumno = record
	elem:datos;
	sig:lista;
	end;

procedure agregarOrdenado(var l:lista; d:datos);

var
aux,act,ant:lista;

begin
new(aux);
aux^.sig:=nil;
aux^.elem:=d;
act:=l;
ant:=l;

while (act<>nil) and (act^.elem.prom > aux^.elem.prom) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act=ant) then
	l:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;	
end;

procedure leerEgresado (var d:datos);

begin
writeln('Ingrese numero de alumno del egresado');
readln(d.num);
if (d.num<>0) then
	begin
	writeln('Ingrese apellido del egresado');
	readln(d.ape);
	writeln('Ingrese promedio del egresado');
	readln(d.prom);
	end;
end;

procedure cargarDatos (var l:lista);

var
egresado:datos;

begin
leerEgresado(egresado);
while (egresado.num<>0) do
	begin
	agregarOrdenado(l,egresado);
	leerEgresado(egresado);
	end;
end;

procedure imprimir (l:lista);

var
i:integer;

begin
for i:=1 to 10 do
	begin
	writeln('El alumno de apellido ',l^.elem.ape,', de promedio ',l^.elem.prom :4:2,', recibira el premio.');
	l:=l^.sig;	
	end;
end;}

// ejercicio 9

{datos = record
	cod:integer;
	titulo:string;
	genero:integer;
	puntaje:real;
	end;

lista = ^pelicula;

pelicula = record
	elem:datos;
	sig:lista;
	end;
	
generos = array [1..8] of real;

datos2 = record
	dni:integer;
	ape:string;
	nom:string;
	cod:integer;
	puntaje:real;
	end;

procedure inicializar (var v:generos);

var 
i:integer;

begin
for i:=1 to 8 do	
	v[i]:=0;
end;

procedure maximos (var v:generos; num:integer; pun:real);

begin
if (v[num]<pun) then
	v[num]:=pun;
end;

procedure buscarPelicula (l:lista; cod:integer; puntaje:real; var v:generos);

begin

while (l<>nil) and (l^.elem.cod <> cod) do
	l:=l^.sig;

if (l<>nil) and (l^.elem.cod = cod) then
	begin
	l^.elem.puntaje:=puntaje;
	maximos(v,l^.elem.genero,puntaje);
	end;
end;

function cumple (num:integer):boolean;

var
dig,par,impar:integer;

begin
par:=0;
impar:=0;
while (num<>0) do
	begin
	dig:= num mod 10;
	if ((dig mod 2) = 0) then
		par:=par+1
	else
		impar:=impar+1;
	num:= num div 10;	
	end;
cumple:=(par=impar);
end;

procedure leerCritica (var d:datos2);

begin
writeln('Ingrese codigo de la pelicula');
readln(d.cod);
if (d.cod<>-1) then
	begin
	writeln('Ingrese dni del critico');
	readln(d.dni);
	writeln('Ingrese apellido del critico');
	readln(d.ape);
	writeln('Ingrese nombre del critico');
	readln(d.nom);
	writeln('Ingrese puntaje otorgado');
	readln(d.puntaje);
	end;
end;

procedure actualizarPuntajes (var l:lista; var vec:generos);

var
critica:datos2;	actual:integer;	pun,prom:real;	cant:integer;

begin
leerCritica(critica);
while (critica.cod<>-1) do
	begin
	actual:=critica.cod;
	pun:=0;															// acumulo los puntajes orotgados
	cant:=0;														// cantidad de criticas leidas
	while (critica.cod<>-1) and (actual = critica.cod) do
		begin
		pun:=pun + critica.puntaje;
		cant:=cant+1;
		if (cumple(critica.dni)) then
			writeln('El critico ',critica.nom,', ',critica.ape,' tiene igual digito de pares que impares');
		leerCritica(critica);
		end;
	prom:= pun / cant;
	buscarPelicula(l,actual,prom,vec);
	end;
end;

function codigoMax (v:generos):integer;

var
max:real;	i:integer;

begin
max:=-1;
for i:=1 to 8 do 
	begin
	if (v[i]>max) then
		begin
		max:=v[i];
		codigoMax:=i;
		end;
	end;
end;

procedure eliminar (var l:lista; num:integer; var pude:boolean);

var
act,ant:lista;

begin
act:=l;
while (act<>nil) and (act^.elem.cod<>num) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act<>nil) then
	begin
	if (act=l) then
		l:=l^.sig
	else
		ant^.sig:=act^.sig;
	dispose(act);
		end;
end;	}


// ejercicio 8

{f = record
	anio:integer;
	mes:integer;
	dia:integer;
	end;

h = record
	hora:integer;
	min:integer;
	seg:integer;
	end;


datos = record
	numOrigen:integer;
	dni:integer;
	numDestino:integer;
	fecha:f;
	hora:h;
	monto:real;
	motivo:integer;
	end;

lista = ^transferencia;

transferencia = record
	elem:datos;
	sig:lista;
	end;

codigos = array [1..7] of integer;

procedure leerHora (var d:h);

begin
writeln('Ingrese hora');
readln(d.hora);
writeln('Ingrese minutos');
readln(d.min);
writeln('Ingrese segundos');
readln(d.seg);
end;

procedure leerFecha (var d:f);

begin
writeln('Ingrese anio');
readln(d.anio);
writeln('Ingrese mes');
readln(d.mes);
writeln('Ingrese dia');
readln(d.dia);
end;

procedure leerTransfer (var d:datos);

var
hora:h;	fecha:f;

begin
writeln('Ingrese numero de cuenta de origen ');
readln(d.numOrigen);
writeln('Ingrese dni del titular de cuenta origen');
readln(d.dni);
writeln('Ingrese numero de cuenta destino');
readln(d.numDestino);
writeln('Ingrese codigo del motivo de transferencia');
readln(d.motivo);
writeln('Ingrese monto');
readln(d.monto);
leerFecha(fecha);
d.fecha:=fecha;
leerHora(hora);
d.hora:=hora;
end;

procedure insertarOrdenado(var l:lista; d:datos);

var
aux,ant,act:lista;

begin
new(aux);
aux^.elem:=d;
aux^.sig:=nil;

ant:=l;
act:=l;

while (act<>nil) and (act^.elem.numOrigen < aux^.elem.numOrigen) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act=ant) then
	l:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;
end;

function cumple (num:integer):boolean;

var
dig,par,impar:integer;

begin
par:=0;
impar:=0;
while (num<>0) do
	begin
	dig:= num mod 10;
	if ((dig mod 2) = 0) then
		par:=par+1
	else
		impar:=impar+1;
	num:= num div 10;
	end;
cumple:= par<impar;
end;

procedure contador (var v:codigos; i:integer);

begin
v[i]:=v[i]+1;
end;

procedure inicializar (var v:codigos);

var
i:integer;

begin
for i:=1 to 7 do
	v[i]:=0;
end;

procedure cargarTerceros(var l:lista; p:lista);			// p es la lista que se dispone, l es la lista de transferencias a terceros

begin
while (p<>nil) do
	begin
	if (p^.elem.numOrigen <> p^.elem.numDestino) then 
		insertarOrdenado(l,p^.elem);
	p:=p^.sig
	end;
end;

procedure maximo(v:codigos);

var
max,i,pos:integer;

begin
max:=-1;
for i:=1 to 7 do 
	begin
	if (v[i]>max) then
		begin
		max:=v[i];
		pos:=i;
		end;
	end;
writeln('El motivo con mas transferencias fue: ',pos);
end;

procedure recorrer (l:lista; var vec:codigos);			// solo trabajo con la lista de terceros

var
actual,junio:integer;	total:real;

begin
junio:=0;
while (l<>nil) do
	begin
	actual:=l^.elem.numOrigen;
	total:=0;
	while (l<>nil) and (actual = l^.elem.numOrigen) do
		begin
		total:=total+l^.elem.monto;
		contador(vec,l^.elem.motivo);
		if (l^.elem.fecha.mes = 6) and (cumple(l^.elem.numDestino)) then
			junio:=junio+1;
		l:=l^.sig;		
		end;
	writeln('El monto de la cuenta ',actual,', es de: ',total :4:2,'.');
	end;
writeln('La cantidad de transferencias en junio es de: ',junio);
maximo(vec);
end;}


// ejercicio 12

{datos = record
	version:real;
	pantalla:real;
	ram:integer;
	end;
	
lista =^ nodo;

nodo = record
	elem:datos;
	sig:lista;
	end;

function verifica (d:datos):boolean;

begin
verifica:= (d.ram>3) and (d.pantalla<=5);
end;

procedure leer (var d:datos);

begin
writeln('Ingrese version de android.');
readln(d.version);
writeln('Ingrese tamanio de pantalla.');
readln(d.pantalla );
writeln('Ingrese cantidad de RAM.');
readln(d.ram);
end;

procedure recorrido (l:lista);

var
cant:integer; 			// contador puntoA (dispositivos x version)
cont:integer; 			// contador puntoB, ram>3 y pantalla <=5
pant:real; 				// para sumar las pantallas 
total:integer;			// total de dispositivos leidos
celu:datos;
actual:real;


begin
cont:=0;			// contador general
total:=0;			// total dispositivos
while (l<>nil) do
	begin
	leer(celu);
	actual:=celu.version;	// version actual
	cant:=0;				// cont de version
	while (l<>nil) and (actual=celu.version) do
		begin
		cant:=cant+1;
		pant:=celu.pantalla;
		if (verifica(celu)) then
			cont:=cont+1;
		leer(celu);
		l:=l^.sig;
		end;
	total:=total+cant;
	writeln('La cantidad de celus para la version ',actual :4:2,' es: ',cant);
	end;
writeln('Dispositivos con mas de 3GB de RAM y pantallas de a lo sumo 5 :',cont);
writeln('El promedio de pantallas es de: ',pant/total :4:2);
end;}



// ejercicio 13

{datos = record
	mail:string;
	rol:integer;
	revista:string;
	cant:integer;
	end;
	
lista =^ nodo;

nodo = record
	elem:datos;
	sig:lista;
	end;
	
cont = array [1..4] of integer;

usuarios = array [1..3600] of datos;

procedure inicializar (var v:cont);

var
i:integer;

begin
for i:=1 to 4 do
	v[i]:=0;
end;

procedure contador (var v:cont; i:integer);

begin
v[i]:=v[i]+1;
end;


procedure minimos (var min1,min2:integer; var mail1,mail2:string; d:datos);

begin
if (d.cant<min1) then
	begin
	min2:=min1;
	mail2:=mail1;
	min1:=d.cant;
	mail1:=d.mail;
	end
else
	if (d.cant<min2) then
		begin
		min2:=d.cant;
		mail2:=d.mail;
		end;
end;

procedure insertarOrdenado(var l:lista; d:datos);

var
aux,ant,act:lista;

begin
new(aux);
aux^.elem:=d;
aux^.sig:=nil;
act:=l;
ant:=l;


while (act<>nil) and (act^.elem.cant < aux^.elem.cant) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act=ant) then
	l:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;
end;

procedure recorrido (var l:lista; var vec:cont; v:usuarios);

var
i:integer;	m1,m2:integer;	mail1,mail2:string;

begin
m1:=999;
m2:=999;
mail1:=' ';
mail2:= ' ';
for i:=1 to 3600 do
	begin
	if (v[i].revista = 'Economica') then
		insertarOrdenado(l,v[i]);
	contador(vec,v[i].rol);
	minimos(m1,m2,mail1,mail2,v[i]);
	end;
writeln('Los usuarios que hace mas tiempo no ingresan son: ',mail1,' y ',mail2,'.');
end;

procedure imprimirLista (l:lista);

begin
while (l<>nil) do
	begin
	writeln('Usuario: ',l^.elem.mail);
	writeln('Cantidad de dias inactivo: ',l^.elem.cant);
	l:=l^.sig;
	end;
end;

procedure imprimirContador (v:cont);

var
i:integer;

begin
for i:=1 to 4 do 
	writeln('Rol: ',i,', cantidad de usuarios: ',v[i]);
end;}


// ejercicio 14

{datos = record
	cod:integer;
	dia:integer;
	facultad:string;
	transporte:integer;
	end;
	
lista = ^ nodo;

nodo = record
	elem.datos;
	sig:lista;
	end;
	
alumnos = array [1..1300] of lista;

tabla = array [1..5] of real;

medios = array [1..5] of integer;			// contador 
	
	
procedure leerViaje (var d:datos);

begin
writeln('Ingrese codigo de alumno');
readln(d.cod);
if (cod<>-1) then
	begin
	writeln('Ingrese dia del mes');
	readln(d.dia);
	writeln('Ingrese facultad');
	readln(d.facultad);
	writeln('Ingrese medio de transporte');
	readln(d.transporte);
	end;
end;

procedure recorido (var v:alumnos; var cont: medios );

var
viaje:datos;	actual:integer;

begin
leerViaje(viaje);
while () do




	cont[viaje.transporte]:=cont[viaje.transporte]+1;
	
	
	
	
	

end;}


var

// ejercicio 5	v:vector; prom1,prom2:real;

// ejercicio 7	vec1:turnos;	 vec2:contador;		p:lista;

// ejercicio 11	p:lista;

// ejercicio 9	peliculas: lista;	g:generos;	cod:integer;	elimine:boolean;

// ejercicio 8	terceros,transfer:lista; vector:codigos;

// ejercicio 12	p:lista;

// ejercicio 13	p:lista;	vector:cont;	user:usuarios;

// ejercicio 14





BEGIN

// ejercicio 5

{agregarSonda(v,prom1,prom2);
procesarDatos(prom1,prom2,v)}
	
// ejercicio 7
	
// recorrer(p,vec1,vec2);
	
// ejercicio  11
	
{cargarDatos(p);
imprimir(p);}
	
// ejercicio 9

{actualizarPuntajes(peliculas,g);	
writeln('El codigo de genero que mas puntaje tuvo es: ',codigoMax(g));
writeln('Ingrese codigo a eliminar');
readln(cod);
eliminar(peliculas,cod,elimine);
if (elimine) then
	writeln('Eliminado con exito')
else
	writeln('Pelicula no encontrada');}
	
	
// ejercicio 8

{transfer:=nil;
cargarTransferencias(transfer); //se dispone
terceros:=nil;
cargarTerceros(transfer,terceros);
inicializar(vector);
recorrer(terceros,vector);	}

// ejercicio 12

{p:=nil;
recorrido(p);}

// ejercicio 13

{p:=nil;
inicializar(vector);
recorrido(p,vector,user);
imprimirLista(p);
imprimirContador(vector);}

// ejercicio 14



END.

