program practica5;


uses crt;



const

dimF=10;


type


// ejercicio 3


{vector = array [1..dimF] of integer;



procedure imprimirVector (v:vector; dim:integer);

var
i:integer;

begin
writeln('Impresion normal');
for i:=1 to dim do
	writeln('Numero: ',v[i]);
readkey;
clrscr;
end;

procedure imprimirAlReves (v:vector; dim:integer);

var
i:integer;

begin
writeln('Imprimir al reves');
for i:=dim downto 1 do
	writeln('Numero: ',v[i]);
readkey;
clrscr;
end;

procedure cargar (var v:vector; var dim:integer);

var
i:integer;

begin
for i:=1 to dimF do
	begin
	v[i]:=i;
	dim:=dim+1;
	end;
end;


procedure imprimirMitad (v:vector; dim:integer);

var
i,j:integer;

begin
writeln('Primer mitad');
for i:=(dim div 2) downto 1 do
	writeln('Numero: ',v[i]);
readkey;
clrscr;
writeln('Segunda mitad');
for j:=(dim div 2) to dim do	
	writeln('Numero: ',v[j]);
readkey;
clrscr;
end;


procedure imprimirPosiciones (v:vector; x,y:integer);

var
i:integer;

begin
if (x<y) then
	begin
	for i:=x to y do
		writeln('Numero: ',v[i]);
	end
else
	begin
	for i:=x downto y do
		writeln('Numero: ',v[i]);
	end;	
end;

procedure puntoC(v:vector);

begin
imprimirPosiciones(v,1,10);
imprimirPosiciones(v,10,1);
imprimirPosiciones(v,5,1);
imprimirPosiciones(v,1,5);
end;}

// ejercicio 4

{vector = array [1..dimF] of integer;

procedure posicion (v:vector; num:integer; var pos:integer);

var
i:integer;

begin
pos:=-1;
for i:=1 to dimF do
	begin
	if (v[i]=num) then
		pos:=i;
	end;
end;

procedure intercambio (var v:vector; x,y:integer; dim:integer);

var 
i,pos1,pos2,aux:integer;

begin
for i:=1 to dim do
	begin
	if (i=x) then
		pos1:=i;
	if (i=y) then
		pos2:=i;
	end;
aux:=v[pos1];
v[pos1]:=v[pos2];
v[pos2]:=aux;
end;

procedure sumarVector (v:vector; var total:integer);

var
i:integer;

begin
total:=0;
for i:=1 to dimF do
	total:=total+v[i]
end;

procedure promedio (v:vector; var prom:real);

var
i,total:integer;

begin
total:=0;
for i:=1 to dimF do
	total:=total+v[i];
prom:=total/dimF;
end;


procedure elementoMaximo (v:vector; var pos:integer; dim:integer);

var
i,max:integer;

begin
max:=-1;
for i:=1 to dim do
	begin
	if (v[i]>max) then
		begin
		pos:=i;
		max:=v[i];
		end;
	end;
end;

procedure elementoMinimo (v:vector; var pos: integer; dim:integer);

var
i,min:integer;

begin
min:=999;
for i:=1 to dim do
	begin
	if (v[i]<min) then
		begin
		pos:=i;
		min:=v[i];
		end;
	end;
end;




procedure cargar (var v:vector; var dim:integer);

var
i:integer;

begin
for i:=1 to dimF do
	begin
	v[i]:=i;
	dim:=dim+1;
	end;
end;}


// ejercicio 5

{procedure leerNumeros(var v:vector; var dim:integer);

var
num:integer;

begin
dim:=0;
writeln('Ingrese un numero');
readln(num);
while (dim<=dimF) and (num<>0) do
	begin
	dim:=dim+1;
	v[dim]:=num;
	if (dim<dimF) then
		begin
		writeln('Ingrese otro numero');
		readln(num);
		end;
	end;
end;

procedure intercambio2 (var v:vector; dim:integer);

var
iMax,iMin:integer;

begin
elementoMaximo(v,iMax,dim);
elementoMinimo(v,iMin,dim);
intercambio(v,iMin,iMax,dim);
writeln('El elemento maximo: ',v[iMin],', que se encontraba en la posicion: ',iMax,', fue intercambiado con el elemento minimo: ',v[iMax],', que se encontraba en la posicion: ',iMin,'.');
end;}


// ejercicio 7

