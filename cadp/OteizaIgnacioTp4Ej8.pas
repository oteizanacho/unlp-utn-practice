
program TP4Ejercicio8;

uses crt;

type

proyecto = record
			codigo:integer;
			titulo:string;
			cantAlum:integer;
			nombreEsc:string;
			localidad:string;
			end;

coordinador = record
				dni:integer;
				nombre:string;
				apellido:string;
				email:string;
			end;

procedure leerC (var c:coordinador);
	begin
	writeln('Ingrese dni del coordinador');
	readln(c.dni);
	writeln('Ingrese nombre del coordinador');
	readln(c.nombre);
	writeln('Ingrese apellido del coordinador');
	readln(c.apellido);
	writeln('Ingrese email del coordinador');
	readln(c.email);
	end;


procedure leerP (var p:proyecto; var coord:coordinador);
		begin
		writeln('Ingrese codigo del proyecto');
		readln(p.codigo);
		writeln('Ingrese titulo del proyecto');
		readln(p.titulo);
		writeln('Ingrese cantidad de alumnos que participan');
		readln(p.cantAlum);
		writeln('Ingrese nombre de la escuela');
		readln(p.nombreEsc);
		writeln('Ingrese localidad');
		readln(p.localidad);
		leerC(coord)
		end;

procedure maxAlu (p:proyecto; var m1,m2:integer; var e1,e2:string);
	begin
	if (p.cantAlum>m1) then
		begin
		m2:=m1;
		e2:=e1;
		m1:=p.cantAlum;
		e1:=p.nombreEsc;
		end
	else
		if (p.cantAlum>m2) then
			begin
			m2:=p.cantAlum;
			e2:=p.nombreEsc;	
			end;
	end;

function digitos (cod:integer):boolean;
var
digito, par, impar:integer;
	begin
	par:=0;
	impar:=0;
	digito:=1;
	while (digito<>0) do
		begin
		digito:= cod mod 10;
		if (digito mod 2 = 1) then
			impar:=impar + 1
		else
			par:=par+1;				
		end;
		if (par=impar) then
			digitos:=True
		else
			digitos:=False;
		
	
		end;



var 

pro:proyecto;
coo:coordinador;
localActual, escActual, esc1, esc2:string;
escuelas,totalEsc, max1, max2:integer;
BEGIN
totalEsc:=0;
leerP(pro,coo);
max1:=0;
max2:=0;
esc1:=' ';
esc2:=' ';
while (pro.codigo<>-1) do
	begin
	localActual:=pro.localidad;
	escActual:=pro.nombreEsc;
	while ((pro.codigo<>-1) and (localActual=pro.localidad)) do
		begin
		escuelas:=0;
		while (((pro.codigo<>-1) and (localActual=pro.localidad))and (escActual=pro.nombreEsc)) do
			begin
			escuelas:=escuelas + 1 ;
			totalEsc:=totalEsc + 1 ;
			maxAlu (pro,max1,max2,esc1,esc2);
			if (pro.localidad='Daireaux') then
				if (digitos(pro.codigo)) then
					writeln('Titulo cuyo codigo posee igual cantidad de digitos pares e impares: ',pro.titulo);
			leerP(pro,coo);
			end;
		writeln('La cantidad de escuelas de la localidad de ',localActual,' es de: ',escuelas);
		end;
	end;
	writeln('La cantidad de escuelas que participan es de: ',totalEsc);
	writeln('La escuela con mayor cantidad de alumnos participantes es: ',esc1,' y la segunda es: ',esc2);
END.

