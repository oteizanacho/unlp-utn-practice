
program Tp3Ej17a;

uses crt;

procedure Rendimiento (hectareas:real ; tipo: integer ; precio:real ; var rendimiento:real);
	begin
		case tipo of
			1: rendimiento:= (hectareas*precio) / 6;
			2: rendimiento:= (hectareas*precio) / 2.6;
			3: rendimiento:= (hectareas*precio) / 1.4;
	
		else
			writeln('Zona erronea');
		end;
	end;
	
var

ha,uss,rend:real;
tip:integer;
resp:char;

BEGIN
//resp:='s';
writeln('Ingresa plantacion? s/n');
read(resp);
while resp='s' do
	begin
		writeln('Ingrese la cantidad de hectareas sembradas');
		readln(ha);
		writeln('Ingrese el tipo de zona de siembra');
		readln(tip);
		writeln('Ingrese el precio de la tonelada de soja en U$S');
		read(uss);
		//clrscr;
		rendimiento(ha, tip, uss, rend);
		if (tip<=3)and(tip>=1) then
			writeln('El rendimiento economico esperado de la plantacion ingresada es de: ',rend:4:2);
		writeln('Desea ingresar otra plantacion? s/n');
		readln(resp);
		
	end;
END.

