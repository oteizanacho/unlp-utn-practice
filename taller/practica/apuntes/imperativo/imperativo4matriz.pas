program imperativo4;

type

    registro=record
		codigo:integer;
		cantidad:integer;
		monto:real;
   	end;
   	
   	ventas= array [1..200] of registro;
   	sucursales= array [1..5] of ventas;
   	
   	dlSucursales=array [1..5] of integer;
   	
   	nodoacumulador=record
		codigo:integer;
		cantidad:integer;
   	end;   
   	
   	listafinal=^nodofinal;
   	nodofinal=record
    	datos:nodoacumulador;
    	sig:listafinal;
   	end;

Procedure Vector_CrearMatriz(var m:sucursales; var dl:dlSucursales);
	
	procedure Leer(var x:registro);
	begin
		write('- codigo del producto:'); readln(x.codigo);
		if (x.codigo<>-1) then begin
			write('cantidad: '); readln(x.cantidad);
			write('monto: '); readln(x.monto);					
		end;
		writeln('');
	end;
	
Var x:registro; sucursal,venta:integer; 
Begin
	for sucursal:=1 to 5 do begin
		dl[sucursal]:=0;		
		Leer(x);
		while(x.codigo<>-1) and (dl[sucursal]<200) do begin
			dl[sucursal]:=dl[sucursal]+1;
			venta:=dl[sucursal];
			m[sucursal][venta]:=x;
			Leer(x);
		end;
		writeln(' ');
	end;
End;

{OK}
Procedure merge (m:sucursales; var l:listafinal; dl:dlSucursales);
	procedure inicializar(var indices:dlSucursales);
	var 
		sucursal:integer;
	begin
		for sucursal:=1 to 5 do begin 
			indices[sucursal]:=1;
		end;
	end;
	
	Procedure minimo(m:sucursales; var min:registro; var indices: dlSucursales; dl:dlSucursales);
	var
		indiceMin,sucursal,venta:integer;
	Begin
		min.codigo:=9999;
		for sucursal:= 1 to 5 do begin
			 if (indices[sucursal] <= dl[sucursal] ) then begin
				 if (m[sucursal][indices[sucursal] ].codigo < min.codigo) then begin
					 indiceMin:= sucursal;
					 venta:=indices[sucursal];
					 min:= m[sucursal][venta];					 
				 end;
			 end;
		end;
		if (min.codigo <> 9999) then begin
			indices[indiceMin]:=indices[indiceMin]+1;  //reemplaza al borrar nodo cuando hay vector de listas. aca actualiza el inidice a la venta siguiente que hay que comparar.
		end;
	End;
	
	  Procedure AgregarAtras (var pri, ult: listafinal; elem: nodoacumulador);
	  Var nue : listafinal;
	  Begin
		new (nue);
		nue^.datos:= elem;
		nue^.sig := NIL;
		if (pri <> Nil) then
		  ult^.sig := nue
		  else
		   pri := nue;
		ult := nue;                                                  
	  End;
var
	actual:nodoacumulador; min:registro; {nodo. puede variar segun el problema} // comprender el problema bien. puede variar esta declaración.
	ult:listafinal;
	indices:dlSucursales; // tiene los indices del primer elemento de cada sucursal, al momento de calcular el nodo minimo en merge. ya que el primer elemento de cada sucursal va cambiando cuando se encuentra un nodo minimo.
Begin
	inicializar(indices);
	l:= nil;
	minimo (m,min,indices,dl);
	while (min.codigo <> 9999 ) do begin   
		actual.codigo:= min.codigo;
		actual.cantidad:=0;
		while ( (min.codigo<> 9999 ) and (min.codigo = actual.codigo )) do begin
			actual.cantidad:= actual.cantidad + min.cantidad; 
			minimo (m,min,indices,dl);
		end; 
		agregarAtras(l,ult,actual);
	end;
End;
   
procedure Lista_Imprimir_recursivo(l:listafinal);  //mostrar en orden. (adelante ------>>>>>> atras)		
{OK}
begin
   if (l<>nil) then begin
      writeln('-');
      writeln(' codigo: ',l^.datos.codigo) ;
      writeln(' cantidad: ',l^.datos.cantidad);
      Lista_Imprimir_recursivo(l^.sig);
   end;
end;

procedure imprimirmatriz(m:sucursales; dl:dlSucursales);
var
	sucursal,venta:integer;
begin
	for sucursal:=1 to 5 do begin
		writeln(' #sucursal: ',sucursal);
		if (dl[sucursal]<>0) then begin
			for venta:=1 to dl[sucursal] do begin
				writeln(' ---> #nro de venta: ', venta);
				writeln(' codigo: ',m[sucursal][venta].codigo);
				writeln(' cantidad: ',m[sucursal][venta].cantidad);
				writeln(' monto: ',m[sucursal][venta].monto);
				
			end;
		end;
	end;
end;

VAR 
	m:sucursales; 
	dl:dlSucursales; 
	l:listafinal;
BEGIN
	Vector_CrearMatriz(m,dl);
	//imprimirmatriz(m,dl); //muestro matriz para ver si carga bien 
	merge(m,l,dl);
	Lista_Imprimir_recursivo(l);
END.


