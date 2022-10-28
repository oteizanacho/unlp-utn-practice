/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase1;

/**
 *
 * @author oteiz
 */
public abstract class Urna {
    private int nroUrna;
    private int blancos;
    
    public Urna (int numero){
        nroUrna=numero;
        blancos=0;
    }
    
    
    
    public void setNumUrna(int nroUrna){
        this.nroUrna = nroUrna;
    }

    public int getNumUrna(){
        return nroUrna;
    }

    public int getBlancos(){
        return blancos;
    }

    public void votarEnBlanco(){
        blancos++;
    }

    public abstract int calcularGanador();
    public abstract int calcularTotalVotos();




}
