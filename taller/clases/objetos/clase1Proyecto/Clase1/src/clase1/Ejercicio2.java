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
public class Ejercicio2 {
    
     /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        boolean [][] estacionamiento = new boolean[5][10];

        //inicializa Estacionamiento
        for (int i=0;i<5;i++)
            for (int j=0;j<10;j++)  
                estacionamiento[i][j] = false;
        
        GeneradorAleatorio.iniciar();            //inicia el generador aleatorio
        
        int p = GeneradorAleatorio.generarInt(100);
        int piso, plaza;
        
        while(p != 0){
            
            System.out.println("Patente -->" + p);            
            if((p % 2) == 0 ){
                System.out.println("Pasa");
                
                piso = GeneradorAleatorio.generarInt(4);    
                System.out.println("Píso: " + piso);
                
                plaza = GeneradorAleatorio.generarInt(10);
                System.out.println("Plaza: " + plaza);
                    if (!estacionamiento[piso][plaza]){
                         estacionamiento[piso][plaza] = true;
                     }
                     else{System.out.println("Espacio ocupado");
                     }
                
          
                
            }else
                System.out.println("No pasa");
            p = GeneradorAleatorio.generarInt(100);
            
        }
        
        
        //piso Mas Ocupado
        int pisoMax = 0, cant, CantMax = -1; 
            
        for (piso=0; piso<5; piso++){
            
            cant = 0;   
            for (plaza=0; plaza<10; plaza++)
                
                if(estacionamiento[piso][plaza])
                    cant ++;
                
            if (cant > CantMax){
                CantMax = cant;
                pisoMax = piso;
            }
            
        } 
        System.out.println("El piso maximo es " + pisoMax);

    }
    
}
