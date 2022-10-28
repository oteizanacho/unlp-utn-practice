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
public class NewMain {

    /**
     * @param args the command line arguments
     */
    


    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Proyecto p=new Proyecto("Proyecto1",1);
       
       Investigador i1=new Investigador ("Nombre","Apellido",2,"Investigador1");
       p.agregarInvestigador(i1);
       
       
        
       Investigador i2=new Investigador ("Nombre2","Apellido2",3,"Investigador2");
       p.agregarInvestigador(i2);
        
        
       Investigador i3=new Investigador ("Director","Apellido3",4,"Investigador3");
       p.setDirector(i3);
       
       
       
       Subsidio s1=new Subsidio(55.5,"motivo1");
       Subsidio s2=new Subsidio(65.5,"motivo2");
       Subsidio s3=new Subsidio(75.5,"motivo3");
       Subsidio s4=new Subsidio(85.5,"motivo4");
       
       
       i1.agregarSubsidio(s1);
       i1.agregarSubsidio(s2);
       i2.agregarSubsidio(s3);
       i2.agregarSubsidio(s4);
       
       
       p.otorgarTodos("Nombre","Apellido");
       
        System.out.println(p.toString());
      
    }

 
   
    
}
