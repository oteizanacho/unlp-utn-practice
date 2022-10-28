"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Medico
	instanceVariableNames: 'legajo nombre especialidad horario'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Medico guid: (GUID fromString: '{9B16B059-72D0-474E-8045-959B1F515C49}')!
Medico comment: ''!
!Medico categoriesForClass!Kernel-Objects! !
!Medico methodsFor!

inicializarMedico:unNombre con:unLegajo con:unaEspecialidad con:unHorario
legajo:=unLegajo.
nombre:=unNombre.
especialidad:=unaEspecialidad.
horario:=unHorario.!

modEspecialidad:unaEspecialidad
especialidad:=unaEspecialidad.
!

modHorario:unHorario
horario:=unHorario.!

modLegajo:unLegajo
^legajo.!

modNombre:unNombre
nombre:=unNombre.!

verEspecialidad
^especialidad.
!

verHorario
^horario.!

verLegajo
^legajo.
!

verNombre
^nombre.! !
!Medico categoriesFor: #inicializarMedico:con:con:con:!public! !
!Medico categoriesFor: #modEspecialidad:!public! !
!Medico categoriesFor: #modHorario:!public! !
!Medico categoriesFor: #modLegajo:!public! !
!Medico categoriesFor: #modNombre:!public! !
!Medico categoriesFor: #verEspecialidad!public! !
!Medico categoriesFor: #verHorario!public! !
!Medico categoriesFor: #verLegajo!public! !
!Medico categoriesFor: #verNombre!public! !

!Medico class methodsFor!

crearMedico:unNombre con:unLegajo con:unaEspecialidad con:unHorario
^(self new) inicializarMedico:unNombre con:unLegajo con:unaEspecialidad con:unHorario.! !
!Medico class categoriesFor: #crearMedico:con:con:con:!public! !

