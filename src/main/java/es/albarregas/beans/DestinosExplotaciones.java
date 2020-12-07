/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.beans;

/**
 *
 * @author Markitos
 */
public class DestinosExplotaciones {
    private String DIB, DestinoExplo;

    public DestinosExplotaciones(String DIB, String DestinoExplo) {
        this.DIB = DIB;
        this.DestinoExplo = DestinoExplo;
    }

    public DestinosExplotaciones() {    }

    public String getDIB() {
        return DIB;
    }

    public void setDIB(String DIB) {
        this.DIB = DIB;
    }

    public String getDestinoExplo() {
        return DestinoExplo;
    }

    public void setDestinoExplo(String DestinoExplo) {
        this.DestinoExplo = DestinoExplo;
    }
    
    
}
