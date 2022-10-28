from tadprodfe import *

def crearsuper():
    superm=[]
    return superm

def cargarsuper(superm,prod):       #agrega al final un solo producto
    superm.append(prod)
 
def tamanio(superm):
    return len(superm)

def eliminarprod(superm,prod):
    superm.remove(prod)

def existeprod(superm,prod):
    return prod in superm

def recuperarprod(superm,i):
    return superm[i]


    
