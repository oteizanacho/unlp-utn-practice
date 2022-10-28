# -*- coding: cp1252 -*-
from tad_cliente import *
from tad_empresa import *
from datetime import *
   
rta="si"

empresa=crearE()
while rta=="si":

    print("Seleccione una opcion")
    print("1) Agregar cliente ")
    print("2) Modificar cliente ")
    print("3) Eliminar cliente ")
    print("4) Listado de clientes ")
    print("5) Eliminar clientes con cierto tipo de servicio ")
    print("6) Incrementar el precio a clientes ")
    print("7) Clientes con promocion ")
    print("8) Salir ")

    opcionMenu=input("Ingrese opcion")

    if opcionMenu==1:
        cliente=crearCliente()
        ape=raw_input(" Ingrese apellido ")
        nom=raw_input(" Ingrese nombre ")
        d=input(" Ingrese dia de alta ")
        m=input(" Ingrese mes de alta ")
        a=input(" Ingrese año de alta ")
        fe=date(a,m,d)
        tipo=input(" Ingrese tipo de servicio ")
        pre=input(" Ingrese precio del servicio ")
        fra=raw_input(" Ingrese franja horaria para servicio tecnico ")
        ncli=input(" Ingrese numero de cliente ")
        cargarCliente(cliente,ape,nom,fe,tipo,pre,fra,ncli)
        agregarcli(empresa,cliente)

    elif opcionMenu==2:
        print(" Seleccione un dato a modificar ")
        print(" 1) Apellido ")
        print(" 2) Nombre ")
        print(" 3) Fecha de alta ")
        print(" 4) Tipo de servicio ")
        print(" 5) Precio de servicio ")
        print(" 6) Franja horaria para servicio tenico ")
        print(" 7) Numero de cliente ")

        dato=input(" Ingrese opcion ")
        
        tam=tamanio(empresa)        #recorrer lista para encontrar cliente
        num=input(" Ingrese numero de cliente a modificar ")
        for i in range (0,tam):
            cliente=recuperarcli(empresa,i)
            if verncli(cliente)!=num:
                cliente=recuperarcli(empresa,i+1)
            else:
                print("")
            
        if dato==1:
            otroape=raw_input(" Ingrese nuevo apellido ")
            modape(cliente,otroape)
        elif dato==2:
            otron=raw_input(" Ingrese nuevo nombre ")
            modnom(cliente,otron)
        elif dato==3:
            d=input(" Ingrese nueva dia de alta ")
            m=input(" Ingrese nuevo mes de alta ")
            a=input(" Ingrese nuevo año de alta ")
            otrafe=date(a,m,d)
            modfe(cliente,otrafe)
        elif dato==4:
            otrotipo=input(" Ingrese nuevo tipo de servicio ")
            modtipo(cliente,otrotipo)
        elif dato==5:
            otropre=input(" Ingrese nuevo precio ")
            modpre=(cliente,otropre)
        elif dato==6:
            otrafra=raw_input(" Ingrese nueva franja horaria para servicio tecnico ")
            modfra(cliente,otrafra)
        elif dato==7:
            otronro=input(" Ingrese nuevo numero de cliente ")
            modncli(cliente,otronro)
        else:
            print("")
            input(" Opcion invalida ")
            
            
            

    elif opcionMenu==3:
        num=input(" Ingrese numero de cliente a eliminar ")
        tam=tamanio(empresa)
        for i in range (0,tam):
            cliente=recuperarcli(empresa,i)
            if verncli(cliente)!=num:
                cliente=recuperarcli(empresa,i+1)
            else:
                eliminarcli(empresa,cliente)
            

    elif opcionMenu==4:
        print(" Listado de clientes ")
        tam=tamanio(empresa)
        for i in range (0,tam):
            cliente=recuperarcli(empresa,i)
            print " Apellido: ", verape(cliente)
            print " Nombre: ", vernom(cliente)
            print " Fecha de alta: ", verfe(cliente)
            print " Tipo de servicio: ", vertipo(cliente)
            print " Precio: ", verpre(cliente)
            print " Franja horaria para servicio tenico: ", verfra(cliente)
            print " Numero de cliente: ", verncli(cliente)
            print ("________________")

    elif opcionMenu==5:
        serv=input(" Ingrese tipo de servicio ")
        tam=tamanio(empresa)
        for i in range (0,tam):
            cliente=recuperarcli(empresa,i)
            if vertipo(cliente)!=serv:
                cliente=recuperarcli(empresa,i+1)
            else:
                eliminarcli(empresa,cliente)

    elif opcionMenu==6:
        d=input(" Ingrese dia ")
        m=input(" Ingrese mes ")
        a=input(" Ingrese año ")
        fecha=date(a,m,d)
        tam=tamanio(empresa)
        for i in range (0,tam):
            cliente=recuperarcli(empresa,i)
            if verfe(cliente)< fecha:
                cliente=recuperarcli(empresa,i+1)
            else:
                valor=input(" Ingrese valor de aumento (tener en cuenta que multiplicara el precio) ")
                x=verpre(cliente)*valor             #x = precio nuevo
                modpre(cliente,x)
        

    elif opcionMenu==7:
        print(" Los siguientes clientes siguen en promocion ")
        tam=tamanio(empresa)
        for i in range (0,tam):
            cliente=recuperarcli(empresa,i)
            fecha=verfe(cliente)
            hoy=date.today()
            if hoy.month-fecha.month>3:
                cliente=recuperarcli(empresa,i+1)
            else:
                print(" El cliente sigue en promocion ")
                print " Apellido: ", verape(cliente)
                print " Nombre: ", vernom(cliente)
                print " Fecha de alta: ", verfe(cliente)
                print " Tipo de servicio: ", vertipo(cliente)
                print " Precio: ", verpre(cliente)
                print " Franja horaria para servicio tenico", verfra(cliente)
                print " Numero de cliente: ", verncli(cliente)
                print ("________________")

    elif opcionMenu==8:
        break

    else:
        print("")
        input(" Opcion invalida ")

    rta=raw_input(" Desea seguir operando? si/no")


    
