/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase1;

import PaqueteLectura.GeneradorAleatorio;       // Importar funcionalidad Generador Aleatorio


/**
 *
 * @author veroartola
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();            //inicia el generador aleatorio
        
        int p = GeneradorAleatorio.generarInt(10);
        
        while(p != 0){
            
            System.out.println("Patente: " + p);
            
            if((p % 2) == 0 )
                System.out.println("Pasa");
            else
                System.out.println("No pasa");
            
            p = GeneradorAleatorio.generarInt(10);

        } 
        
    }
    
    
    
    
}
