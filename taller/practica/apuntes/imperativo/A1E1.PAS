{ 1-A. OK
* 1-B. continuar...
* }

program adicionales1;
const
	DF=7; //dias de la semana
	cMinimo=9999;
{ -------------------------------------------------- DECLARACION DE NODOS Y PUNTEROS -------------------------------------------------- }

type 
	rangoDias=1..7;
	entradaLectura= record
		dia:rangoDias;
		codigo: integer;
		asiento: integer;
		monto: real;
	end;
	
	entrada=record
		codigo:integer;
		asiento: integer;
		monto:real;
	end;
	
	lista1 = ^nodo1;
	nodo1= record
		datos: entrada;
		sig:lista1;
	end;
	vector1 = array [1..DF] of lista1; // ordenada ascendentemente por cod obra
	
	lista2=^nodo2;
	obra=record
		codigo:integer;
		cantidad:integer;
	end;
	nodo2=record
		datos:obra;
		sig:lista2;
	end;
	
{ -------------------------------------------------- PROCEDIMIENTOS/FUNCIONES NO RECURSIVOS -------------------------------------------------- }

Procedure Vector_CrearVectorDeListas(var v: vector1);
	procedure Vector_Inicializar (var v:vector1);
	var i:integer;
	begin
	for i:=1 to DF do
	  v[i]:= nil ;
	end;

	procedure Leer(var x:entradaLectura);
	begin
		writeln('"$#$#$________ Leer obra:');
		x.codigo:=Random(20);
		if (x.codigo<>0) then begin
			x.dia:=Random(7)+1;
			x.asiento:=Random(50);
			x.monto:=Random(200);
		end;
	end;
	procedure recortar (x1:entradaLectura; var x2:entrada); 
	begin
		x2.codigo:=x1.codigo;
		x2.asiento:=x1.asiento;
		x2.monto:=x1.monto;
	end;
	Procedure Lista_InsertarOrdenado ( var pri: lista1; x:entrada);
	{OK}
	var ant, nue, act: lista1;
	begin
		new (nue);
		nue^.datos := x;
		act := pri;
		ant := pri;
		{Recorro mientras no se termine la lista y no encuentro la posición correcta}
		while (act<>NIL) and (act^.datos.codigo < x.codigo) do begin
		  ant := act;
		  act := act^.sig ;
		end;
		if (ant = act)  then pri := nue   {el dato va al principio}
		else  ant^.sig  := nue; {va entre otros dos o al final}
		nue^.sig := act ;
	end;
Var x1:entradaLectura; x2:entrada;
Begin
	randomize;
  Vector_Inicializar(v);
  Leer(x1);
  while(x1.codigo<>0) do begin
	recortar(x1,x2);
    Lista_InsertarOrdenado(v[x1.dia],x2);
    Leer(x1);
  end;
End;

procedure Lista_Imprimir_recursivo_PreOrden(l:lista2);  //mostrar en orden. (adelante ------>>>>>> atras)		
{OK}
begin
   if (l<>nil) then begin
	  writeln('- obra -');
	  writeln('---> codigo: ',l^.datos.codigo);
	  writeln('---> cantidad: ',l^.datos.cantidad);
	  writeln('-');
	  Lista_Imprimir_recursivo_PreOrden(l^.sig);
   end;
end;

procedure mostrar (v:vector1);
	procedure Lista_Imprimir_recursivo_PreOrden(l:lista1);  //mostrar en orden. (adelante ------>>>>>> atras)		
	{OK}
	begin
	   if (l<>nil) then begin
		  writeln('- obra -');
		  writeln('---> codigo: ',l^.datos.codigo);
		  writeln('---> asiento: ',l^.datos.asiento);
		  writeln('---> monto: ',l^.datos.monto);
		  writeln('-');
		  Lista_Imprimir_recursivo_PreOrden(l^.sig);
	   end;
	end;
var
	dia:integer;
begin
	for dia:=1 to DF do begin
		writeln('######### Dia',dia );
			Lista_Imprimir_recursivo_PreOrden(v[dia]);
		writeln('');
	end;
end;

Procedure merge (v:vector1; var l:lista2);
	Procedure minimo(var v:vector1; var min:entrada);
	var
		indiceMin,i:integer;
		aux:lista1;
	Begin
		min.codigo:=9999;
		for i:= 1 to DF do begin     
			 if (v[i] <> nil) then begin
				 if (v[i]^.datos.codigo < min.codigo) then begin
					 indiceMin:= i;   
					 min:= v[indiceMin]^.datos;
				 end;
			 end;
		end;
		if (min.codigo <> 9999) then begin
			aux:=v[indiceMin];
			v[indiceMin]:= v[indiceMin]^.sig;	//avanzo  
			dispose(aux);
		end;
	End;

	Procedure agregarAtras(var l:lista2; var ult:lista2; x:obra);
	var
		nue:lista2;
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
	min:entrada; actual:obra;
	ult:lista2;
Begin  
	l:= nil; 
	minimo (v,min); 
	while (min.codigo <> 9999 ) do begin   
		actual.codigo:= min.codigo;
		actual.cantidad:=0;
		while ((min.codigo <> 9999) and (min.codigo= actual.codigo) ) do begin   
			actual.cantidad:= actual.cantidad + 1;
			minimo (v,min);
		end;
		agregarAtras(l,ult,actual);
	end;
End;

{ -------------------------------------------------- PAGINA PRINCIPAL -------------------------------------------------- }

VAR
	v1:vector1; l:lista2;
BEGIN
	writeln('crear vector de listas...'); writeln('');
	Vector_CrearVectorDeListas(v1);
	writeln('');writeln('mostrar vector de listas...');writeln('');
	mostrar(v1);
	writeln(''); writeln(' crear merge de listas'); writeln('');
	merge(v1,l);
	writeln(''); writeln(' mostrar merge de listas'); writeln('');
	Lista_Imprimir_recursivo_PreOrden(l);
	writeln(' FIN ');
end.
