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
public class Bovinos {
    private String DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, Ternero, exploNaci;

    public Bovinos(String DIB, String REGA, String paisOrigen, String raza, String sexo, String DIBMadre, String Ternero, String nacimiento, String fechaAlta, String exploNaci) {
        this.DIB = DIB;
        this.REGA = REGA;
        this.paisOrigen = paisOrigen;
        this.raza = raza;
        this.sexo = sexo;
        this.DIBMadre = DIBMadre;
        this.Ternero = Ternero;
        this.nacimiento = nacimiento;
        this.fechaAlta = fechaAlta;
        this.exploNaci = exploNaci;
    }

    public Bovinos() {    }
    
    public String getDIB() {
        return DIB;
    }

    public void setDIB(String DIB) {
        this.DIB = DIB;
    }

    public String getREGA() {
        return REGA;
    }

    public void setREGA(String REGA) {
        this.REGA = REGA;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDIBMadre() {
        return DIBMadre;
    }

    public void setDIBMadre(String DIBMadre) {
        this.DIBMadre = DIBMadre;
    }

    public String getTernero() {
        return Ternero;
    }

    public void setTernero(String Ternero) {
        this.Ternero = Ternero;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(String fechaAlta) {
        this.fechaAlta = fechaAlta;
    }
    
    public String getExploNaci() {
        return exploNaci;
    }

    public void setExploNaci(String exploNaci) {
        this.exploNaci = exploNaci;
    }
}
