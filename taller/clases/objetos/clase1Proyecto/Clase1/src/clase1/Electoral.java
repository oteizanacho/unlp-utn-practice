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
public class Electoral extends Urna {
    private int [] listas;
    private int l;
    private int u;

    public Electoral(int numero) {
        super(numero);
    }
    
    public void iniciarUrna(int u, int l){
        super.setNumUrna(u);
        this.listas = new int [l];
        this.inicializarListas();
    }
    
    private void inicializarListas(){
        int i;
        for (i=0 ; i<l ; i++){
            listas[i]=0;
        } 
    }

    public int getListas() {
        return l;
    }

    public int getU() {
        return u;
    }

    public void setVoto(int i){
        this.listas[i]+=1;
    }
    
    @Override
    
    public  int calcularGanador(){
        return 0;
        
    }
    
    @Override
    public  int calcularTotalVotos(){
        return 0;
        
    }
    
    
    
    
    
    
}
