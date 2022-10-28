program parcial;
const
  dimf=5;
  corte=-1;
type
  venta=record
    codproducto:integer;
    cantidadvendida:integer;
    montoTotal:integer;
   end;
  lista=^nodo;
  nodo=record
    v:venta;
    sig:lista;
   end;
  sucursal=array [1..dimf] of lista;
  informacion=record
    producto:integer;
    vendidototal:integer;
  end;
  lista2=^nodo2;
  nodo2=record
    info:informacion;
    sig:lista2;
  end;
procedure leerDatos (var p:venta);
begin
  writeln('ingrese codigo de producto');
  readln(p.codproducto);
  if( p.codproducto <> corte)then
    begin
      writeln('ingrese el cantidad de ventas');
      readln(p.cantidadvendida);
      writeln('ingrese el monto total');
      readln(p.montoTotal);
    end
end;
procedure agregaratras1(var Enuevo:lista ; dato:venta);
Var
  aux,pos,ant: lista;
Begin
  new(aux);
  aux^.v:=dato;
  aux^.sig:=nil;
  if(Enuevo=nil)then
    Enuevo:=aux
  else
    begin
      pos:=Enuevo;
      ant:=Enuevo;
      while(pos<>nil)do
        begin
          ant:=pos;
          pos:=pos^.sig;
        end;
      ant^.sig:=aux;
    end;
End;
procedure inicializarVectores (var v:sucursal);
var
  i:integer;
begin
  for i:=1 to dimf do
    v[i]:=nil;
end;
procedure cargarVector(var v:sucursal);
var
  p:venta;
  i:integer;
  ventas:integer;
begin
  i:=1;
  ventas:=0;
  inicializarVectores(v);
  while (i<=5) do begin
    writeln ('sucursal ',i);
    leerDatos(p);
    while (p.codproducto <> corte) and  (ventas<250)  do begin
      agregaratras1(v[i],p);
      ventas:=ventas+1;
      leerDatos(p);
    end;
    i:=i+1;
    ventas:=0;
  end;
  writeln('se finalizo la carga');
end;

procedure agregaratras2(var Enuevo:lista2 ; dato:informacion);
Var
  aux,pos,ant: lista2;
Begin
  new(aux);
  aux^.info:=dato;
  aux^.sig:=nil;
  if(Enuevo=nil)then
    Enuevo:=aux
  else
    begin
      pos:=Enuevo;
      ant:=Enuevo;
      while(pos<>nil)do
        begin
          ant:=pos;
          pos:=pos^.sig;
        end;
      ant^.sig:=aux;
    end;
End;

procedure minimo(var v:sucursal; var min:venta);
var
  i,indicemin:integer;
begin
  min.codproducto:= 9999 ;
  for i:= 1 to dimf do
    if (v[i]<>nil) and (v[i]^.v.codproducto < min.codproducto) then
      begin
        min:=v[i]^.v;
        indiceMin:=i;
      end;
  if (min.codproducto <> 9999) then
    v[indiceMin]:= v[indiceMin]^.sig;
end;
Procedure mergeAcumulador (v: sucursal; var Enuevo:lista2);
 Var 
   min:venta; 
   actual:integer; 
   cantvendida: integer; 
   dato:informacion;
 Begin
  Enuevo:= nil; 
  minimo (v,min);
  while (min.codproducto <> 9999) do
    begin
     actual:= min.codproducto; 
     cantvendida:=0;
     while ((min.codproducto <> 9999) and (min.codproducto = actual) )do 
     begin
        cantvendida:= cantvendida + min.cantidadvendida;
        minimo (v, min);
     end;
     dato.producto:= actual; 
     dato.vendidototal:= cantvendida;
     agregarAtras2(Enuevo,dato);
    end;
End;  
procedure imprimirnuevo( Enuevo:lista2);
begin
  while(Enuevo<>nil)do
    begin   
      writeln('codigo de producto:',   Enuevo^.info.producto);
      writeln('cantidad de ventas del producto:', Enuevo^.info.vendidototal);
      Enuevo:=Enuevo^.sig;
    end;
end;

var
  v:sucursal;
  Enuevo:lista2;
begin
  cargarVector(v);
  mergeAcumulador(v,Enuevo);
  writeln('se imprimira la cantidad total vendida para cada codigo de producto');
  writeln;
  imprimirnuevo(Enuevo);
  writeln('suma de cantidad vendida de los productos menores a 80');
  readln;
end.
