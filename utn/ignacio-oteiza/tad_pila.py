from tad_libro import *

def crearP():
    p=[]
    return p

def apilar(P,L):
    P.append(L)

def desapilar(P):
    ele=P.pop()
    return ele

def esvacia(P):
    if P==[]:
        return True
    else:
        return False

def duplicar(P1,P2):
    P2=crearP()
    while not esvacia(P1):
        li=desapilar(P1)
        apilar(P2,li)

