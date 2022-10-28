program untitled;

uses crt;

type

datos = record
		mail:string;
		rol:integer;
		revista:string;
		dias:integer;
		end;
		
lista = ^nodo;

nodo = record
		elem:datos;
		sig:lista;
		end;
		
usuarios = array [1..3600] of datos;
vector = array [1..4] of integer; 		//vector contador

procedure insertarOrdenado (var l:lista; n:datos);

var
aux,act,ant:lista;

begin

new(aux);
aux^.elem:=n;
aux^.sig:=nil;
act:=l;
ant:=l;

while (act<>nil) and (act^.elem.dias < aux^.elem.dias) do
	begin
	ant:=act;
	act:=act^.sig;
	end;

if (act = ant) then
	l:=aux
else
	begin
	ant^.sig:=aux;
	aux^.sig:=act;
	end;
end;

procedure imprimir (l:lista);
begin

while (l<>nil) do
	begin
	writeln('Nombre: ',l^.elem.mail,', dias sin acceso: ',l^.elem.dias);
	l:=l^.sig;
	end;
end;

procedure puntoA (v:usuarios; var p:lista);

var
i:integer;

begin

for i:=1 to 3600 do 
	if (v[i].revista = 'Economica') then
		insertarOrdenado(p,v[i]);
		
imprimir(p);
end;

procedure contador (var vec:vector; rol:integer);
begin
vec[rol]:=vec[rol]+1;
end;

procedure iniciarVec (var v:vector);
var
i:integer;
begin
for i:=1 to 4 do
	v[i]:=0
end;


procedure puntoB (p:lista; var v:vector);
var
rev:string;
i:integer;
begin

while (p<>nil) do
	begin
	rev:=p^.elem.revista;
	while (p<>nil) and (rev=p^.elem.revista) do
		begin
		contador(v,p^.elem.rol);		
		p:=p^.sig;
		end;
	for i:=1 to 4 do
		writeln('Rol: ',i,', cantidad de usuarios: ',v[i]);
	end;
end;

procedure puntoC (v:usuarios);

var
i,max1,max2:integer;
mail1,mail2:string;

begin

max1:=-1;
max2:=-1;
mail1:=' ';
mail2:=' ';

for i:=1 to 3600 do
	begin
	if (v[i].dias > max1) then
		begin
		max2:=max1;
		mail2:=mail1;
		max1:=v[i].dias;
		mail1:=v[i].mail;		
		end;
	if (v[i].dias>max2) then	
		begin
		max2:=v[i].dias;
		mail2:=v[i].mail;
		end;
	end;
writeln('El mail del usuario que hace mas tiempo no ingresa es: ',mail1);
writeln('El mail del segundo usuario que hace mas tiempo no ingresa es: ',mail2);
end;

var

u:usuarios;
l:lista;
c:vector;


BEGIN

puntoA(u,l);
iniciarVec(c);
puntoB(l,c);
puntoC(u);
readkey;
END.

