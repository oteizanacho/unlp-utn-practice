{
   OteizaIgnacioTP2EJ8.pas
   
   Copyright 2020 oteiz <oteiz@DESKTOP-TBN20BP>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program tp2ejercicio8;

uses crt;
var 
monto, mtotal: real;
cant,i,dia,vxdia: integer;

BEGIN
mtotal:=0;
cant:=0;

for i:=1 to 31 do
	begin
	vxdia:=0;
	monto:=1;
	while (monto<>0) do 
		begin 
		writeln('Ingrese monto de venta realizada');
		read(monto);
		mtotal:=mtotal+monto;		// acumulador de ventas 
		vxdia:=vxdia+1; 			// ventas por dia
		end;
	writeln('El total de ventas del dia ', i ,' es de: ',vxdia);
	if (vxdia>cant) then				//control de mayor ventas x dia
		begin
		cant:=vxdia;
		dia:=i;
		end;
	end;
writeln('El total recaudado en el mes es de: ',mtotal);
writeln('El dia con mayor ventas realizadas es el dia numero: ',dia);

END.

