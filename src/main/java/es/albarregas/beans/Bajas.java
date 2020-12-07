/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

import java.util.Calendar;

/**
 *
 * @author Markitos
 */
public class Bajas {
    private String DIB, fechaBaja, causa, destino;

    public Bajas(String DIB, String fechaBaja, String causa, String destino) {
        this.DIB = DIB;
        this.causa = causa;
        this.destino = destino;
        this.fechaBaja = fechaBaja;
    }

    public Bajas() {    }

    public String getDIB() {
        return DIB;
    }

    public void setDIB(String DIB) {
        this.DIB = DIB;
    }

    public String getCausa() {
        return causa;
    }

    public void setCausa(String causa) {
        this.causa = causa;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getFechaBaja() {
        return fechaBaja;
    }

    public void setFechaBaja(String fechaBaja) {
        this.fechaBaja = fechaBaja;
    }
}
