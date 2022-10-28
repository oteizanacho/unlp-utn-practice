
program parcial;
type
	fecha = record
		dia: integer;
		mes: 1..12;
		anio: integer;
	end;
	ventas = record
		fecha1: fecha;
		codigo: integer;
		cantv: integer;
		monto: integer;
	end;
	ventas2 = record
		codigo: integer;
		cantv: integer;
	end;
	arbol = ^nodo;

	nodo = record
		dato : ventas2;
		hi : arbol;
		hd : arbol;
	end;

procedure leerfecha (var f: fecha);
begin
	writeln ('ingrese dia');
	readln (f.dia);
	writeln ('ingrese mes');
	readln (f.mes);
	writeln ('ingrese anio');
	readln (f.anio);
end;
procedure leer (var v: ventas; var f: fecha);
begin
	writeln ('ingrese codigo de producto');
	readln (v.codigo);
	if (v.codigo <> -1) then begin
		leerfecha (f);
		writeln ('ingrese cantidad ventas');
		readln (v.cantv);
		writeln ('ingrese monto');
		readln (v.monto);
	end;
end;

procedure agregar(var a : arbol; v2: ventas2);
begin
  if(a = nil) then begin
    new(a);
    a^.dato := v2;
    a^.hi := nil;
    a^.hd := nil;
  end
  else
	if (a^.dato.codigo = v2.codigo) then begin
		a^.dato.cantv := a^.dato.cantv + v2.cantv;
	end;
    if(a^.dato.codigo > v2.codigo) then begin
      agregar(a^.hi,v2)
    end;
    if (a^.dato.codigo < v2.codigo) then begin
      agregar(a^.hd,v2);
    end;
end;

procedure generarArbol(var a : arbol);
var
	v: ventas;
	v2: ventas2;
	f: fecha;
begin
  leer (v,f);
  v2.codigo := v.codigo;
  v2.cantv := v.cantv;
  while(v.codigo <> -1) do begin
	agregar (a,v2);
	leer (v,f);
	v2.codigo := v.codigo;
	v2.cantv := v.cantv;		
  end;

end;
	
procedure imprimir (a: arbol);
begin
	if (a<>nil) then begin
		writeln ('codigo de producto ', a^.dato.codigo);
		writeln  ('cantidad de ventas  ', a^.dato.cantv);
		imprimir (a^.hi);
		imprimir (a^.hd);
	end;
end;

procedure busqueda (a: arbol; cantidadrecibida: integer; var cantidad: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.cantv > cantidadrecibida) then begin
			cantidad:= cantidad + 1;
			busqueda(a^.hi,cantidadrecibida,cantidad);
			busqueda (a^.hd,cantidadrecibida,cantidad);
		end;
	end;
end;
	

var
	a: arbol;
	cant: integer;
begin
	a:= nil;
	generarArbol (a);
	imprimir (a);
	busqueda (a, 50, cant);
	writeln ('cantidad ', cant);
end.

