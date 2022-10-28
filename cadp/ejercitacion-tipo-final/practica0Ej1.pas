
program tp0Ej1;

uses crt;

const
pi=3.14;


var 

// ejercicio 1, 2 y 3	 num1,num2:real;

// ejercicio 4 			diametro:real;

// ejercicio 5 			x,y:integer;

monto:real;		valorDolar:real;	comision:real;



BEGIN

// ejercicios 1, 2 y 3

{writeln('Ingrese un numero');	
readln(num1);
writeln('Ingrese otro numero');	
readln(num2);
	
writeln('Se ingresaron los valores ', num2 :4:2 ,' y ',num1 :4:2);

writeln('La suma de ambos es: ',num1+num2 :4:2);

writeln('La division entre ambos es: ',num1/num2 :4:2);}

// ejercicio 4

{writeln('Ingrese el diametro del circulo');
readln(diametro);

writeln('El Radio del circulo es: ', diametro/2 :4:2);

writeln('El Area del circulo es: ', pi*(diametro/2) :6:2);

writeln('El Perimetro del circulo es: ', diametro*pi :4:2);}


// ejercicio 5

{writeln('Ingrese la cantidad de caramelos');
readln(x);

writeln('Ingrese la cantidad de clientes');
readln(y);

writeln('La cantidad de caramelos para cada cliente es: ', x div y);

writeln('La cantidad que le corresponden al kioskero es: ', x mod y);

writeln('La cantidad a cobrar es: ', (x - (x mod y)) * 1.60 :6:2);}

// ejercicio 6

writeln('Ingrese el monto total en dolares de la transaccion');
readln(monto);
writeln('Ingrese el valor del dolar');
readln(valorDolar);
writeln('Ingrese el porcentaje de comision del banco');
readln(comision);
comision := (comision / 100) + 1;

writeln('La transaccion sera de ', (monto * valorDolar) * comision :6:2 ,' pesos argentinos');


END.

