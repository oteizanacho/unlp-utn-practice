/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

import PaqueteLectura.Lector;

/**
 *
 * @author oteiz
 */
public class MainParcial2 {
    
    public static void main (String[] args){
        String titulo;
        String nombre;
        double precio;
        String formato;
        double tamanio;
        String tapa;
        boolean ok = false;
        
       /* System.out.println("Ingrese titulo del libro");
        titulo = Lector.leerString();
        System.out.println("Ingrese precio");
        precio = Lector.leerDouble();
        System.out.println("Ingrese formato");
        formato = Lector.leerString();
        System.out.println("Ingrese tamanio");
        tamanio = Lector.leerDouble();*/
        LibroElectronico libro = new LibroElectronico("dragonball",300,"pdf",200);
        
       /* System.out.println("Ingrese titulo del libro");
        titulo = Lector.leerString();
        System.out.println("Ingrese precio");
        precio = Lector.leerDouble();
        System.out.println("Es de tapa dura?");
        tapa = Lector.leerString();
        if (tapa.equals("si")){
            ok = true;
        }*/
        LibroImpreso libro2 = new LibroImpreso("bleach",100,true);
        
        for (int i=0; i<3; i++){
            System.out.println("Ingrese nombre para libro electronico");
            nombre = Lector.leerString();
            libro.agregarAutor(nombre);
            libro.mostrarAutor();
        }
        for (int i=0; i<3; i++){
            System.out.println("Ingrese nombre para libro impreso");
            nombre = Lector.leerString();
            libro2.agregarAutor(nombre);
            libro2.mostrarAutor();
        }
        
        System.out.println(libro.toString());
        System.out.println(libro2.toString());
        
    }
}
