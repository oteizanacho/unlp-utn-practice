"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Alumno
	instanceVariableNames: 'nombre apellido legajo regular'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Alumno guid: (GUID fromString: '{159EB939-4AB6-4C10-BBDC-EFCA5349D58E}')!
Alumno comment: ''!
!Alumno categoriesForClass!Kernel-Objects! !
!Alumno methodsFor!

inicializarAlum: unNombre con:unApellido con:unLegajo con:unRegular
nombre:=unNombre.
apellido:=unApellido.
legajo:=unLegajo.
regular:=unRegular.!

modificarApellido:unApellido
apellido:=unApellido.!

modificarLegajo:unLegajo
legajo:=unLegajo.!

modificarNombre:unNombre
nombre:=unNombre.!

modificarRegular:unRegular
regular:=unRegular.!

verApellido
^apellido.!

verLegajo
^legajo.!

verNombre
^nombre.!

verRegular
^regular.! !
!Alumno categoriesFor: #inicializarAlum:con:con:con:!public! !
!Alumno categoriesFor: #modificarApellido:!public! !
!Alumno categoriesFor: #modificarLegajo:!public! !
!Alumno categoriesFor: #modificarNombre:!public! !
!Alumno categoriesFor: #modificarRegular:!public! !
!Alumno categoriesFor: #verApellido!public! !
!Alumno categoriesFor: #verLegajo!public! !
!Alumno categoriesFor: #verNombre!public! !
!Alumno categoriesFor: #verRegular!public! !

!Alumno class methodsFor!

crearAlumno:unNombre con:unApellido con:unLegajo con:unRegular
^(self new) inicializarAlum: unNombre con:unApellido con:unLegajo con:unRegular.
! !
!Alumno class categoriesFor: #crearAlumno:con:con:con:!public! !

