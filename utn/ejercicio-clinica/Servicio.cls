"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Servicio
	instanceVariableNames: 'jefe nombreServicio coordinador medicos enfermeros camas'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Servicio guid: (GUID fromString: '{F9CB6779-BD44-4D0A-9064-8A5F6363E875}')!
Servicio comment: ''!
!Servicio categoriesForClass!Kernel-Objects! !
!Servicio methodsFor!

agregarCama:unaCama
camas add:unaCama.!

agregarEnfermero:unEnfermero
enfermeros add: unEnfermero.!

agregarMedico:unMedico
medicos add:unMedico.!

buscarEnfermero:unNombre
^enfermeros detect: [:e | e verNombre = unNombre ].!

buscarMedico:unLegajo
^medicos detect: [:m | m verLegajo = unLegajo].!

eliminarCama:unaCama
camas remove:unaCama.!

eliminarEnfermero:unEnfermero
enfermeros remove: unEnfermero.!

eliminarMedico:unMedico
medicos remove: unMedico.!

esVaciaCama
^camas empty.!

esVacioEnfermeros
^enfermeros empty.!

esVacioMedicos
^medicos empty.!

existeCama:unCama
^camas includes:unCama.!

existeEnfermero:unEnfermero
^enfermeros includes: unEnfermero.!

existeMedico:unMedico
^medicos includes:unMedico.!

inicializarServicio:unNombreS con:unJefe con:unCoordinador
nombreServicio:=unNombreS.
jefe:=unJefe.
coordinador:=unCoordinador.
medicos:=OrderedCollection new.
enfermeros:=OrderedCollection new.
camas:=OrderedCollection new.!

modCoordinador:unCoordinador
coordinador:=unCoordinador.!

modJefe:unJefe
jefe:=unJefe.!

modNombre:unNombre
nombreServicio:=unNombre.!

tamanioCamas
^camas size.!

tamanioEnfermero
^enfermeros size.!

tamanioMedicos
^medicos size.!

verCoordinador
^coordinador.!

verJefe
^jefe.!

verNombreS
^nombreServicio.!

verTodasCamas
^camas.!

verTodosEnfermeros
^enfermeros.!

verTodosMedicos
^medicos.! !
!Servicio categoriesFor: #agregarCama:!public! !
!Servicio categoriesFor: #agregarEnfermero:!public! !
!Servicio categoriesFor: #agregarMedico:!public! !
!Servicio categoriesFor: #buscarEnfermero:!public! !
!Servicio categoriesFor: #buscarMedico:!public! !
!Servicio categoriesFor: #eliminarCama:!public! !
!Servicio categoriesFor: #eliminarEnfermero:!public! !
!Servicio categoriesFor: #eliminarMedico:!public! !
!Servicio categoriesFor: #esVaciaCama!public! !
!Servicio categoriesFor: #esVacioEnfermeros!public! !
!Servicio categoriesFor: #esVacioMedicos!public! !
!Servicio categoriesFor: #existeCama:!public! !
!Servicio categoriesFor: #existeEnfermero:!public! !
!Servicio categoriesFor: #existeMedico:!public! !
!Servicio categoriesFor: #inicializarServicio:con:con:!public! !
!Servicio categoriesFor: #modCoordinador:!public! !
!Servicio categoriesFor: #modJefe:!public! !
!Servicio categoriesFor: #modNombre:!public! !
!Servicio categoriesFor: #tamanioCamas!public! !
!Servicio categoriesFor: #tamanioEnfermero!public! !
!Servicio categoriesFor: #tamanioMedicos!public! !
!Servicio categoriesFor: #verCoordinador!public! !
!Servicio categoriesFor: #verJefe!public! !
!Servicio categoriesFor: #verNombreS!public! !
!Servicio categoriesFor: #verTodasCamas!public! !
!Servicio categoriesFor: #verTodosEnfermeros!public! !
!Servicio categoriesFor: #verTodosMedicos!public! !

!Servicio class methodsFor!

crearServicio:unNombreS con:unJefe con:unCoordinador
^(self new) inicializarServicio:unNombreS con:unJefe con:unCoordinador.! !
!Servicio class categoriesFor: #crearServicio:con:con:!public! !

