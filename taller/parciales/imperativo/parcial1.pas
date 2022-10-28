
program parcial1;

uses crt;

const
productos = 250;		//cantidad de productos
cantSuc = 5; 		//cantidad de sucursales


type

venta = record
	cod: integer;
	cant: integer;
	monto: real;
	end;

sucursales = array [1..cantSuc,1..productos] of venta;		//matriz total

dimL = array [1..cantSuc] of integer;						// vector que maneja las dimensiones logicas de cada fila de la matriz

//lista

total = record
	cantTotal:= integer;
	cod:integer;
	end;
	
lista = ^nodo;

nodo = record
	elem:total;
	sig:lista;
	end;




procedure inicializar (var v:dimL);

var
i:integer;

begin
for i:=1 to cantSuc do
	v[i]:=0
end;





procedure insertar(var v:sucursales; d:venta; var dim:dimL; i:integer);

begin
if ((dim[i]+1)<=productos) then			//verifico si hay lugar
	begin
	v[i][dim[i]]:= d;					//guardo el dato 
	dim[i]:= dim[i]+1;					//incremento dimL
	end;
end;





procedure leer (var d:venta);

begin
writeln('Ingrese codigo del producto');
readln(d.cod);
if (d.cod<>-1) then
	begin
	writeln('Ingrese cantidad vendida');
	readln(d.cant);
	writeln('Ingrese monto del producto');
	readln(d.monto);
	end;
end;






procedure cargar (var v:sucursales; var dim:dimL);

var
i:integer;
dato:venta;

begin
inicializar(dim);
leer(dato);
for i:=1 to cantSuc do
	begin
	while ((dato.cod <> -1) and (dim[i] <= productos)) do
		begin
		insertar(v,dato,dim,i);
		leer(dato);
		end;
	end;
end;



procedure insertarOrdenado
















procedure minimo (var v:sucursales; var d:venta; dim:dimL);

var
i,aux:integer;

begin
d.cod := 9999;
for j:=1 to cantSuc do
	begin
	i:=1;
	while (i <= dim[j]) do
		begin
		if (( v[j][i] <= d.cod) then
			begin
			aux:=i;
			d:=v[j[i];
			end;
		end;
	if (d.cod<>9999) then
		v[aux]:= v[aux]+1;
	end;	
end;











procedure mergeConCorte (var v:sucursales; var l:lista; dim:dimL);

var
d,actual:venta;
total,i,j:integer;

begin
l:=nil;
for i:=1 to cantSuc do
	begin
	for j:=1 to dim[i] do
		begin
		minimo(v[i][j],d,dim);
		actual:=d;
		total:=0;
		while (d.cod = actual.cod) do
			begin
			total:= total+v[i][j].cant;
			minimo(v[i][j],d,dim);
			end;
		agregarAdelante(l,actual,total);
		end;
	end;
end;












var 

matriz: sucursales;
dimensiones: dimL;



BEGIN

cargar(matriz,dimensiones);


	
END.

