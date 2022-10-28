from tad_libro import *
def crearB():
    biblio=[" ",[] ]
    return biblio

def vernom(bi):
    return bi[0]

def modnom(bi,otro):
    bi[0]=otro

def agregarL(bi,li):
    bi[1].append(li)

def eliminarL(bi,li):
    bi[1].remove(li)

def existeL(bi,li):
    return li in bi[1]

def cantidadL(bi):
    return len(bi[1])

def recuperarL(bi,i):
    x=bi[1]
    return x[i]     #lista de listas



