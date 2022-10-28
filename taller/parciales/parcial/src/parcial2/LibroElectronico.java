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
public class LibroElectronico extends libro{
    private String formato;
    private double tamanio;

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public void setTamanio(double tamanio) {
        this.tamanio = tamanio;
    }

    public String getFormato() {
        return formato;
    }

    public double getTamanio() {
        return tamanio;
    }
    
    public LibroElectronico (String titulo, double precio, String formato, double tamanio){
        super(titulo,precio);
        this.formato = formato;
        this.tamanio = tamanio;
    }
    
    @Override
    public double calcularPrecio (){
        double total = this.getPrecio();
        double adicional = 0;
        adicional = 2.5 * this.getTamanio();
        total = total + adicional;
        return total;
    }

    @Override
    public String toString() {
        String aux;
        aux = super.toString() + " Precio: " + this.calcularPrecio() + "\n";
        return aux;
    }
    
    
    
    
    
    
}
