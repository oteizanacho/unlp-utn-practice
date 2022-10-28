program taller;

uses crt;
 
const 
dimF=20;

type
vector = array [1..dimF] of integer;

procedure cargarVector (var v:arreglo; var dimL:integer);

var
num:integer;

begin
	dimL:=0;
	writeln('Ingrese un numero');
	readln(num);
	while (dimL<dimF) and (num<>0) do
		begin
		dimL:=dimL+1;
		v[dimL]:=num;
		end;
end;

procedure imprimirVector (v:vector; dimL:integer);

var
i:integer;

begin
for i:=1 to dimL do
	writeln('Posicion:',i,', numero:',v[i]);
end;

procedure eliminar (v:vector; num:integer; dimL:integer);

var
i,j:integer;
pude:boolean;

begin
pude:=false;
for i:=1 to dimL do
	begin
	if (v[i]=num) then
		begin
		pude:=true;
		for j:=i to dimL-1 do
			v[j]:=v[j+1];
		dimL:=dimL-1;		
		end;
	end;
end;





var
arreglo:vector;
dim:integer;

BEGIN
cargarVector(arreglo,dim);
imprimirVector(arreglo,dim);
END.


{
* procedure usandoRandom;
* var
* 	num: integer;
* begin
* 	Randomize;
* 	num := Random(21);
* 	writeln ('Numero: ',num);
* 	while (num <> 5) do
* 	begin
* 		num := Random(21);				entre parentecis se pone el maximo, en este caso de 0 a 20, tmb se pueden poner valores negativos
* 		writeln ('Numero: ',num);		no se puede poner un limite inferior y uno superior, se puede sumar para levantar la cota inferior
* 	end;
* end;
* 
* begin
* 	usandoRandom;
* end. 
* }

