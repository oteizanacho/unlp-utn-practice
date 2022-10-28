"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Comision
	instanceVariableNames: 'numero alumnos'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Comision guid: (GUID fromString: '{9A00270E-1ED9-492E-945D-315144CAA01A}')!
Comision comment: ''!
!Comision categoriesForClass!Kernel-Objects! !
!Comision methodsFor!

agregarAlumno:unAlumno
alumnos add: unAlumno.!

buscarUnAlumno:unLegajo
^alumnos detect: [:a | a verLegajo = unLegajo ].!

eliminarAlumno:unAlumno
alumnos remove: unAlumno.!

esVacia
^alumnos empty.!

existeAlumno:unAlumno
alumnos includes: unAlumno.!

inicializarComision:unNumero
numero:=unNumero.
alumnos:=OrderedCollection new.!

modificarNumero:unNumero
numero:=unNumero.!

tamanio
^alumnos size.!

verNumero
^numero.!

verTodosAlumnos
^alumnos.! !
!Comision categoriesFor: #agregarAlumno:!public! !
!Comision categoriesFor: #buscarUnAlumno:!public! !
!Comision categoriesFor: #eliminarAlumno:!public! !
!Comision categoriesFor: #esVacia!public! !
!Comision categoriesFor: #existeAlumno:!public! !
!Comision categoriesFor: #inicializarComision:!public! !
!Comision categoriesFor: #modificarNumero:!public! !
!Comision categoriesFor: #tamanio!public! !
!Comision categoriesFor: #verNumero!public! !
!Comision categoriesFor: #verTodosAlumnos!public! !

!Comision class methodsFor!

crearComision:unNumero
^(self new) inicializarComision:unNumero.! !
!Comision class categoriesFor: #crearComision:!public! !

