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
public class Explotaciones {
    private String REGA, nombre, provincia, municipio, usuario;

    public Explotaciones(String REGA, String nombre, String provincia, String municipio, String usuario) {
        this.REGA = REGA;
        this.nombre = nombre;
        this.provincia = provincia;
        this.municipio = municipio;
        this.usuario = usuario;
    }

    public Explotaciones() {    }

    public String getREGA() {
        return REGA;
    }

    public void setREGA(String REGA) {
        this.REGA = REGA;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    
}
