{
   ejercicio9tp1.pas
   
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


program ejercicio9;

uses crt;
var 

car: char;					//caracter a leer
suma,resta,num : integer;

BEGIN
	suma:=0;
	resta:=0;
	writeln('Ingrese caracter + o -');
	read(car);
	if(car='+') then
		begin
		writeln('Ingrese numero entero, 0 para finalizar');
		read(num);
		while(num<>0)do
			begin
			suma:= suma + num;
			writeln('Ingrese otro numero entero, 0 para finalizar');
			read(num);
			end;
		writeln('El resultado de la suma es de: ', suma);
		end;
	if (car='-') then
		begin
		writeln('Ingrese numero entero, 0 para finalizar');
		read(num);
		while (num<>0) do
			begin
			resta:= resta - num;
			writeln('Ingrese otro numero entero, 0 para finalizar');
			read(num);
			end;
		writeln('El resultado de la resta es de; ', resta);
		end;
	if (car<>'+')and(car<>'-') then
		writeln ('Caracter ingresado incorrecto');

END.

