"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Concesionaria
	instanceVariableNames: 'nombre autos'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Concesionaria guid: (GUID fromString: '{12134E55-685C-4E3B-B319-5029FDC7D52B}')!
Concesionaria comment: ''!
!Concesionaria categoriesForClass!Kernel-Objects! !
!Concesionaria methodsFor!

agregarAuto:unAuto
autos add: unAuto.!

buscarAuto:unNumero
^autos detect: [:each | each verNumero = unNumero ].!

eliminarAuto:unAuto
autos remove: unAuto.!

esVacio
^autos empty.!

existeAuto:unAuto
^autos includes: unAuto.!

inicializarConsecionaria:unNombre
nombre:=unNombre.
autos:=SortedCollection new sortBlock:[ :i :j|i verNumero < j verNumero].!

modificarNombre:unNombre
nombre:=unNombre.!

recuperarTodos
^autos.!

tamanio
^autos size.!

verNombre
^nombre.! !
!Concesionaria categoriesFor: #agregarAuto:!public! !
!Concesionaria categoriesFor: #buscarAuto:!public! !
!Concesionaria categoriesFor: #eliminarAuto:!public! !
!Concesionaria categoriesFor: #esVacio!public! !
!Concesionaria categoriesFor: #existeAuto:!public! !
!Concesionaria categoriesFor: #inicializarConsecionaria:!public! !
!Concesionaria categoriesFor: #modificarNombre:!public! !
!Concesionaria categoriesFor: #recuperarTodos!public! !
!Concesionaria categoriesFor: #tamanio!public! !
!Concesionaria categoriesFor: #verNombre!public! !

!Concesionaria class methodsFor!

crearConsecionaria:unNombre
^(self new) inicializarConsecionaria:unNombre.! !
!Concesionaria class categoriesFor: #crearConsecionaria:!public! !

