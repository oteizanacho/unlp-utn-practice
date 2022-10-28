program parcial3;

uses crt;

const
productos = 200;
sucursales = 5;



type

venta=record
	cod:integer;
	cant:integer;
	monto:real;
	end;

vectorVentas = array [1..productos] of venta;

datoSucursal = record
	datos:vectorVentas;
	dimL:integer;
	end;
	
datosSucursales = array [1..sucursales] of datoSucursal;

procedure leerVenta (var d:venta);

begin
writeln('Ingrese codigo de producto');
readln(d.cod);
if (d.cod<>-1) then
	begin
	writeln('Ingrese cantidad vendida');
	readln(d.cant);
	writeln('Ingrese monto total de la venta');
	readln(d.monto);
	end;
end;


procedure cargar (var v:datoSucursal);

var
datos:venta;

begin
leerVenta(datos);
while (datos.cod<>-1) and (v.dimL<productos) do
	begin
	v.dimL:=v.dimL+1;
	v.datos[v.dimL]:=datos;
	leer(datos);		
	end;
end;


procedure cargarSucursales (var v: datosSucursales);

var
i:integer;

begin
for i:=1 to sucursales do
	begin
	v[i].dimL:=0;
	cargar(v[i]);
	end;
end;


var 

BEGIN
	
	
END.

