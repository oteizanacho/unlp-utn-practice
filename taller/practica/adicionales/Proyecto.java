/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdicionalUnlp;

/**
 *
 * @author Dante
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private Investigador director;
    private Investigador [] participantes;
    private int dl;
    
    public Proyecto (String nombre, int codigo){
        this.nombre = nombre;
        this.codigo = codigo;
        this.dl=0;
        this.participantes = new Investigador [50];
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public Investigador getDirector() {
        return director;
    }

    public void setDirector(Investigador director) {
        this.director = director;
    }

    public Investigador[] getParticipantes() {
        return participantes;
    }

    public void setParticipantes(Investigador[] participantes) {
        this.participantes = participantes;
    }

    public int getDl() {
        return dl;
    }

    public void setDl(int dl) {
        this.dl = dl;
    }
    
    public void agregarInvestigador (Investigador  investigador){
        
       if(dl < 50){
           this.participantes [dl] = investigador;
           dl++;
       }
    }
    public double dineroTotalOtorgado(){
        double total = 0;
        for(int i=0; i<this.dl; i++){
            total = total + this.participantes[i].dineroTotalOtorgado();
        }
        return total;
    }
    
    public int cantidadDeSubsidios(String nombre, String apellido){
        int i=0;
        while ((i < this.dl)&&((!this.participantes[i].getNombre().equals(nombre))||(!this.participantes[i].getApellido().equals(apellido)))){
            i++;
    }
        if(i == dl)
            return 0;
        else 
            return this.participantes[i].cantidadSubsidios();
    }
    
    public void otorgarTodos (String nombre, String apellido){
        int i=0;
        while ((i < this.dl)&&((!this.participantes[i].getNombre().equals(nombre))||(!this.participantes[i].getApellido().equals(apellido)))){
            i++;
        }
        if (i<dl){
            this.participantes[i].otorgarTodos();
        }
    }
    
    public void String (){
        
        
    }
    
    
    @Override
    public String toString() {
        int i;
       String aux = "nombre" + this.getNombre() + "codigo" + this.getCodigo()+ "dinero otrogado" + this.dineroTotalOtorgado();
               for (i=0;i<dl;i++){
                   aux= aux + "nombre de los investigadores" + participantes[i].getNombre() + "apellido de los investigadores" + participantes[i].getApellido()
                           + "categoria" + participantes[i].getCategoria() + "dinero otorgado" + participantes[i].dineroTotalOtorgado();
                   
               }
     return aux;          
    }
    
}