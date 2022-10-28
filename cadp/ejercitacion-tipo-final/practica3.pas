
program practica3;

uses crt;


type

// ejercicio 9

{producto = record
	precio:real;
	cod:integer;
	tipo:string;
	end;}

// ejercicio 13

{info = record
	nombre:string;
	radio:real;
	distancia:real;
	end;}

// ejercicio 17

info = record
	cantidadHectareas:real;
	tipoZona:integer;
	localidad:string;
	end;


// ejercicio 8

{function esdoble(numA,numB:integer):boolean;

begin
esdoble:=((numB/2)=numA);
end;

procedure leerPares(var pares,dobles:integer);

var
num1,num2:integer;

begin
writeln('Ingrese un numero');
readln(num1);
writeln('Ingrese otro numero');
readln(num2);
while (num1<>0) or (num2<>0) do
	begin
	pares:=pares+1;
	if (esdoble(num1,num2)) then
		dobles:=dobles+1;
	writeln('Ingrese un numero');
	readln(num1);
	writeln('Ingrese otro numero');
	readln(num2);
	end;
end;}

// ejercicio 9

{procedure masBarato(var min:real; var cod:integer; prod:producto);

begin
if (prod.precio<min) then
	begin
	min:=prod.precio;
	cod:=prod.cod;
	end;
end;

procedure masCaro(var max:real; var cod:integer; prod:producto);

begin
if (prod.precio>max) then
	begin
	max:=prod.precio;
	cod:=prod.cod;
	end;
end;

procedure leerProducto(var p:producto);

begin
writeln('Ingrese precio del producto');
readln(p.precio);
writeln('Ingrese codigo del producto');
readln(p.cod);
writeln('Ingrese tipo de producto');
readln(p.tipo);
end;}

// ejercicio 10

{procedure digitos(num:integer; var cant:integer; var suma:integer);

var
dig:integer;

begin
while (num<>0) do
	begin
	dig:= num mod 10;
	cant:=cant+1;
	suma:=suma+dig;
	num:=num div 10;
	end;
end;}

// ejercicio 11

{procedure digitos (num:integer);

var
dig,pares,impares:integer;

begin
pares:=0;
impares:=0;
while (num<>0) do
	begin
	dig:=num mod 10;
	if ((dig mod 2)=0) then
		pares:=pares+dig
	else
		impares:=impares+dig;
	num:=num div 10;
	end;
writeln('La suma de digitos pares es: ',pares,'.');
writeln('La suma de digitos impares es: ',impares,'.');
end;}


// ejercicio 12

{function suma (mayor,menor:integer):integer;

var
total:integer;

begin
total:=0;
while (menor<=mayor) do
	begin
	total:=total+menor;
	menor:=menor+1;	
	end;
suma:=total;
end;


function producto(mayor,menor:integer):integer;

var
total:integer;

begin
total:=1;
while (menor<=mayor) do
	begin
	total:= total * menor;
	menor:=menor+1
	end;
producto:=total;
end;}

// ejercicio 13

{procedure calculos (radio:real; var diametro,perimetro:real);

begin
diametro:=radio*2;
perimetro:=diametro*3.14;
end;

procedure leerPlaneta (var p:info);

begin
writeln('Ingrese nombre del planeta');
readln(p.nombre);
writeln('Ingrese radio');
readln(p.radio);
writeln('Ingrese distancia');
readln(p.distancia);
end;}

// ejercicio 15

{function esVocal (c:char):boolean;

begin
if ((c='a') or (c='e') or (c='i') or (c='o') or (c='u') or (c='A') or (c='E') or (c='I') or (c='O') or (c='U')) then 
	esVocal:=true
else
	esVocal:=false
end;

function esNumero (c:char):boolean;

begin
esNumero:=(c>='0') and (c<='9');
end;}


// ejercicio 17


{procedure leerPlantacion (var p:info);

begin
writeln('Ingrese cantidad de hectareas');
readln(p.cantidadHectareas);
writeln('Ingrese tipo de zona');
readln(p.tipoZona);
writeln('Ingrese localidad');
readln(p.localidad);
end;

function rendimiento (p:info):real;

begin
case p.tipoZona of 
	1: rendimiento:= (p.cantidadHectareas * 320) /6;
	2: rendimiento:= (p.cantidadHectareas * 320) /2.6;
	3: rendimiento:= (p.cantidadHectareas * 320) /1.4;
	end;
end;

procedure maximos (p:info; var min,max:real; var localMin,localMax:string; rendi:real);

begin
if (rendi<min) then
	begin
	min:=rendi;
	localMin:=p.localidad;
	end
else
	if (rendi>max) then
		begin
		max:=rendi;
		localMax:=p.localidad;
		end;
end;}



var 

// ejercicio 1 primero imprime 3, luego 2 y luego 1. 

// ejercicio 2 el error es que no se puede imprimir b ya que es solo
//variable local al prodecimiento uno, por lo tanto no puede ser 
//accedida por el programa principal ya que cuando se termina de 
//ejecutar uno deja de existir.

