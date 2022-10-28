from tad_libro import *
from tad_bib import *
from tad_pila import *

#crear varios libros y cargarlos en una biblioteca.

bib1=crearB()
#estaba mal el nombre del metodo ver nombre de la biblioteca
modnomB(bib1,'San Martin')

l1=crearL()
cargarL(l1,123,"ddd","Borges","fff")
l2=crearL()
cargarL(l2,321,"eee","rrr","ttt")
l3=crearL()
cargarL(l3,213,"ccc","Borges","vvv")
#faltaba agregar los libros a la biblioteca
agregarL(bib1,l1)
agregarL(bib1,l2)
agregarL(bib1,l3)
#
#


#generar una pila de libros de "Borges"

pilaBor=crearP()
tam=cantidadL(bib1)


num=int(input("Ingrese codigo de libro a modificar "))

for k in range (tam):
    lib=recuperarL(bib1,k)
    if veraut(lib)== 'Borges':
       apilar(pilaBor,lib)
    if vercod(lib)== num:
        edi=raw_input("Ingrese nueva editorial ")
        modedit(lib,edi)    

print "Libros de Borges/n"

while not esvacia(pilaBor):
    li=desapilar(pilaBor)
    print vernom(li)

print "Lista de libros/n"

for k in range (tam):
    l=recuperarL(bib1,k)
    print vernom(l),verEd(l)
raw_input()




