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
public class Referendum extends Urna{
    private int u;
    private int aFavor;
    private int enContra;
    
    
    public void iniciarUrna(int urna){
        super.setNumUrna(urna);
        aFavor = 0;
        enContra = 0;
    }

    public int getU() {
        return u;
    }

    public int getaFavor() {
        return aFavor;
    }

    public int getEnContra() {
        return enContra;
    }
    
    public void setVotoAFavor(){
        aFavor++;
    }
    
    public void setVotoEnContra(){
        enContra++;
    }
    
    @Override
    
    public int calcularGanador(){
        int aux;
        
        if (aFavor == enContra)
            aux=-1;
        else
            if (aFavor)
    }
    
    
    
    
    
    
}