{vector = array [1..dimF] of integer;

procedure iniciarContador (var c:vector);

var
i:integer;

begin
for i:=1 to dimF do
	c[i]:=0;
end;




procedure contar (num:integer; var c:vector);

begin
c[num]:=c[num]+1;
end;



procedure descomponer (num:integer; var c:vector);

var
dig:integer;

begin
while (num<>0) do
	begin
	dig:=num mod 10;
	contar(dig,c);
	num:=num div 10;	
	end;
end;



procedure leerNumero (var v:vector; var c:vector; var dim:integer);

var
num:integer;

begin
writeln('Ingrese un numero');
readln(num);
while (dim<dimF) and (num<>-1) do
	begin
	dim:=dim+1;
	v[dim]:=num;
	descomponer(num,c);
	writeln('Ingrese otro numero');
	readln(num);
	end;
end;

function digito (c:vector):integer;

var
max,i:integer;

begin
max:=-1;
for i:=1 to dimF do
	begin
	if (c[i]>max) then
		begin
		max:=c[i];
		digito:=i;
		end;
	end;
end;



procedure imprimir (c:vector);

var
i:integer;

begin
for i:=1 to dimF do
	begin
	if (c[i]<>0) then
		begin
		writeln('Numero ',i,': ',c[i],' veces.');
		writeln('###################');
		end
	else
		begin
		writeln('El digito ',i,' no tuvo ocurrencias');
		writeln('###################');
		end
	end;
writeln('El digito mas leido fue: ',digito(c));
end;}


// ejercicio 9

vector = array [1..dimF] of  string;


procedure agregar (var v:vector; var dim:integer);

var
nombre:string;

begin
dim:=0;
writeln('Ingrese nombre');
readln(nombre);
while (nombre<>'ZZZ') and (dim<dimF) do
	begin
	dim:=dim+1;
	v[dim]:=nombre;
	writeln('Ingrese otro nombre');
	readln(nombre);
	end;
end;



procedure eliminar (var v:vector; nom:string; var dim:integer);

var
i:integer;	cumple:boolean;	

begin
i:=1;
cumple:=false;
while (i<=dim) and (not cumple) do
	begin
	if (v[i]='nom') then
		cumple:=true;
	else
		i:=i+1;
	end;
if (cumple) then
	begin
	for (j:=i) to (dim-1) do
		v[j]:=v[j+1];
	dim:=dim-1;
	end;
end;



procedure insertar (var v:vector; nom:string; pos:integer; var dim:integer);

var
i:integer;


begin
if (pos<dimF) then
	begin
	for i:=dim+1 downto pos do
		v[i+1]:= v[i];
	v[pos]:=nom;
	dim:=dim+1;
	end;
end;







procedure agregarNombre (var v:vector; nom:string; var dim:integer;);

begin
if (dim+1<=dimF) then
	v[dim+1]:=nom;
end;


var 

// ejercicio 1	a)Los valores que toma la variable numeros al finalizar el primer bloque for
// 				son los numeros del 1 al 10.
//				b)Al terminar el programa finaliza con los valores 1,3,6,10,15,21,28,36,45,55
//				c)numeros[i+1]:=numeros[i+1]+numeros[i];
//				d)1,1,1,1,1,1,1,1,1,1.

// ejercicio 3			numeros:vector;	dimL:integer;

// ejercicio 4 y 5		numeros:vector; pos,dimL,suma:integer; 	prom:real;

// ejercicio 7			numeros,contadores:vector;	dimL:integer;




BEGIN

// ejercicio 3

{dimL:=0;
cargar(numeros,dimL);
imprimirVector(numeros,dimL);
imprimirAlReves(numeros,dimL);
imprimirMitad(numeros,dimL);
imprimirPosiciones(numeros,5,2);
puntoC(numeros);}

// ejercicio 4

{cargar(numeros,dimL);
posicion(numeros,5,pos);
writeln('Valor: ',numeros[pos]);
intercambio(numeros,1,10);
writeln('Posicion 1: ',numeros[1]);
writeln('Posicion 10: ',numeros[10]);
sumarVector(numeros,suma);
writeln('Suma: ',suma);
promedio(numeros,prom);
writeln('Promedio: ',prom :4:2);
elementoMaximo(numeros,pos);
writeln('Valor maximo: ',numeros[pos]);
elementoMinimo(numeros,pos);
writeln('Valor minimo: ',numeros[pos]);}


// ejercicio 5

{leerNumeros(numeros,dimL);
intercambio2(numeros,dimL);}


// ejercicio 7

{leerNumero(numeros,contadores,dimL);
imprimir(contadores);}

// ejercicio 9



END.

