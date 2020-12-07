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
public class Usuarios {
    private String DNI, nombre, usuarios, passwd, rol, email, tlfno, validado, datos;


    public Usuarios(String usuarios, String passwd, String nombre, String DNI, String email, String tlfno, String validado, String rol, String datos) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.usuarios = usuarios;
        this.passwd = passwd;
        this.email = email;
        this.tlfno = tlfno;
        this.rol = rol;
        this.validado = validado;
        this.datos = datos;
    }

    public Usuarios(String usuarios, String passwd, String rol, String validado) {
        this.usuarios = usuarios;
        this.passwd = passwd;
        this.rol = rol;
        this.validado = validado;
    }

    
    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTlfno() {
        return tlfno;
    }

    public void setTlfno(String tlfno) {
        this.tlfno = tlfno;
    }

    public String getValidado() {
        return validado;
    }

    public void setValidado(String validado) {
        this.validado = validado;
    }

    public Usuarios() {    }
    
    /**
     * @return the DNI
     */
    public String getDNI() {
        return DNI;
    }

    /**
     * @param DNI the DNI to set
     */
    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the usuarios
     */
    public String getUsuarios() {
        return usuarios;
    }

    /**
     * @param usuarios the usuarios to set
     */
    public void setUsuarios(String usuarios) {
        this.usuarios = usuarios;
    }

    /**
     * @return the passwd
     */
    public String getPasswd() {
        return passwd;
    }

    /**
     * @param passwd the passwd to set
     */
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    
    public String getRol() {
        return rol;
    }
    
    public void setRol(String rol) {
        this.rol = rol;
    }

    
}
