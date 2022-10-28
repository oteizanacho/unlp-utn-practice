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
public class Estanteria {
    private Libro [][] estantes;
    private int fila;
    private int columna;
    
    public Estanteria (int fila, int columna){
        this.fila = fila;
        this.columna = columna;
        estantes = new Libro [fila][columna];
        this.inicializarEstanterias();
    }
          
    private void inicializarEstanterias(){
        int i,j;
        for (i=0; i<fila; i++){
            for (j=0; j<columna; j++){
                estantes [i][j] = null;
            }
        }
    }

    public void almacenarLibro (Libro libro, int fila, int columna){
        estantes [fila][columna] = libro;
    }
    
    public String sacarLibro (String titulo){
        String aux = "No existe";
        for (int i=0; i<this.fila; i++){
            for (int j=0; j<this.columna; j++){
                if ((estantes[i][j])!=null){
                    if ((estantes[i][j].getTitulo()).equals(titulo)){
                        aux =estantes[i][j].toString();
                        System.out.println("busqueda");
                        estantes[i][j]=null;
                    }
                }
            }
        }
        return aux;
    }
    
    public Libro sacarLibro2(int fila, int columna){
        Libro aux = new Libro();
        if (estantes[fila][columna]!=null){
            aux = estantes[fila][columna];
            estantes[fila][columna]=null;
        }
        return aux;
    }
    
    
    public String calcular(){
        String aux = "No esta";
        double min=0;
        for (int i=0; i<this.fila; i++){
            for (int j=0; j<this.columna; j++){
                if (estantes[i][j]!=null){
                    if (estantes[i][j].getPeso() > min)
                        aux = estantes[i][j].toString();
                        System.out.println("modulo peso");
                        min = estantes[i][j].getPeso();
                }
            }
        }
        return aux;
    }
    
    
    
    
    
}
