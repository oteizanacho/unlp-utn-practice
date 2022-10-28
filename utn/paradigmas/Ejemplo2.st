|cons auto1 auto2 autos auto3 auto4 cerok autoFord marcaConR marcaSinR d|
cons:=Concesionaria crearConsecionaria: 'Don Auto'.
auto1:=Auto crearAuto: 123 con: 'Fiesta' con: 'Ford' con: 0 con: 2019.
auto2:=Auto crearAuto: 12345 con: 'one' con:'Fiat' con: 12385855 con: 2000.
auto3:=Auto crearAuto: 15544 con: 'Gol' con: 'Vw' con: 0 con: 2019.
auto4:=Auto crearAuto: 1234544 con: 'Focus' con: 'Ford' con: 222222 con: 2016.
cons agregarAuto: auto2.
cons agregarAuto: auto1.
cons agregarAuto: auto3.
cons agregarAuto: auto4.
autos:=cons recuperarTodos.
marcaConR:=autos collect: [:each | each verMarca].
marcaSinR:=marcaConR asSet.
"Por cada marca cuantos autos en la consecionaria existen"
d:=Dictionary new.
marcaSinR do: [:each | d at: each put:(marcaConR occurrencesOf:each)].
d inspect.
cons inspect.
marcaConR inspect.
marcaSinR inspect.
"autoFord:=autos select: [:each |  each verMarca = 'Ford'].
Transcript show: 'Cantidad de autos Ford es= ', (autoFord size)printString.
cerok:=autos select: [:a | a verKm=0 ]."
"cerok inspect."
