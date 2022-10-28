/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author veroartola
 */
public class Ejercicio3 {
    
     /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        Auto[][] estacionamiento = new Auto[5][10];

        //inicializa Estacionamiento
        for (int i=0;i<5;i++)
            for (int j=0;j<10;j++)  
                estacionamiento[i][j] = null;   
        
        GeneradorAleatorio.iniciar();            //inicia el generador aleatorio
        
        int p = GeneradorAleatorio.generarInt(10);
        int piso;
        int plaza;
        
        while(p != 0){
            
            if((p % 2) == 0 ){
                System.out.println("Pasa");

                Auto a = new Auto();
                a.setPatente(p);

                String nom = GeneradorAleatorio.generarString(6); //Genera un string 
                a.setDueño(nom);
                            
                System.out.println("Ingrese piso (0-4)");
                piso = Lector.leerInt();
                
                System.out.println("Ingrese plaza (0-9)");
                plaza = Lector.leerInt();
            
                estacionamiento[piso][plaza] = a;

            }else
                System.out.println("No pasa");
            
            p = GeneradorAleatorio.generarInt(10);
        }
        

        //piso Mas Ocupado
        int cant, pisoMax = 0, CantMax = -1; 
            
        for (piso=0; piso<5; piso++){
            
            cant = 0;   
            for (plaza=0; plaza<10; plaza++)  
                
                if(estacionamiento[piso][plaza] != null)
                    cant ++;
                
            if (cant > CantMax){
                CantMax = cant;
                pisoMax = piso;
            }
            
        } 
        
       System.out.println("------------------------------");
       System.out.println("El piso maximo es " + pisoMax);

        
        
        // Informar cada auto que pasó
        System.out.println("------------------------------");
        System.out.println("Los autos ingresados fueron: ");
        for (piso=0; piso<5; piso++){
              
            for (plaza=0; plaza<10; plaza++)  
                
                if(estacionamiento[piso][plaza] != null)
                    System.out.println("Piso: "+ piso + " plaza: " + plaza + " --> "+estacionamiento[piso][plaza]);
                            
        } 
        
    }
    
}
