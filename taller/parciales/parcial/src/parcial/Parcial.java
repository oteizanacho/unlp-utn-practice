/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;


/**
 *
 * @author oteiz
 */
public class Parcial {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String titulo;
        String nombre;
        double peso;
        int fila;
        int columna;
        
        
        Estanteria estante = new Estanteria (5,3);
        
        for (int i=0; i<2; i++){
            System.out.println("Ingrese titulo del libro");
            titulo = Lector.leerString();
            System.out.println("Ingrese nombre del autor");
            nombre = Lector.leerString();
            System.out.println("Ingrese peso del libro");
            peso = Lector.leerDouble();
            Libro libro = new Libro(titulo,nombre,peso);
            fila = GeneradorAleatorio.generarInt(4);
            System.out.println("Fila: " + fila);
            columna =GeneradorAleatorio.generarInt(2);
            System.out.println("Columna: " + columna);
            estante.almacenarLibro(libro, fila, columna);
        }
        
        System.out.println("Ingrese titulo del libro a sacar");
        titulo = Lector.leerString();
        String libroSacado;
        libroSacado = estante.sacarLibro(titulo);
        System.out.println(libroSacado);
        
        String libroMax;
        libroMax = estante.calcular();
        System.out.println(libroMax);
        
        
        System.out.println("Ingrese fila");
        fila = Lector.leerInt();
        System.out.println("Ingrese columna");
        columna = Lector.leerInt();
        Libro libro3 = new Libro();
        libro3 = estante.sacarLibro2(fila, columna);
        System.out.println(libro3.toString());
        
    }
    
}
