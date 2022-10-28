
program Tp7Ejercicio7;

uses crt;

type

centro= record
		nombre:string;
		uni:string;
		cantI:integer;
		cantB:integer;
		end;
		


procedure leer (var c:centro);		//carga el registro
	begin
		writeln('Ingrese nombre abreviado del centro');
		readln(c.nombre);
		writeln('Ingrese nombre de la universidad');
		readln(c.uni);
		writeln('Ingrese cantidad de investigadores que posee');
		readln(c.cantI);
		writeln('Ingrese cantidad de becarios que posee');
		readln(c.cantB);
	end;

procedure maximos (c:centro; var m1,m2:string; var num1,num2:integer);	//calculo maximos
	begin
		if (c.cantB>num1) then
			begin
				num2:=num1;		//actualizo maximos		
				m2:=m1;			//actualizo nombre 
				num1:=c.cantB;	//nuevo maximo
				m1:=c.nombre;	//nuevo nombre
			end
		else 
			if (c.cantB>num2) then
				begin
					num2:=c.cantB;	
					m2:=c.nombre;
				end;
	end;

procedure maxInv (c:centro; var m:integer; var n:string);
	begin
		if (c.cantI>m) then
			begin
				m:=c.cantI;
				n:=c.uni;
			end;
	end;	


var 

centrosDeI:centro;
contC, max1, max2, maxI: integer; 		//contador de centros por universidad, maximos 1 y 2 , maximo para investigadores
nMax1, nMax2, actual, nMaxI: string;			// los centros con mayor cantidad de becarios, actual para ver universidad actual, nombre de uni con mas investigadores


BEGIN

max1:=0;
max2:=0;
nMax1:=' ';
nMax2:=' ';
nMaxI:=' ';
leer(centrosDeI);	

while (centrosDeI.cantI<>0) do
	begin
	
		actual:=centrosDeI.uni;
		contC:=0;
		maxI:=0;
		while (centrosDeI.cantI<>0) and (actual=centrosDeI.uni) do
			begin
			
				contC:=contC+1;						//sumo uno al contador de centros de esa universidad
				maxInv(centrosDeI,maxI,nMaxI);		
				maximos(centrosDeI,nMax1,nMax2,max1,max2);
				leer(centrosDeI);
			end;

		writeln('La cantidad de centros de investigacion de la universidad ',actual,' es de : ', contC);
	end;
	
	writeln('La universidad con mayor cantidad de investigadores en sus centros es: ',nMaxI);
	writeln('El centro con mayor cantidad de becarios es: ',nMax1,' y el segundo mayor es: ',nMax2);
	
END.

