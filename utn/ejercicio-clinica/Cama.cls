"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Cama
	instanceVariableNames: 'numero nombreP diagnostico obraSocial fechaIngreso'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Cama guid: (GUID fromString: '{75E1442C-E3E5-4227-A00D-6152D745EE9D}')!
Cama comment: ''!
!Cama categoriesForClass!Kernel-Objects! !
!Cama methodsFor!

inicicializarCama:unNumero con:unNombre con:unDiagnostico con:unaObra con:unaFecha
numero:=unNumero.
nombreP:=unNombre.
diagnostico:=unDiagnostico.
obraSocial:=unaObra.
fechaIngreso:=unaFecha.!

modDiagnostico:unDiagnostico
diagnostico:=unDiagnostico.
!

modFecha:unaFecha
fechaIngreso:=unaFecha.!

modNombreP:unNombre
nombreP:=unNombre.!

modNumero:unNumero
numero:=unNumero.!

modObra:unaObra
obraSocial:=unaObra.!

verDiagnostico
^diagnostico.
!

verFecha
^fechaIngreso.!

verNombre
^nombreP.!

verNumero
^numero.!

verObra
^obraSocial.! !
!Cama categoriesFor: #inicicializarCama:con:con:con:con:!public! !
!Cama categoriesFor: #modDiagnostico:!public! !
!Cama categoriesFor: #modFecha:!public! !
!Cama categoriesFor: #modNombreP:!public! !
!Cama categoriesFor: #modNumero:!public! !
!Cama categoriesFor: #modObra:!public! !
!Cama categoriesFor: #verDiagnostico!public! !
!Cama categoriesFor: #verFecha!public! !
!Cama categoriesFor: #verNombre!public! !
!Cama categoriesFor: #verNumero!public! !
!Cama categoriesFor: #verObra!public! !

!Cama class methodsFor!

crearCama:unNumero con:unNombre con:unDiagnostico con:unaObra con:unaFecha
^(self new) inicicializarCama:unNumero con:unNombre con:unDiagnostico con:unaObra con:unaFecha.! !
!Cama class categoriesFor: #crearCama:con:con:con:con:!public! !

