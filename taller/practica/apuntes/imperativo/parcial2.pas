program parcial;
const
	sucursales=5;
	ventasmaximas=180;
	moduloB=300000;
type
	
	venta=record
		codProducto:integer;
		cantVendida:integer;
		montoTotalVenta:real;
	end;
	
	vectorVentas = Array [1..ventasmaximas] of venta;
	
	ventas=record
		vector:vectorVentas;
		dimL:integer;
	end;
	
	vectorSucursales = Array [1..sucursales] of ventas;

	ventaTotal=record
		cod:integer;
		total:real;
	end;

	lista2=^nodo2;
	nodo2=record
		datos:ventaTotal;
		sig:lista2;
	end;
	
procedure CrearVectorVentas(var v:vectorVentas; var DimL:integer);
	procedure LeerVenta(var v:venta);
	begin
		write('Ingrese codigo de Producto: ');
		readln(v.codProducto);
		if(v.codProducto <> -1)then begin
			write('Ingrese cantidad vendida: ');
			readln(v.cantVendida);
			write('Ingrese el monto total de la venta: ');
			readln(v.montoTotalVenta);
		end;
	end;

	procedure AgregarAlVectorVentas (var v: vectorVentas; var dimL:integer; elemento:venta);
	begin
	  if (dimL < ventasmaximas) then begin {verificar espacio suficiente}
		dimL:= dimL+1; {actualizar cantidad de elementos}
		v [dimL]:= elemento;
	  end;
	end;
var
	e:venta; 
begin
	writeln('INGRESE LAS VENTAS ORDENADAS POR CODIGO DE MENOR A MAYOR, "-1" PARA CORTAR LA LECTURA DE VENTAS');
	LeerVenta(e);
	while(dimL < ventasmaximas) and (e.codProducto <> -1)do begin
		AgregarAlVectorVentas(v, dimL, e);
		if(dimL < ventasmaximas)then
			LeerVenta(e);
	end;
end;


Procedure CrearVectorDeSucursales(var v:vectorSucursales);
var
	i:integer;
	ventasAct:ventas;
begin
	for i:= 1 to sucursales do begin
		writeln('VECTOR DE SUCURSAL ', i, ': ');
		ventasAct.dimL:=0;
		CrearVectorVentas(ventasAct.vector, ventasAct.dimL);
		v[i]:=ventasAct;
	end;
	
end;


{A}
Procedure MergeAcumulador(V:vectorSucursales; var L:lista2);
   Procedure AgregarAtras (var pri:lista2; var ult: lista2; t:real; tipo:integer);
  var
    nue : lista2;
  begin
    new (nue);
    nue^.datos.cod:= tipo;
    nue^.datos.total:= t;
    nue^.sig := NIL;
    if (pri <> nil) then
      ult^.sig := nue
    else
      pri := nue;
    ult := nue;
  end;

Procedure BorraPos(var v:vectorVentas;var dimL:integer; pos:integer);
Var
  i:integer;
begin
  for i:= pos to dimL-1 do
    v[i]:=v[i+1];
  dimL:=dimL-1;
end;
  
  Procedure Minimo(var v:vectorSucursales; var min:ventaTotal; var ok:boolean);
  var 
	pos:integer; i:integer; minimo:integer; minimoMonto:real; 
 begin
	minimo:=999;
	for i:= 1 to sucursales do begin
		if(v[i].dimL <> 0) then begin
			if(V[i].vector[1].codProducto < minimo)then begin
				minimo:=V[i].vector[1].codProducto;
				minimoMonto:=V[i].vector[1].montoTotalVenta;
				pos:=i;
			end;	
		end;
     end;   
     min.cod:=minimo;
	 min.total:=minimoMonto;

	if(minimo<>999)then
		BorraPos(v[pos].vector, v[pos].dimL, 1)
	else
		 ok:=false;
  end;
  
  var
	min:ventaTotal; ult:lista2; ok:boolean; act:integer; minT:real;
  Begin

	L:=nil;
    ok:=true;
	Minimo(v, min,ok);
    while( ok )  do begin
		act:=min.cod;
		minT:=0;
		while(act=min.cod)do begin
			minT:=minT+min.total;
			Minimo(v, min, ok);
		end;
		AgregarAtras(L,ult,minT,act);
	end;
  end;

Procedure CantidadMenorA(L:lista2;var cant:integer);
begin
        
	If(L<>nil)then begin 
		if(L^.datos.total < moduloB )then
			cant:=cant+1;
		CantidadMenorA(L^.sig, cant);
	end;

end;

Procedure ImprimirLista(L:Lista2);
Begin
  While(L<>nil)do Begin
    Writeln('CODIGO: ',L^.datos.cod,' TOTAL: ', L^.datos.total:2:2);
    L:=L^.sig;
  end;
End;

Procedure ImprimirVectorVentas(v:ventas);
var
	i:integer;
begin
	for i:= 1 to v.dimL do 
		writeln('CODIGO DE PRODUCTO: ', v.vector[i].codProducto ,' CANTIDAD VENDIDA: ', v.vector[i].cantVendida, ' MONTO TOTAL: $', v.vector[i].montoTotalVenta:2:2);
end;

Procedure ImprimirVector(v:vectorSucursales);
var
	i:integer;
begin
	for i:=1 to sucursales do begin
		writeln('VECTOR DE SUCURSAL ', i,' :');
		ImprimirVectorVentas(v[i]);
	end;
end;

{main}

var
	v:vectorSucursales; l:lista2; cant:integer;
begin
	cant:=0;
	CrearVectorDeSucursales(v);
	ImprimirVector(v);
	MergeAcumulador(v,l);
	ImprimirLista(l);
	CantidadMenorA(l, cant);
	writeln('Cantidad de Productos con ventas que no superan los $300.000 en total: ', cant); 
	readln;
end. 
