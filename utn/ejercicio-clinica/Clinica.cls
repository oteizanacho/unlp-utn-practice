"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Clinica
	instanceVariableNames: 'nombre servicios obrasSociales'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Clinica guid: (GUID fromString: '{76E73AE1-E2A8-4E3C-A4C1-61C92EF6236C}')!
Clinica comment: ''!
!Clinica categoriesForClass!Kernel-Objects! !
!Clinica methodsFor!

agregarObra:unaObra
obrasSociales add:unaObra.!

agregarServicio:unServicio
servicios add:unServicio.!

buscarObra:unNombre
^obrasSociales detect: [:o | o verNombre = unNombre ].!

buscarServicio:unNombre
^servicios detect: [:s | s verNombreS = unNombre].
!

eliminarObra:unaObra
obrasSociales remove: unaObra.!

eliminarServicio:unServicio
servicios remove: unServicio.!

esVacioObras
^obrasSociales empty.!

esVacioServicios
^servicios empty.!

existeObra:unaObra
^obrasSociales includes: unaObra.!

existeServicio:unServicio
^servicios includes: unServicio.!

inicializarClinica:unNombre
nombre:=unNombre.
servicios:=OrderedCollection new.
obrasSociales:=OrderedCollection new.!

modNombre:unNombre
nombre:=unNombre.!

tamanioObras
^obrasSociales size.!

tamanioServicios
^servicios size.!

verNombre
^nombre.!

verTodosObras
^obrasSociales.!

verTodosSer
^servicios.! !
!Clinica categoriesFor: #agregarObra:!public! !
!Clinica categoriesFor: #agregarServicio:!public! !
!Clinica categoriesFor: #buscarObra:!public! !
!Clinica categoriesFor: #buscarServicio:!public! !
!Clinica categoriesFor: #eliminarObra:!public! !
!Clinica categoriesFor: #eliminarServicio:!public! !
!Clinica categoriesFor: #esVacioObras!public! !
!Clinica categoriesFor: #esVacioServicios!public! !
!Clinica categoriesFor: #existeObra:!public! !
!Clinica categoriesFor: #existeServicio:!public! !
!Clinica categoriesFor: #inicializarClinica:!public! !
!Clinica categoriesFor: #modNombre:!public! !
!Clinica categoriesFor: #tamanioObras!public! !
!Clinica categoriesFor: #tamanioServicios!public! !
!Clinica categoriesFor: #verNombre!public! !
!Clinica categoriesFor: #verTodosObras!public! !
!Clinica categoriesFor: #verTodosSer!public! !

!Clinica class methodsFor!

crearClinica:unNombre
^(self new) inicializarClinica:unNombre.! !
!Clinica class categoriesFor: #crearClinica:!public! !

