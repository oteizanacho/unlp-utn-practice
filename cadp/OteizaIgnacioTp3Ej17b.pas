
program Tp3Ej17b;

uses crt;

function Rendimiento (hectareas:real; tipo:integer):real;	//calculo de rendimiento
	begin
		case tipo of
			1: Rendimiento:= (hectareas*320) * 6;
			2: Rendimiento:= (hectareas*320) * 2.6;
			3: Rendimiento:= (hectareas*320) * 1.4;
		else
			Rendimiento:=0;
		end;
	end;

procedure Maximos (rendimiento:real; var mayor:real; var menor:real);	//calcula maximo y minimo
	begin
		if (rendimiento<menor) then
			menor:= rendimiento;
		if (rendimiento>mayor) then
			mayor:= rendimiento;
	end;
	
const

usd = 320;

var

ha,rend,men,may:real;					//hectareas,rendimiento,menor,mayor
tip,cont:integer;						//tipo de zona, contador
local,localmen,localmay:string;			//nombre de localidad, localidad con menor rendimiento, localidad con mayor rendimiento

BEGIN

men:=30000;		//variable que almacena el menor valor
may:=-1;		// almacena el mayor valor
cont:=0;		//contador para los casos en los q sea de 3deFeb y >10000

repeat
	writeln('Ingrese la cantidad de hectareas sembradas');
	readln(ha);
	writeln('Ingrese el tipo de zona de siembra');
	readln(tip);
	writeln('Ingrese localidad');
	readln(local);
	clrscr;
	rend:=Rendimiento(ha, tip+tip);
	if (rend>10000) and (local = 'tres de febrero') then	//contador de campos de 3 de feb
		cont:= cont + 1;
	Maximos(rend, may, men);
	if (may=rend) then			//si el maximo calculado es igual al rendimiento, significa que la localidad ingresada es la de mayor rendimiento
		localmay:=local;
	if (men=rend) then			//si el minimo calculado es igual al rendimiento, significa que la localidad ingresada es la de menor rendimiento
		localmen:=local;
	if (tip<=3)and(tip>=1) then
		writeln('El rendimiento economico esperado de la plantacion ingresada es de: ',rend:4:2);
	until (local='saladillo')and (ha=900);
	
writeln('La cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000 es de: ',cont);
writeln('La localidad del campo con mayor rendimiento económico esperado es: ',localmen);
writeln('La localidad del campo con menor rendimiento económico esperado es: ',localmay);
END.
