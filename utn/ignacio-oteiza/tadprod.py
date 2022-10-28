def crearp( ):
    pr=[0," "," ",0]
    return pr

def cargarp(prod,cod,nom,mar,pre):
    prod[0]=cod
    prod[1]=nom
    prod[2]=mar
    prod[3]=pre
    
def modnom(prod,otron):
    prod[1]=otron
    
def modmar(prod,otram):
    prod[2]=otram
    
def modcod(prod,otroc):
    prod[0]=otroc
    
def modpre(prod,opre):
    prod[3]=opre
    
def vercod(prod):
    return prod[0]

def vernom(prod):
    return prod[1]

def verpre(prod):
    return prod[3]

def vermar(prod):
    return prod[2]

def asignar(p1,p2):
    p1[0]=p2[0]
    p1[1]=p2[1]
    p1[2]=p2[2]
    p1[3]=p2[3]
    
