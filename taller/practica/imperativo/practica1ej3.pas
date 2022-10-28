program tres;
const
	DimF = 6;
	DimF2 = 30;
type
	codigo = 1..DimF;
	codigo2 = 1..DimF2;
	libreria = record
		CodLibro: integer;
		CodRubro: codigo;
		Precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: libreria;
		sig: lista;
	end;
	vector = array [codigo] of lista;
	vector2 = array [codigo2] of libreria;
	
procedure leerlibreria (var L:libreria);
begin
	Write('Escriba el precio del producto hasta finalizarlo con -1: ');
	Read(L.precio);
	if(L.precio<>-1)then begin
		WriteLn('Escriba el codigo de Libro: ');
		Read(L.CodLibro);
		WriteLn('Escriba el codigo del rubro: ');
		Read(L.codrubro);
	end;
end;

procedure inicializarvector (var v:vector);
var
	I:integer;
begin
	For I:= 1 to Dimf do
		V[I]:=nil;
end;


procedure insertarordenado (var L:lista; P:libreria);
var
	nue,anterior,actual:lista;
begin
	new (nue);
	nue^.dato:=p;
	actual:=l;
	anterior:=l;
	while (actual <> nil) and (p.codlibro > actual^.dato.codlibro) do begin
		anterior:=actual;
		actual:= actual^.sig;
	end;
	if (actual=anterior) then 
		l:=nue
	else
		anterior^.sig:=nue;
	nue^.sig:=actual;
end;

procedure CargarLista (var v:vector);
var
	l:libreria;
begin
	inicializarvector(v);
	leerlibreria(l);
	while (l.precio<>-1)do begin
		insertarordenado(v[l.codrubro],l);
		leerlibreria(l);
	end;
end;

procedure productosrubro3(var v2:vector2;var num:integer;aux:lista);
begin
	while(num < 30)and(aux<>nil) do begin
		num:=num+1;
		v2[num]:=aux^.dato;
		aux:=aux^.sig;
	end;
end;

procedure OrdenarVector2(var v2:vector2;num:integer);
var
	i:codigo2;
	actual: libreria;
	anterior: integer;
begin	
	for i:= 2 to num do begin 
		actual := v2[i];
		anterior := i-1;
		while (anterior > 0) and (v2[anterior].precio > actual.precio) do begin
			v2[anterior +1] := v2[anterior];
			anterior:=anterior-1;
		end;
		v2[anterior+1]:= actual;
	end;
end;


procedure recorrerlista (v:vector);
var
	I:integer;aux:lista;
begin
	for I:=1 to DimF do begin
		aux:=v[I];
		writeLn('Los codigos de los productos del rubro ',I,' son: ');
		while (aux<>nil) do begin
			writeln(aux^.dato.codlibro);
			aux:=aux^.sig;
		end;
	end;
end;

procedure mostrarPrecios(v2:vector2;num:integer);
var
	I:codigo2;
begin
	For I:=1 to num do
		writeLn('Los precios ordenados de menor a mayor son: ', V2[I].precio);
end;

var
	v:vector;
	v2:vector2;
	num:integer;
begin
	num:=0;
	CargarLista(v);
	recorrerlista(v);
	productosrubro3(v2,num,v[3]);
	ordenarvector2(v2,num);
	mostrarPrecios(v2,num);
end.
