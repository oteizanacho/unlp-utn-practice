def crearL():
    l=[0," "," "," "]
    return l

def cargarL(li,cod,nom,aut,edit):
    li[0]=cod
    li[1]=nom
    li[2]=aut
    li[3]=edit

def vercod(li):
    return li[0]

def vernom(li):
    return li[1]

def veraut(li):
    return li[2]

def verEd(li):
    return li[3]

def modcod(li,otroc):
    li[0]=otroc

def modedit(li,otrae):
    li[3]=otrae

def modnom(li,otron):
    li[1]=otron

def modaut(li,otroa):
    li[2]=otroa

    
