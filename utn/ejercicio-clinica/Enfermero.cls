"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Enfermero
	instanceVariableNames: 'nombre turno'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Enfermero guid: (GUID fromString: '{1F962770-5E27-40AA-9A97-A30FFD871C3B}')!
Enfermero comment: ''!
!Enfermero categoriesForClass!Kernel-Objects! !
!Enfermero methodsFor!

inicializarEnfermero:unNombre con:unTurno
nombre:=unNombre.
turno:=unTurno.!

modNombre:unNombre
nombre:=unNombre.!

modTurno:unTurno
turno:=unTurno.!

verNombre
^nombre.
!

verTurno
^turno.! !
!Enfermero categoriesFor: #inicializarEnfermero:con:!public! !
!Enfermero categoriesFor: #modNombre:!public! !
!Enfermero categoriesFor: #modTurno:!public! !
!Enfermero categoriesFor: #verNombre!public! !
!Enfermero categoriesFor: #verTurno!public! !

!Enfermero class methodsFor!

crearEnfermero:unNombre con:unTurno
^(self new) inicializarEnfermero:unNombre con:unTurno.! !
!Enfermero class categoriesFor: #crearEnfermero:con:!public! !

