/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Usuarios;
import java.util.List;

/**
 *
 * @author Markitos
 */
public interface IUsuariosDAO {
    
    public List<Usuarios> setUsuario(Usuarios usu);
    
    public List<Usuarios> getUsuarios(String usuario);
    
    public Usuarios getUsuario(String usuario, String passwd);
    
    public List<Usuarios> getAllUsuarios();
    
    public void updateUsuario(Usuarios usu);
    
    public void deleteUsuario(String usuario);
}
