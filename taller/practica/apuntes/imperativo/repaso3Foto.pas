
program repaso3Foto;
type

venta=record
	fecha:string;
	cod:integer;
	cant:integer;
	monto:real;
end;

arbol=^nodo;

nodo=record
	datocod:integer;
	datocant:integer;
	HI:arbol;
	HD:arbol;
end;

procedure LeerVenta (var v:venta);
begin
	writeln('ingrese codigo');
	readln (v.cod);
	if(v.cod <> -1) then begin
		writeln('ingrese fecha');
		readln (v.fecha);
		writeln('ingrese cantidad vendida');
		readln (v.cant);
		writeln('ingrese monto total de la venta');
		readln (v.monto);
	end
end;

procedure CrearArbol(var a:arbol;cod:integer;cant:integer);
begin
	if(a = nil) then begin;
		new(a);
		a^.datocod:=cod;
		a^.datocant:=cant;
		a^.HI:=nil;
		a^.HD:=nil;
	end
	else begin
		if (cod < a^.datocod) then
			CrearArbol(a^.HI,cod,cant)
		else 
			if (cod > a^.datocod) then
				CrearArbol(a^.HD,cod,cant)
			else
				a^.datocant:= a^.datocant + cant;
	end
end;

procedure CargarArbol (var a:arbol);
var
	v:venta;
begin
	LeerVenta (v);
	while(v.cod <> -1) do begin
		CrearArbol (a,v.cod,v.cant);
		LeerVenta (v);
	end
end;

Procedure BusquedaAcotada (a:arbol;inf:integer; sup:integer; var suma:integer);
begin
if(a<>nil) then begin
	if (a^.datocod>=inf) and (a^.datocod<=sup)then begin
		suma:= suma + a^.datocant;
		BusquedaAcotada (a^.HI,inf,sup,suma);
		BusquedaAcotada (a^.HD,inf,sup,suma);
	end
	else
	if (a^.datocod<inf) then
		BusquedaAcotada (a^.HD,inf,sup,suma)
		else 
		if (a^.datocod>sup) then
		BusquedaAcotada (a^.HI,inf,sup,suma)
		end;
end;

var
	a:arbol;
	inf:integer;
	sup:integer;
	suma:integer;
begin
	CargarArbol (a);
	writeln('ingrese codigo inferior');
	readln (inf);
	writeln('ingrese codigo superior');
	readln (sup);
	BusquedaAcotada (a,inf,sup,suma);
	writeln('la cantidad vendida entre los codigos ', inf, ' y ',sup, ' es de ', suma);
end.
