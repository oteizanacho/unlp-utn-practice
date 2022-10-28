"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Auto
	instanceVariableNames: 'numero marca modelo km color anio'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Auto guid: (GUID fromString: '{BA5DBFBF-BCCA-416B-B658-1BA11F7AF4EB}')!
Auto comment: ''!
!Auto categoriesForClass!Kernel-Objects! !
!Auto methodsFor!

inicializarAuto:unNumero con:unModelo con:unaMarca con:unKm con:unAnio
numero:=unNumero.
modelo:=unModelo.
marca:=unaMarca.
km:=unKm.
anio:=unAnio.!

modificarAnio:unAnio
anio:=unAnio.!

modificarColor:unColor
color:=unColor.!

modificarKm:unKm
km:=unKm.!

modificarMarca:unaMarca
marca:=unaMarca.!

modificarModelo:unModelo
modelo:=unModelo.!

modificarNumero:unNumero
numero:=unNumero.
!

verAnio
^anio.!

verColor
^color.!

verKm
^km.!

verMarca
^marca.!

verModelo
^modelo.!

verNumero
^numero.
! !
!Auto categoriesFor: #inicializarAuto:con:con:con:con:!public! !
!Auto categoriesFor: #modificarAnio:!public! !
!Auto categoriesFor: #modificarColor:!public! !
!Auto categoriesFor: #modificarKm:!public! !
!Auto categoriesFor: #modificarMarca:!public! !
!Auto categoriesFor: #modificarModelo:!public! !
!Auto categoriesFor: #modificarNumero:!public! !
!Auto categoriesFor: #verAnio!public! !
!Auto categoriesFor: #verColor!public! !
!Auto categoriesFor: #verKm!public! !
!Auto categoriesFor: #verMarca!public! !
!Auto categoriesFor: #verModelo!public! !
!Auto categoriesFor: #verNumero!public! !

!Auto class methodsFor!

crearAuto:unNumero con:unModelo con:unaMarca con:unKm con:unAnio
^(self new) inicializarAuto:unNumero con:unModelo con:unaMarca con:unKm con:unAnio.! !
!Auto class categoriesFor: #crearAuto:con:con:con:con:!public! !

