|alu com nom ape leg resp alum alu2 j|
com:=Comision crearComision: 64.
resp:='s'.
[resp='s'] whileTrue: [
 Transcript show: 'Ingresar Alumnos'.
  nom:=Prompter prompt: 'Ingrese el nombre del alumno'.
  ape:=Prompter prompt: 'Ingresar apellido'.
  leg:=IntegerPrompter prompt: 'Ingrese numero'.
  alu:=Alumno crearAlumno: nom con: ape con: leg.
  com agregarAlumno: alu.
  resp:=Prompter prompt: '¿Desea ingresar otro alumno? s/n'.
  ].
alum:=com verTodosAlumnos.
resp:=1.
j:=1.
"[com tamanio >= resp]whileTrue: [
 Transcript show: 'Alumno '.
  Transcript cr.
   Transcript show: 'nombre:',(alum at: j)verNombre.
   Transcript cr.
   Transcript show: 'Apellido:', (alum at: j)verApellido.
   Transcript cr.
   resp:=resp+1.
   j:=j+1.
]."
nom:=Prompter prompt: 'Ingrese un nombre a modificar'.
alu2:=alum detect: [:each |  each verNombre = nom].
alu2 modificarNombre: 'Pepe'.
com inspect.a FlipperInspector



