/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial;

/**
 *
 * @author oteiz
 */
public class Libro {
    private String titulo;
    private String nombre;
    private double peso;
    
    public Libro(){
        
    }

    
    public Libro (String titulo, String nombre, double peso){
        this.titulo= titulo;
        this.nombre= nombre;
        this.peso=peso;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPeso() {
        return peso;
    }

    @Override
    public String toString() {
        String aux;
            aux = "Titulo: " + this.titulo + " Nombre del autor: " + this.nombre + " Peso: " + this.peso + ".";
        return aux;
    }
    
    
    
    
    
    
    
}
