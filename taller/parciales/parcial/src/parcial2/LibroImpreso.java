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
public class LibroImpreso extends libro{
    private boolean tapaDura;

    public boolean isTapaDura() {
        return tapaDura;
    }

    public void setTapaDura(boolean tapaDura) {
        this.tapaDura = tapaDura;
    }
    
    
    public LibroImpreso(String titulo, double precio, boolean tapa){
        super(titulo,precio);
        this.tapaDura = tapa;
    }
    
    
    @Override
    public double calcularPrecio(){
        double total = this.getPrecio();
        if (this.isTapaDura()){
            total = total + 500;
        }
        return total;      
    }

    @Override
    public String toString() {
        String aux;
        aux = super.toString() + " Precio: " + this.calcularPrecio() + "\n";
        return aux;
    }
    
    
    
    
}
