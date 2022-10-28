
program practica1;


uses crt;



var

// ejercicio 1 		num1,num2: integer;

// ejercicio 2		num: real;

// ejercicio 3 		num1,num2,num3: integer;

// ejercicio 4 		x,y:real;

// ejercicio 5 		x,y:real; 	i:integer;

// ejercicio 6		legajo,cantAlu,cantProm,cantPorcen:integer;		promedio:real;

// ejercicio 7 		cod:integer; 	actual,nuevo,aumento:real;

// ejercicio 8 		letra1,letra2,letra3:char;

// ejercicio 9 		caracter:char;		num,total:integer;

BEGIN

//ejercicio 1
	
{writeln('Ingrese un numero');	
readln(num1);
writeln('Ingrese otro numero');	
readln(num2);

if (num1>num2) then
	writeln('El numero ', num1 ,' es mayor')
else
	if (num1<num2) then
		writeln('El numero ', num2 ,' es mayor')
	else
		writeln('Son iguales')}
	
// ejercicio 2

{writeln('Ingrese un numero real');
readln(num);
if (num>0) then
	writeln('Valor absoluto: ', num :4:2)
else
	writeln('Valor absoluto: ', num * -1 :4:2)}

// ejercicio 3

{writeln('Ingrese un numero');	
readln(num1);
writeln('Ingrese un numero');	
readln(num2);
writeln('Ingrese un numero');	
readln(num3);

if (num1>num2) then
	if (num2>num3) then
		begin
		writeln(num1);
		writeln(num2);
		writeln(num3);
		end
	else
		if (num1>num3) then
			begin
			writeln(num1);
			writeln(num3);
			writeln(num2);
			end
		else
			begin
			writeln(num3);
			writeln(num1);
			writeln(num2);
			end
else
	if (num2<num3) then
		begin
		writeln(num3);
		writeln(num2);
		writeln(num1);
		end
	else
		if (num1<num3) then
			begin
			writeln(num2);
			writeln(num3);
			writeln(num1);
			end
		else
			begin
			writeln(num2);
			writeln(num1);
			writeln(num3);
			end;}
			
//ejercicio 4

{writeln('Ingrese un numero');
readln(x);
y:=x*2;
while (x<>y) do
	begin
	writeln('Ingrese un numero');
	readln(x);
	end}
	

//ejercicio 5

{writeln('Ingrese un numero');
readln(x);
y:=x*2;
i:=1;
while (x<>y) and (i<=10) do
	begin
	writeln('Ingrese un numero');
	readln(x);
	i:=i+1;
	end;
	
if (i=11) then
	writeln('No se ha ingresado el doble de X');}
	
	
// ejercicio 6

{cantAlu:=0;
cantProm:=0;
cantPorcen:=0;
writeln('Ingrese un legajo');
readln(legajo);
cantAlu:=cantAlu+1;
writeln('Ingrese promedio');
readln(promedio);
	while (legajo<>-1) do
		begin
		if (promedio>6.5) then
			cantProm:=cantProm+1;
		if (legajo<2500) and (promedio>8.5) then
			cantPorcen:=cantPorcen+1;
		writeln('Ingrese un legajo');
		readln(legajo);
		writeln('Ingrese promedio');
		readln(promedio);
		end;
writeln('La cantidad de alumnos es: ',cantAlu);
writeln('La cantidad de alumnos con promedio mayor a 6.5 es: ',cantProm);
writeln('El porcentaje de alumnos destacados es: ',(cantPorcen*100)/cantAlu :5:2);}


// ejercicio 7

{repeat
	writeln('Ingrese codigo de producto');
	readln(cod);
	writeln('Ingrese precio actual');
	readln(actual);
	writeln('Ingrese precio nuevo');
	readln(nuevo);
	aumento:= (nuevo*100)/actual;
	if (aumento>110) then
		writeln('El aumento de precio del producto ', cod ,' supera el 10%')
	else
		writeln('El aumento del precio del producto ', cod, ' no supera el 10%');
	until (cod=32767)}


// ejercicio 8

{writeln('Ingrese una letra');
readln(letra1);
writeln('Ingrese otra letra');
readln(letra2);
writeln('Ingrese otra letra');
readln(letra3);

if ((letra1='a') or (letra1='e') or (letra1='i') or (letra1='o') or (letra1='u')) and 
	((letra2='a') or (letra2='e') or (letra2='i') or (letra2='o') or (letra2='u')) and
	((letra3='a') or (letra3='e') or (letra3='i') or (letra3='o') or (letra3='u')) then
	writeln('Las tres letras son vocales')
else
	writeln('Una no era vocal');}


// ejercicio 9

{writeln('Ingrese un caracter');
readln(caracter);
if (caracter='-') or (caracter='+') then
	begin
	total:=0;
	writeln('Ingrese un numero');
	readln(num);
	while (num<>0) do
		begin
		if (caracter='+') then
			total:=total+num
		else
			total:=total-num;
		writeln('Ingrese otro numero');
		readln(num);
		end;
	writeln('Resultado final: ',total);
	end
else
	writeln('Caracter erroneo');}


	
END.




