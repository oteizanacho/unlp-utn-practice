|alu nom leg ape turn num comi resp|
turn:=Prompter prompt: 'Ingrese el turno tarde o mañana'.
num:=IntegerPrompter prompt: 'ingrese el numero de la comision'.
comi:=Comision crearComision: turn con: num.
resp:='si'.
[resp = 'si'] whileTrue: [
         nom:=Prompter prompt: 'Ingrese el nombre del alumno'.
         ape:=Prompter prompt: 'Ingrese el apellido del alumno'.
          leg:=Prompter prompt: 'Ingrese el legajo del alumno'.
          alu:=Alumno crearAlumno: nom con: ape con: leg.
          comi agregarAlumno: alu.
           resp:=Prompter prompt: 'Desea ingresar otro alumno? si/no'.
           ].
comi inspect.