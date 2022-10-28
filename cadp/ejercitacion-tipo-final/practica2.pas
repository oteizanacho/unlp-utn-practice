program practica2;



uses crt;


// ejercicio 4

{const
numeros=10;


procedure minimos (num:integer; var min1,min2:integer);

begin

if (num<min1) then
	min1:=num
else
	if (num<min2) then
		min2:=num;
end;}

// ejercicio 6		

{procedure minimos (codigo:integer; precio:real; var min1,min2: real; var cod1,cod2:integer);

begin
if (precio<min1) then
	begin
	min1:=precio;
	cod1:=codigo;
	end
else
	if (precio<min2) then
		begin
		min2:=precio;
		cod2:=codigo;
		end;
end;

function espar (num:integer):boolean;

begin
espar:=((num mod 2)=0);
end;}

// ejercicio 7

{procedure primeros (nom:string; tiempo:real; var nombre1,nombre2:string; var min1,min2:real);

begin
if (tiempo<min1) then
	begin
	min1:=tiempo;
	nombre1:=nom;
	end
else
	if (tiempo<min2) then
		begin
		min2:=tiempo;
		nombre2:=nom;
		end;
end;

procedure ultimos (nom:string; tiempo:real; var nombre1,nombre2:string; var max1,max2:real);

begin
if (tiempo>max1) then
	begin
	max2:=max1;
	nombre2:=nombre1;
	max1:=tiempo;
	nombre1:=nom;
	end
else
	if (tiempo>max2) then
		begin
		max2:=tiempo;
		nombre2:=nom;
		end;
end;}


var 

// ejercicio 1 		num,i,total,mayor:integer;

// ejercicio 2 		num,pos,i,mayor:integer;

// ejercicio 3		nombre:string;	notaEPA:real;	mayor,igual:integer;

// ejercicio 4 		num,i,min1,min2:integer;

// ejercicio 5		num,max,min,total:integer;

// ejercico 6 		cod,i,cod1,cod2,cant:integer;	precio,min1,min2:real;	

// ejercicio 7		nombre,nombreMin1,nombreMin2,nombreMax1,nombreMax2:string;	tiempo,min1,min2,max1,max2:real;	i:integer;

// ejercicio 8		monto,total:real;	cant,max,i,dia:integer;


BEGIN

// ejercicio 1


{mayor:=0;
total:=0;
for i:=1 to 10 do
	begin
	writeln('Ingrese un numero entero');
	readln(num);
	total:=total+num;
	if (num>5) then
		mayor:=mayor+1;
	end;
writeln('La suma total es: ',total);
writeln('Los numeros mayores a 5 son: ',mayor);}


// ejercicio 2

{mayor:=-1;
for i:=1 to 10 do 
	begin
	writeln('Ingrese un numero');
	readln(num);
	if (num>mayor) then
		begin
		mayor:=num;
		pos:=i;	
		end;
	end;
writeln('El mayor numero leido fue el: ', mayor, ',en la posicion: ',pos);}


// ejercicio 3

{mayor:=0;
igual:=0;
repeat
	writeln('Ingrese nombre del alumno');
	readln(nombre);
	writeln('Ingrese nota');
	readln(notaEPA);
	if (notaEPA>=8) then
		mayor:=mayor+1;
	if (notaEPA=7) then
		igual:=igual+1;
until (nombre='Zidane Zinedine');
writeln('La cantidad de alumnos aprobados es: ',mayor);
writeln('La cantidad de alumnos que obtuvieron un 7 como nota es: ',igual);}


// ejercicio 4

{min1:=999;
min2:=999;
for i:=1 to numeros do
	begin
	writeln('Ingrese un numero');
	readln(num);
	minimos(num,min1,min2);
	end;
writeln('Los menor valor es: ',min1,', y el siguiente es: ',min2,'.');}


// ejercicio 5

{max:=-1;
min:=999;
total:=0;
repeat
	writeln('Ingrese un numero');
	readln(num);
	if (num>max) then
		max:=num;
	if (num<min) then
		min:=num;
	total:=total+num;
until (num=100);
writeln('El numero maximo leido fue: ',max,'.');
writeln('El numero minimo leido fue: ',min,'.');
writeln('La suma total es de: ',total,'.');	}

// ejercicio 6

{min1:=999;
min2:=999;
cant:=0;
for i:=1 to 5 do
	begin
	writeln('Ingrese codigo de producto');
	readln(cod);
	writeln('Ingrese precio del producto');
	readln(precio);
	minimos(cod,precio,min1,min2,cod1,cod2);
	if (espar(cod)=true) and (precio>16) then
		cant:=cant+1;	
	end;
writeln('El codigo del producto mas barato es: ',cod1,', y el siguiente es: ',cod2,'.');
writeln('La cantidad de productos de mas de $16 con codigo par son: ',cant,'.');}

// ejercicio 7

{min1:=999;
min2:=999;
max1:=-1;
max2:=-1;
for i:=1 to 5 do
	begin
	writeln('Ingrese nombre del piloto');
	readln(nombre);
	writeln('Ingrese tiempo del piloto');
	readln(tiempo);
	primeros(nombre,tiempo,nombreMin1,nombreMin2,min1,min2);
	ultimos(nombre,tiempo,nombreMax1,nombreMax2,max1,max2);
	end;
writeln('El nombre del ganador es: ',nombreMin1,'. El segundo puesto es de: ',nombreMin2,'.');
writeln('El ultimo puesto es de: ',nombreMax1,'. El ante ultimo es de: ',nombreMax2,'.');}


// ejercicio 8

{total:=0;
max:=0;
for i:=1 to 5 do
	begin
	cant:=0;
	writeln('Ingrese monto de venta');
	readln(monto);
	while (monto<>0) do
		begin
		cant:=cant+1;
		total:=total+monto;
		writeln('Ingrese monto de venta');
		readln(monto);
		end;
	if (cant>max) then
		begin
		max:=cant;
		dia:=i;
		end;
	writeln('La cantidad de ventas del dia ',i,' fue de: ',cant,'.');	
	end;
writeln('El monto total de ventas del mes fue de: ',total :4:2, '.');
writeln('El dia en que se realizaron mas ventas fue: ',dia,'.');}

END.

