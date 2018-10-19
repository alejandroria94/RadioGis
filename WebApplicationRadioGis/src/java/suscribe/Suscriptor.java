/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package suscribe;

/**
 *
 * @author Fido
 */
public class Suscriptor {

    private String mensajeRgb = "No data";
    private String mensajeHumedad = "No data";
    private String mensajePotenciometro = "No data";
    private String mensajeGas = "No data";
    private boolean conectado;

    public String getMensajeRgb() {
        return mensajeRgb;
    }

    public void setMensajeRgb(String mensajeRgb) {
        this.mensajeRgb = mensajeRgb;
    }

    public void setMensajeHumedad(String mensajeHumedad) {
        this.mensajeHumedad = mensajeHumedad;
    }

    public void setMensajePotenciometro(String mensajePotenciometro) {
        this.mensajePotenciometro = mensajePotenciometro;
    }

    public String getMensajeHumedad() {
        return mensajeHumedad;
    }

    public String getMensajePotenciometro() {
        return mensajePotenciometro;
    }

    public String getMensajeGas() {
        return mensajeGas;
    }

    public void setMensajeGas(String mensajeGas) {
        this.mensajeGas = mensajeGas;
    }

    public boolean isConectado() {
        return conectado;
    }

    public void setConectado(boolean conectado) {
        this.conectado = conectado;
    }

}
