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
public class Estacionamiento {  //ESTADO    
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int pisos;
    private int plazas;
    private Auto [][] matriz;
  

    //CONSTRUCTORES
public Estacionamiento (String nombre, String direccion){
    this.nombre = nombre;
    this.direccion = direccion;
    this.horaApertura = "08:00";
    this.horaCierre = "21:00";
    this.pisos = 5;
    this.plazas = 10;
    this.matriz = new Auto [pisos][plazas];
    this.inicializarMatriz();
}

public Estacionamiento (String nombre, String direccion, String horaApertura, String horaCierre, int pisos, int plazas){
    this.nombre = nombre;
    this.direccion = direccion;
    this.horaApertura = horaApertura;
    this.horaCierre = horaCierre;
    this.pisos = pisos;
    this.plazas = plazas;
    this.matriz = new Auto [pisos][plazas];
    this.inicializarMatriz();
}
/*
public String getDueñoAuto (){
    return auto.getDueño;
}
*/

private void inicializarMatriz(){
    int i,j;
    for (i=0; i<pisos; i++){
        for (j=0; j<plazas; j++){
            matriz[pisos][plazas]=null;
        }
    }
}

public void estacionar (Auto a, int X, int Y){
    matriz [X-1][Y-1] = a;
}

public String buscarPatentes (int p){
    int i=0, j=0;
    boolean encontre=false;
    
    while ((i<pisos)&&(!encontre)){
        j=0;
        while ((j<plazas)&&(!encontre)){
            if ((matriz[i][j]!=null)&&(matriz[i][j].getPatente() == p)){
                encontre=true;
            }else
                j++;
        }
        if (!encontre) i++;
    }
    String aux;
    if (encontre){
        aux= (i+1)+","+(j+1);
    }
    else
        aux="Auto inexistente";
    return aux;   
}

/*public Auto getAuto(){
    return auto;
}*/

public String getNombre(){
    return nombre;
}

public String getDireccion(){
    return direccion;
}

public String getHoraApertura(){
    return horaApertura;
}

public String getHoraCierre(){
    return horaCierre;
}

public int getPisos(){
    return pisos;
}

public int getPlazas(){
    return plazas;
}

/*public void setAuto(Auto auto){
    this.auto = auto;
}*/

public void setNombre(String nombre){
    this.nombre = nombre;
}
    
public void setDireccion(String direccion){
    this.direccion = direccion;
}
    
public void setHoraApertura (String horaApertura){
    this.horaApertura = horaApertura;
}
    
public void setHoraCierre (String horaCierre){
    this.horaCierre = horaCierre;
}   

public void setPisos (int pisos){
    this.pisos = pisos;
}
    
public void setPlazas (int plazas){
    this.plazas = plazas;
}

@Override

public String toString(){
    int i,j;
    String aux="";
    for (i=0; i<pisos; i++){
        for (j=0; j<plazas; j++){
            aux = aux + "Piso " + (i+1) + " Plaza " + (j+1);
            if (matriz[i][j] != null){
                aux = aux + " " + matriz[i][j].toString() + "\n";
            }
            else
                aux=aux+" libre \n ";         
        }
    }
    return aux;
}


}