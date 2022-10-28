from tad_libro import *
from tad_bib import *
from tad_pila import *

#crear varios libros y cargarlos en una biblioteca.

bib1=crearB()
modnom(bib1,"San Martin")

l1=crearL()
cargarL(l1,123,"ddd","Borges","fff")
l2=crearL()
cargarL(l2,321,"eee","rrr","ttt")
l3=crearL()
cargarL(l3,213,"ccc","Borges","vvv")
#
#
#


#generar una pila de libros de "Borges"

pilaBor=crearP()
tam=cantidadL(bib1)
num=input("Ingrese codigo de libro a modificar ")

for k in range (tam):
    l=recuperarL(bib1,k)
  #  if veraut(l)=='Borges':
   #     apilar(pilaBor,l)
    if vercod(l)==num:
        edi=input("Ingrese nueva editorial ")
        moded(l,edi)    #

print "Libros de Borges/n"

while not esvacia(pilaBor):
    li=desapilar(pilaBor)
    print vertit(li)

print "Lista de libros/n"

for k in range (tam):
    l=recuperarL(bib1,k)
    print vernom(l),vered(l)
raw_input()




