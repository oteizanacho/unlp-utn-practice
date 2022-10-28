from datetime import *

def crearCliente():
    cliente=["","",0,0,0,"",0]     #0:apellido, 1:nombre, 2:fecha, 3:tipo, 4:precio, 5:franja, 6:nro cliente
    return cliente

def cargarCliente(cliente,ape,nom,fe,tipo,pre,fra,ncli):
    cliente[0]=ape
    cliente[1]=nom
    cliente[2]=fe
    cliente[3]=tipo
    cliente[4]=pre
    cliente[5]=fra
    cliente[6]=ncli

def verape(cliente):
    return cliente[0]

def vernom(cliente):
    return cliente[1]

def verfe(cliente):
    return cliente[2]

def vertipo(cliente):
    return cliente[3]

def verpre(cliente):
    return cliente[4]

def verfra(cliente):
    return cliente[5]

def verncli(cliente):
    return cliente[6]

def modape(cliente,otroa):
    cliente[0]=otroa

def modnom(cliente,otron):
    cliente[1]=otron

def modfe(cliente,otrafe):
    cliente[2]=otrafe

def modtipo(cliente,otrotipo):
    cliente[3]=otrotipo

def modpre(cliente,otropre):
    cliente[4]=otropre

def modfra(cliente,otrafra):
    cliente[5]=otrafra

def modncli(cliente,otronro):
    cliente[6]=otronro
