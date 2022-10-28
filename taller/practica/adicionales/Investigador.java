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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author julia
 */
public class Investigador {
    private String nombre;
    private String apellido;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;
    private int dl;
    
    public Investigador (String nombre, String apellido, int categoria, String especialidad){
        this.nombre = nombre;
        this.apellido= apellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.dl = 0;
        this.subsidios = new Subsidio [5];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public int getDl() {
        return dl;
    }

    public void setDl(int dl) {
        this.dl = dl;
    }
    
    public void agregarSubsidio (Subsidio subsidio){
        if (this.dl < 5){
            this.subsidios [dl] = subsidio;
            this.dl++;           
        }
    }
      public double dineroTotalOtorgado(){
           double total = 0;
        for(int i=0; i<this.dl; i++){
          if(this.subsidios[i].isOtorgado())
            total = total + this.subsidios[i].getMonto();
        }
        return total;
      }
    public int cantidadSubsidios(){
        return dl;
    }
    public void otorgarTodos(){
      for(int i=0; i<this.dl; i++){
        this.subsidios[i].setOtorgado(true);
      }
        
    }
    
 
}