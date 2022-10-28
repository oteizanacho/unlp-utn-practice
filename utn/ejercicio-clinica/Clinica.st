|r nom ser jef coor med enf cama leg esp hor num nomP diag obraC obra cober cli terapia  tur|
cli:=Clinica crearClinica: 'Clinica UTN'.
r:='s'.
[r='s'] whileTrue: [
   nom:=Prompter prompt: 'Ingrese el nombre de la obra'.
   cober:=Prompter prompt: 'Ingrese la cobertura de la obra'.
   obraC:=ObraSocial crearObraSocial: nom con: cober.
   cli agregarObra:obraC.
   r:=Prompter prompt: 'Desea ingresar otra obra? s/n'.
  ].
r:='s'.
[r='s'] whileTrue: [
         nom:=Prompter prompt: 'Ingrese el nombre del servicio'.
         jef:=Prompter prompt: 'Ingrese el nombre del jefe'.
         coor:=Prompter prompt: 'Ingrese el nombre del coordinador'.
         ser:=Servicio crearServicio: nom con: jef con: coor.
              r:='s'.
                Transcript show: 'Medicos'.
               Transcript cr.
               [r='s']whileTrue: [
               nom:=Prompter prompt: 'Ingrese el nombre del medico'.
                leg:=IntegerPrompter prompt: 'Ingrese el legajo del medico'.
                esp:=Prompter prompt: 'Ingrese la especialidad del medico'.
                hor:=IntegerPrompter prompt: 'Ingrese el horario del medico'.
                med:=Medico crearMedico: nom con: leg con: esp con: hor.
                 ser agregarMedico: med.
                r:=Prompter prompt: 'Desea Ingresar otro medico ? s/n'.
                                   ].
               Transcript show: 'Enfermeros'.
                Transcript cr.
                r:='s'.
                [r= 's']whileTrue: [
                nom:=Prompter prompt: 'Ingrese el nombre del enfermero'.
                tur:=Prompter prompt: 'Ingrese el turno del enfermero'.
                enf:=Enfermero crearEnfermero: nom con: tur.
                 ser agregarEnfermero: enf.
                 r:=Prompter prompt: 'Desea ingresar otro enfermero ? s/n'.
                                        ].
                 Transcript show:'Camas'.
                  Transcript cr.
                  r:='s'.
                 [r= 's']whileTrue: [
                   num:=IntegerPrompter prompt: 'Ingrese el numero de la cama'.
                   nom:=Prompter prompt: 'Ingrese el nombre del paciente'.
                    diag:=Prompter prompt: 'Ingrese el diagnostico del paciente'.
                    obra:=Prompter prompt: 'Ingrese la obra social del paciente'.
                    dia:=IntegerPrompter prompt: 'Ingrese el dia de la fecha de ingreso'.
                    mes:=IntegerPrompter prompt: 'Ingrese el mes de la fecha de ingreso'.
                     anio:=IntegerPrompter prompt: 'Ingrese el año de la fecha de ingreso'.
                     fecha:=Date newDay: dia monthNumber: mes year: anio.
                     cama:=Cama crearCama: num con: nom con: diag con: obra con: fecha.
                     ser agregarCama: cama.
                     r:=Prompter prompt: 'Desea ingresar otra cama? s/n'.
                    ].
            cli agregarServicio:ser. 
            r:=Prompter prompt: 'Desea ingresar otro servicio? s/n'. ].
ser:=cli verTodosSer.
terapia:=ser select: [:s |s verNombre = 'terapia intensiva'.].
camas:=terapia verTodasCamas.
obra:=camas collect: [:each | each verObra].
obraSR:=obra asSet.
d:=Dictionary new.
obraSR do: [:oSR| d at: (oSR verObra) put:(obra occurrencesOf: oSR)].


