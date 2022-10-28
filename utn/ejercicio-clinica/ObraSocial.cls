"Filed out from Dolphin Smalltalk 7"!

Object subclass: #ObraSocial
	instanceVariableNames: 'nombre cobertura'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ObraSocial guid: (GUID fromString: '{FFD34C95-318C-48BE-ACDB-E5A32F37FD8F}')!
ObraSocial comment: ''!
!ObraSocial categoriesForClass!Kernel-Objects! !
!ObraSocial methodsFor!

inicializarObraSocial:unNombre con:unaCobertura
nombre:=unNombre.
cobertura:=unaCobertura.!

modCobertura:unaCobertura
cobertura:=unaCobertura.!

modNombre:unNombre
nombre:=unNombre.!

verCobertura
^cobertura.!

verNombre
^nombre.! !
!ObraSocial categoriesFor: #inicializarObraSocial:con:!public! !
!ObraSocial categoriesFor: #modCobertura:!public! !
!ObraSocial categoriesFor: #modNombre:!public! !
!ObraSocial categoriesFor: #verCobertura!public! !
!ObraSocial categoriesFor: #verNombre!public! !

!ObraSocial class methodsFor!

crearObraSocial:unNombre con:unaCobertura
^(self new) inicializarObraSocial:unNombre con:unaCobertura.! !
!ObraSocial class categoriesFor: #crearObraSocial:con:!public! !

