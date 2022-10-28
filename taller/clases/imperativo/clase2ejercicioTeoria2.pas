program ejercicioTeoria2;

uses crt;


procedure leer (var n:integer);

begin
writeln('Ingrese un numero');
readln(n);
end;

procedure descomponer(n:integer);

var
dig:integer;

begin
dig:= n mod 10;
if (n <> 0) then
	begin
	descomponer(n div 10);
	writeln('Digito: ',dig);
	readkey;
	end
else
	writeln('*************');
end;

var
num:integer;

BEGIN
leer(num);	
while (num<>0) do
	begin
	descomponer(num);
	leer(num);	
	end;
END.

