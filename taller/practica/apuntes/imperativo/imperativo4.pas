program imperativo4;

type

    registro=record
		codigo:integer;
		cantidad:integer;
		monto:real;
   	end;
   
   	lista=^nodo;
   	nodo=record
    	datos:registro;
    	sig:lista;
   	end;
   	
   	nodoacumulador=record
		codigo:integer;
		cantidad:integer;
   	end;   
   	
   	listafinal=^nodofinal;
   	nodofinal=record
    	datos:nodoacumulador;
    	sig:listafinal;
   	end;
   	
   	sucursales=array [1..5] of lista;
   	dlSucursales=array [1..5] of integer;
   	
Procedure Vector_CrearVectorDeListas(var v: sucursales; var dl:dlSucursales);
	procedure Vector_Inicializar (var v:sucursales; var ult:sucursales);
	var i:integer;
	begin
	for i:=1 to 5 do
	  v[i]:= nil ;
	  ult[i]:=nil;
	end;
	
	procedure Leer(var x:registro);
	begin
		write('- codigo del producto:'); readln(x.codigo);
		if (x.codigo<>-1) then begin
			write('cantidad: '); readln(x.cantidad);
			write('monto: '); readln(x.monto);					
		end;
		writeln('');
	end;
	
  { procedimiento 'agregarAtras', 'agregarAdelante' o InsertarOrdenado}
	Procedure Lista_AgregarAtras(var pri:lista; var ult:lista; x:registro);
	{OK}
	var
	   nue:lista;
	begin
	   new(nue);
	   nue^.datos:=x;
	   nue^.sig:=nil;
	   if (pri<>nil) then
		  ult^.sig:=nue
	   else pri:=nue;
	   ult:=nue;
	end;
	
Var x:registro; ult: sucursales;  //'ULT'  tiene punteros al ultimo elemento de cada pos del vector. en  ULT[1] hay un puntero al ultimo elemento de V[1]
	i:integer;
Begin
	Vector_Inicializar(v,ult);
	for i:=1 to 5 do begin
		dl[i]:=0;		
		writeln(' sucursal numero ', i);
		Leer(x);
		while(x.codigo<>-1) and (dl[i]<200) do begin
			Lista_AgregarAtras(v[i],ult[i],x);
			Leer(x);
		end;
		writeln('');
	end;
End;

{OK}
Procedure merge (v:sucursales; var l:listafinal);
	Procedure minimo(var v:sucursales; var min:registro);
	var
		indiceMin,i:integer;
		aux:lista;
	Begin
		min.codigo:=9999;
		for i:= 1 to 5 do begin     
			 if (v[i] <> nil) then begin
				 if (v[i]^.datos.codigo < min.codigo) then begin
					 indiceMin:= i;   
					 min:= v[indiceMin]^.datos;
				 end;
			 end;
		end;
		if (min.codigo <> 9999) then begin
			aux:=v[indiceMin];
			v[indiceMin]:= v[indiceMin]^.sig;  //pasa al siguiente nodo en la lista
			dispose(aux); // borra nodo procesado
		end;
	End;

	Procedure agregarAtras(var l:listafinal; var ult:listafinal; x:nodoacumulador);
	var
		nue:listafinal;
	begin
		new(nue);
		nue^.datos:=x;
		nue^.sig:=nil;
		if(l = nil) then 
			l:=nue
		else
			ult^.sig:=nue;
		ult:=nue;
	end;
var
	actual:nodoacumulador; min:registro; {nodo. puede variar segun el problema} // comprender el problema bien. puede variar esta declaración.
	ult:listafinal;
Begin
	l:= nil;
	minimo (v,min);
	while (min.codigo <> 9999 ) do begin   
		actual.codigo:= min.codigo;
		actual.cantidad:=0;
		while ( (min.codigo<> 9999 ) and (min.codigo = actual.codigo )) do begin   
			actual.cantidad:= actual.cantidad + min.cantidad;
			minimo (v,min);
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

VAR 
	v:sucursales; dl:dlSucursales; l:listafinal;
BEGIN
	Vector_CrearVectorDeListas(v,dl);
	merge(v,l);
	Lista_Imprimir_recursivo(l);
END.
