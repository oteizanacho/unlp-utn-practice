from tadprod import *
from tadsuperm import *

p=crearp()
cargarp(p,321,"nom","marca",32)      #3 prod especificos
p2=crearp()
cargarp(p2,123,"nom2","marca2",23)
p3=crearp()
cargarp(p3,132,"nom3","marca3",13)

sup=crearsuper()
cargarsuper(sup,p)
cargarsuper(sup,p2)        #prod cargados
cargarsuper(sup,p3)

for i in range (0,tamanio(sup)):
    prod=recuperarprod(sup,i)
    if verpre(prod)<30:
                    #print(prod) #imprime todos los datos del producto, pero
        print(vercod(prod))     #deberia conocer la estructura interna
        print(vernom(prod))
        print(vermar(prod))
        print(verpre(prod))
        
raw_input()