// ejercicio 3 a) Si se lee el valor 10 en la variable x el programa imprime 25.
// b) Si se cambia el encabezado se imprime el valor 10, ya que no se modifica el valor de x en el procedimiento
// c) Si se cambia el encabezado nada sucede porque el valor de num1 ya fue usado y al momento de cambiarlo
// no se vuelve a utilizar, entonces no se veria reflejado en el programa. 

// ejercicio 4 a) Con los valores num1=10 y num2=5 el programa imprime el valor 9.
// b) Con los valores num1=5 y num2=10 el programa imprime 14.

// ejercicio 5 Si se lee esa secuencia de valores el programa imprime Pares: 4, Impares: 4.





// ejercicio 8		total,doble:integer;

// ejercicio 9		productos:producto;	min,max:real; codMin,codMax,i:integer;

// ejercicio 10 	num,cant,total:integer;

// ejercico 11 		num:integer;	

// ejercicio 12		x,y,mayor,menor,i:integer;

// ejercicio 13 	radio,diametro,perimetro:real;	planeta:info;	cont:integer;

// ejercicio 15		caracter:char; cumpleA,cumpleB:boolean;

// ejercicio 17 	plantacion:info;	cant:integer;	rend,min,max:real;	localidadMin,localidadMax:string;

BEGIN

// ejercicio 8

{total:=0;
doble:=0;
leerPares(total,doble);
writeln('El total de pares leidos es: ',total,'.');
writeln('Cantidad de pares donde numB es el doble de numA: ',doble,'.');}

// ejercicio 9

{min:=999;
max:=-1;
for i:=1 to 5 do
	begin
	leerProducto(productos);
	masBarato(min,codMin,productos);
	if (productos.tipo='pantalon') then
		masCaro(max,codMax,productos);
	end;
writeln('El codigo del producto mas barato es: ',codMin,'.');
writeln('El codigo del pantalon mas caro es: ',codMax,'.');}

// ejercicio 10

{repeat
	cant:=0;
	total:=0;
	writeln('Ingrese un numero');
	readln(num);
	digitos(num,cant,total);
	writeln('La cantidad de digitos es de: ',cant,'.');
	writeln('La suma total de digitos es: ',total,'.');
until (total=10);}

// ejercicio 11

{writeln('Ingrese un numero');
readln(num);
while (num<>123456) do
	begin
	digitos(num);
	writeln('Ingrese otro numero');
	readln(num);
	end;}
	
// ejercicio 12	


{for i:=1 to 10 do
	begin
	writeln('Ingrese un numero');
	readln(x);
	writeln('Ingrese otro numero');
	readln(y);
	if (x>y) then
		begin
		mayor:=x;
		menor:=y;
		end
	else
		begin
		mayor:=y;
		menor:=x;
		end;
	writeln('La suma es ',suma(mayor,menor),'.');
	writeln('El producto es ', producto(mayor,menor),'.');
	end;}
	
// ejercicio 13

{writeln('Ingrese el radio del circulo');
readln(radio);
calculos(radio,diametro,perimetro);}
{leerPlaneta(planeta);
cont:=0;
while (planeta.radio<>0) do
	begin
	calculos(planeta.radio,diametro,perimetro);
	if (diametro<=12700) and (diametro>=6780) then
		begin
		writeln('Nombre: ',planeta.nombre,'.');
		writeln('Distancia: ',planeta.distancia :8:2,'.');
		end;
	if (perimetro>439264) then
		cont:=cont+1;
	leerPlaneta(planeta);
	end;
writeln('La cantidad de planetas con perimetro superior al de Jupiter es de: ',cont,'.');}


// ejercicio 14 (ejercicio 6 practica 2)

// ejercicio 15

{cumpleA:=true;
writeln('Ingrese la secuencia A');
readln(caracter);
while (caracter<>'$') and (cumpleA) do
	begin
	if (not esVocal(caracter)) then
		cumpleA:=false
	else
		writeln('Ingrese otro caracter');
		readln(caracter);
	end;
if (cumpleA) then
	begin
	cumpleB:=true;
	writeln('Ingrese la secuencia B');
	readln(caracter);
	while (caracter<>'#') and (cumpleB) do
		begin
		if (esVocal(caracter)) or (esNumero(caracter)) then
			cumpleB:=false
		else
			writeln('Ingrese otro caracter');
			readln(caracter);
		end;
	end;
if (cumpleA) and (cumpleB) then
	writeln('Secuencia cumplida')
else
	if (not cumpleA) then
		writeln('Secuencia A no cumplida')
	else
		writeln('Secuencia B no cumplida');}
		
// ejercicio 16

// ejercicio 17


{cant:=0;
min:=999;
max:=-1;
repeat
	leerPlantacion(plantacion);
	rend:=rendimiento(plantacion);
	if (plantacion.localidad='tres de febrero') and (rend>10000) then
		cant:=cant+1;
	maximos(plantacion,min,max,localidadMin,localidadMax,rend);
until(plantacion.cantidadHectareas<>900) and (plantacion.localidad<>'saladillo');
writeln('La cantidad de campos de Tres de Febrero con rendimiento mayor a USD 10K es: ',cant,'.');
writeln('La localidad del campo con mayor rendimiento es: ',localidadMax,'.');
writeln('La localidad del campo con menor rendimiento es: ',localidadMin,'.');}



END.

