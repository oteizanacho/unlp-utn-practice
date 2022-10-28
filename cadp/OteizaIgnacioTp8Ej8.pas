program TP8ej8;

uses crt;

type

transferencia = record
	numCO : integer;			//numero de cuenta de origen
	dniCO : integer;			//dni de titular de cuenta de origen
	numCD : integer;			//numero de cuenta destino
	dniCD : integer;			//dni de titular de cuenta destino
	fecha : string;				//solo contiene el mes
	hora : integer;
	monto : real;
	motivo : integer;
	end;

lista = ^ nodo;

nodo = record
	elem : transferencia;
	sig : lista;
	end;

codigo = array [1..7] of integer;

procedure insertarOrdenado (var p:lista; n:transferencia);

var
aux,ant,act : lista;

begin
new (aux);
aux^.elem:=n;
aux^.sig:=nil;
act:=p;
ant:=p;

while (act<>nil) and (act^.elem.numCO < aux^.elem.numCO) do 
	begin
	ant:=act;
	act:=act^.sig;		
	end;

if (act=ant) then
	p:=aux
else
	ant^.sig:=aux;
aux^.sig:=act;
end;

procedure cargarTerceros (var p:lista; l:lista);

begin
while (l<>nil) do 
	begin
	if (l^.elem.dniCO <> l^.elem.dniCD) then
		insertarOrdenado(p,l^.elem);
	l:=l^.sig;	
	end;
end;

procedure inicializar (var v:codigo);

var
i:integer;

begin
for i:=1 to 7 do
	v[i]:=0;
end;

procedure contador (var vec:codigo; i:integer);

begin
vec[i]:=vec[i]+1;
end;

function verifica (cuenta:integer):boolean;

var
dig,par,impar:integer;

begin
par:=0;
impar:=0;

while (cuenta<>0) do
	begin
	dig:= cuenta mod 10; 
	if ((dig mod 2)=0) then
		par:=par+1
	else
		impar:=impar+1;
	cuenta:= cuenta div 10;	
	end;
if (par<impar) then
	verifica:= true
else
	verifica:= false
end;

procedure maximo (vec:codigo);	// para imprimir el maximo motivo

var
i,j,max:integer;

begin
max:=-1;
for i:=1 to 7 do 
	begin
	if (vec[i]>max) then
		begin
		max:=vec[i];
		j:=i;		
		end;	
	end;
writeln('El motivo mas usado para hacer transferencias es: ',j);
end;


procedure recorrido (p:lista; var v:codigo);

var
cuenta:integer;		//cuenta actual 
total:real;			//para acumular montos
junio:integer; 		//contador

begin
junio:=0;
while (p<>nil) do
	begin
	cuenta:=p^.elem.numCO;
	total:=0;
	while (p<>nil) and (p^.elem.numCO = cuenta) do
		begin
		total:=total+p^.elem.monto;
		contador(v,p^.elem.motivo);
		if (p^.elem.fecha = 'junio') and (verifica(p^.elem.numCD)) then
			junio:=junio+1;
		p:=p^.sig;		
		end;
	writeln('El monto total transferido de la cuenta: ',cuenta,' es: ',total);
	end;
writeln('Punto d: ',junio);
maximo(v);
end;

var
transfer : lista;
terceros : lista;
motivo : codigo;

BEGIN
transfer:=nil;
cargarTransferencias(transfer);		//se dispone
terceros:=nil;
cargarTerceros(terceros,transfer);
inicializar(motivo);
recorrido(terceros,motivo);
	
END.

