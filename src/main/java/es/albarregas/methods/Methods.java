/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.methods;

import es.albarregas.DAO.IExplotacionesDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.DaoFactory.DAOFactory;
import es.albarregas.beans.Explotaciones;
import es.albarregas.beans.Usuarios;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Markitos
 */
public class Methods {
    
    public Usuarios guarda(String usuario, String passwd){
        DAOFactory daof = DAOFactory.getDAOFactory();
            IUsuariosDAO usuDAO = daof.getUsuariosDAO();
            
        Usuarios usu = new Usuarios();
        usu = usuDAO.getUsuario(usuario, passwd);
        
        return usu;
    }
    
    public List<Explotaciones> listaExplo(String rol, String usuario){
        DAOFactory daof = DAOFactory.getDAOFactory();
            IExplotacionesDAO exploDAO = daof.getExplotacionesDAO();
        
        Explotaciones explo = new Explotaciones();
        List<Explotaciones> listaE = new ArrayList();
        
        if(rol.equals("Admin")){
            listaE = exploDAO.getAllExplotaciones();
        } else if(rol.equals("Cliente")) {
            listaE = exploDAO.getExplotacionUsu(usuario);
        }
        return listaE;
    }
    
    public String cifrarMD5(String input) throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] messageDigest = md.digest(input.getBytes());
        BigInteger number = new BigInteger(1, messageDigest);
        String hashtext = number.toString(16);

        while (hashtext.length() < 32) {
            hashtext = "0" + hashtext;
        }
        return hashtext;
    }  
}