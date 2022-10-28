{3. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone
en papel de la información de los autos en venta.
Implementar un programa que:
a) Genere un árbol binario de búsqueda ordenado por patente identificatoria
del auto en venta. Cada nodo del árbol debe contener patente, año de
fabricación (2010..2018), la marca y el modelo.
b) Contenga un módulo que recibe el árbol generado en a) y una marca y
devuelva la cantidad de autos de dicha marca que posee la agencia.
Mostrar el resultado.
c) Contenga un módulo que reciba el árbol generado en a) y retorne una
estructura con la información de los autos agrupados por año de
fabricación.
d) Contenga un módulo que reciba el árbol generado en a) y una patente y
devuelva el año de fabricación del auto con dicha patente. Mostrar el
resultado. }

program Ejerc3; 

type
cadena20= String[20];
rango = 2010..2028;

 auto= record
   patente: integer;
   fabricacion: rango;
   marca: cadena20;
   modelo: cadena20;
  end;
  
 arbol= ^nodo;
 
 nodo= record
    dato: auto;
    hi: arbol;
    hd: arbol;
    end;
    
    lista=^nodol;
    
    nodol = record
      dato: auto;
      sig: lista;
    end;
    
  vector= array [rango] of lista;
  
procedure leerAuto (var au: auto);
begin
with au do begin
  writeln ('Ingrese la patente del auto');
  readln (patente);
  if (patente <> -1) then begin
  writeln ('Ingrese el anio de Fabricacion');
  readln (fabricacion);
  writeln ('Ingrese la marca del auto');
  readln (marca);
  writeln ('Ingrese el modelo del auto');
  readln (modelo);
  end;
 end;
end;

 procedure crearArbol (var a: arbol; au: auto);
 begin
  if (A = nil) then
   begin
      new(A);
      a^.dato:= au; a^.hi:= nil; a^.hd:= nil;
   end
   else
    if (au.patente < a^.dato.patente) then crearArbol(a^.hi,au)
    else crearArbol(a^.hd,au)   
 end;
 
 procedure cargarArbol(var a: arbol);
 var
 au: auto;
 begin
  leerAuto(au);
  while (au.patente<> -1) do begin
    crearArbol(a,au);
    leerAuto(au);
  end;
end; 

procedure recorrer(a:arbol;marca:cadena20; var cant: integer);
begin
  if( a<> nil) then begin
   if (a^.dato.marca = marca) then begin
      cant:= cant + 1;
   recorrer(a^.hi,marca,cant);
   recorrer(a^.hd,marca,cant);
    end;
  end;
  end;

 procedure imprimir (cant:integer;marca:cadena20);
  begin
  writeln ('La cant de Autos de la marca: ',marca,' son : ',cant);
  end;
  
  procedure iniv(var v:vector); 
  var
    i:integer;
  begin
    for i:= 2010 to 2018 do 
       v[i]:= nil;
  end;

 Procedure AgregarAdelante(var l:lista; au:auto);
  Var nue:lista;
  Begin
    New(nue);
    nue^.dato:=au;
    nue^.sig:= l;
    l:=nue;
 end;
  
 Procedure vectordeListas (a:arbol; var v:vector);
 begin
   if (a <> nil) then begin
    AgregarAdelante(v[a^.dato.fabricacion],a^.dato);
    vectordeListas(a^.hd,v);
    vectordeListas(a^.hi,v);
   end;
 end;
 
 procedure devolverPatente(a: arbol; pat: integer);
 begin
  if( a<> nil) then begin
   if (a^.dato.patente = pat) then begin
      writeln ('El anio de fabricacion es :',a^.dato.fabricacion);
   devolverPatente(a^.hi,pat);
   devolverPatente(a^.hd,pat);
    end;
  end;
 end;
 
procedure imprimirvl(v:vector);
  var
  i: integer;
begin
   for i:= 2010 to 2018 do begin
     while (v[i] <> nil) do begin
       writeln('Lista' , i , ' contiene: ', v[i]^.dato.fabricacion);
       v[i]:= v[i]^.sig;
    end;
  end;
end;
  
var
 a: arbol;
 marca: cadena20;
 cant,pat: integer;
 v:vector;
begin
  cant:= 0;
  cargarArbol(a);
  writeln ('Ingrese una marca a buscar');
  readln (marca);
  recorrer(a,marca,cant);
  imprimir(cant,marca);
  vectordeListas(a,v);
  writeln ('Ingrese una patente a buscar');
  readln (pat);
  devolverPatente(a,pat);
  imprimirvl(v)
end.
