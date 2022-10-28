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
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio (double monto, String motivo){
        this.monto=monto;
        this.motivo=motivo;
        this.otorgado = false;
    }

    /**
     * @return the monto
     */
    public double getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(double monto) {
        this.monto = monto;
    }

    /**
     * @return the motivo
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * @param motivo the motivo to set
     */
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    /**
     * @return the otorgado
     */
    public boolean isOtorgado() {
        return otorgado;
    }

    /**
     * @param otorgado the otorgado to set
     */
    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
}
