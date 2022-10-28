Program Actividad5;
Const
   dimF = 20;
Type
   sub = 1..dimF;
   vector = array [sub] of integer;

   procedure CrearVector (var v: vector);
   var
      i: integer;
   begin
      for i:= 1 to dimF do begin
         write('ingrese un numero :');
         read(v[i]);
      end;
   end;

   procedure ImprimirVector (v: vector);
   var
      i: integer;
   begin
      for i:= 1 to dimF do
         writeln(' numero :',v[i]);
   end;

   procedure Maximo (v: vector; i: integer; var max: integer);
   begin
      if (i <= dimf) then begin
         if (v[i] > max) then
            max:= v[i];

         Maximo(v,i+1,max);
      end;
   end;

   procedure Suma (v: vector; i: integer; var s: integer);
   begin
      if (i <= dimF) then
         s:= s + v[i];

         Suma(v,i+1,s);
   end;

VAR
   v: vector;
   max,s: integer;
Begin
   CrearVector(v);
   writeln('GENERAR VECTOR DE NUMEROS :');
   ImprimirVector(v);
   writeln;
   max:= -1;
   Maximo(v,1,max);
   writeln('el maximo valor del vector es :',max);
   writeln;
   s:= 0;
   Suma(v,1,s);
   writeln('la suma de los valores contenidos en el vector es :',s);
   readln;
   readln;
End.
