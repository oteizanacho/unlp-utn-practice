/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author oteiz
 */
public abstract class libro {
    private String titulo;
    private String [] nombres;
    private double precio;
    private int dimL = 0;
    
    
    public libro (String titulo, double precio){
        this.titulo = titulo;
        this.precio = precio;
        this.nombres = new String [8];
        this.inicializarNombres();
    }
    
    private void inicializarNombres (){
        for (int i=0; i<8; i++){
            this.nombres[i] = "";
        }
    }

    public String getTitulo() {
        return titulo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public void agregarAutor(String nombre){
        boolean pude = false;
        while ((dimL<8)&&(!pude)){
            if (nombres[dimL]!= null){
                nombres[dimL]=nombre;
                System.out.println("Autor " + nombres[dimL]  + " agregado");
                dimL++;
                pude=true;
            }
        }
    } 
    
    public String mostrarAutor(){
        String aux="";
            for(int i=0; i<8; i++){
                if (this.nombres[i]!=""){
                    aux = aux + "Nombres: " + this.nombres[i] + "\n";
                }
            }
        return aux;
    }
    

    public abstract double calcularPrecio();

    @Override
    public String toString() {
        String aux;
        aux = "Titulo: " + this.getTitulo() + "\n" + this.mostrarAutor();
        return aux;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
