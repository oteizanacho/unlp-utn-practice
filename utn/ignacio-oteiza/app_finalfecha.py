# -*- coding: cp1252 -*-

from tadprodfe import *
from datetime import *
from tadsuperm import *

sup=crearsuper()
for k in range (1,5):
    prod=crearpf()
    nom=raw_input("Ingrese nombre")
    mar=raw_input("Ingrese marca")
    cod=input("Ingrese codigo")
    pre=input("Ingrese precio")
    dia=input("Ingrese dia del vencimiento")
    mes=input("Ingrese mes del vencimiento mm:")
    anio=input("Ingrese año del vencimiento aaaa:")

    fe=date(anio,mes,dia)
    cargarp(prod,cod,nom,mar,pre,fe)
    agregar(sup,prod)
    hoy=date.today()
    tam=tamanio(sup)
    for i in range (0,tam):
        prod=recuperar(sup,i)
        if verfe(pr)<hoy:
            print "Prod vencido:",vercod(prod)
