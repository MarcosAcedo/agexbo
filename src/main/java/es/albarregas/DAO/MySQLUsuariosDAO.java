/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import static es.albarregas.DAO.ConnectionFactory.getMySQLConnection;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.beans.Usuarios;
import es.albarregas.logger.MyLogger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Markitos
 */
public class MySQLUsuariosDAO implements IUsuariosDAO{

    @Override
    public List<Usuarios> setUsuario(Usuarios usu) {
       String sql = "INSERT INTO usuarios (usuario, passwd, dni, nombre, email, tlfno, rol, validado, datos) VALUES (?, MD5(?), ?, ?, ?, ?, ?, ?, ?)";
       
        ArrayList<Usuarios> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, usu.getUsuarios());
            stm.setString(2, usu.getPasswd());
            stm.setString(3, usu.getNombre());
            stm.setString(4, usu.getDNI());
            stm.setString(5, usu.getEmail());
            stm.setString(6, usu.getTlfno());
            stm.setString(7, usu.getRol());
            stm.setString(8, usu.getValidado());
            stm.setString(9, usu.getDatos());
             
            lista.add(usu); 
            
            stm.executeUpdate();
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLUsuariosDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista; 
    }

    @Override
    public Usuarios getUsuario(String usuario, String passwd) {
        String sql = "SELECT * FROM usuarios WHERE usuario LIKE ? AND passwd LIKE ?";
        Usuarios usu = null;
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, usuario);
            stm.setString(2, passwd);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                usu = new Usuarios();
                
                usu.setUsuarios(resultado.getString("usuario"));
                usu.setPasswd(resultado.getString("passwd"));
                usu.setDNI(resultado.getString("DNI"));
                usu.setNombre(resultado.getString("nombre"));
                usu.setEmail(resultado.getString("email"));
                usu.setTlfno(resultado.getString("tlfno"));
                usu.setRol(resultado.getString("rol"));
                usu.setValidado(resultado.getString("validado"));
                usu.setDatos(resultado.getString("datos"));
                
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLUsuariosDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return usu;
    }
    
    @Override
    public List<Usuarios> getUsuarios(String usuario) {
        String sql = "SELECT * FROM usuarios";
        Usuarios usu;
        ArrayList<Usuarios> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, usuario);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                usu = new Usuarios();
                
                usu.setUsuarios(usuario);
                usu.setPasswd(resultado.getString("passwd"));
                usu.setDNI(resultado.getString("DNI"));
                usu.setNombre(resultado.getString("nombre"));
                usu.setEmail(resultado.getString("email"));
                usu.setTlfno(resultado.getString("tlfno"));
                usu.setRol(resultado.getString("rol"));
                usu.setValidado(resultado.getString("validado"));
                usu.setDatos(resultado.getString("datos"));
                
                lista.add(usu);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLUsuariosDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public List<Usuarios> getAllUsuarios() {
        String sql = "SELECT * FROM usuarios";
        Usuarios usu;
        ArrayList<Usuarios> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                usu = new Usuarios();
                
                usu.setUsuarios(resultado.getString("usuario"));
                usu.setPasswd(resultado.getString("passwd"));
                usu.setDNI(resultado.getString("DNI"));
                usu.setNombre(resultado.getString("nombre"));
                usu.setEmail(resultado.getString("email"));
                usu.setTlfno(resultado.getString("tlfno"));
                usu.setRol(resultado.getString("rol"));
                usu.setValidado(resultado.getString("validado"));
                usu.setDatos(resultado.getString("datos"));
                
                lista.add(usu);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLUsuariosDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }

    @Override
    public void updateUsuario(Usuarios usu) {
        String sql = "UPDATE usuarios SET passwd = ?, nombre = ?, dni = ?, email = ?, tlfno = ?, rol = ?, validado = ?, datos = ? WHERE usuario = ?";

        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(9, usu.getUsuarios());
            stm.setString(1, usu.getPasswd());
            stm.setString(2, usu.getNombre());
            stm.setString(3, usu.getDNI());
            stm.setString(4, usu.getEmail());
            stm.setString(5, usu.getTlfno());
            stm.setString(6, usu.getRol());
            stm.setString(7, usu.getValidado());
            stm.setString(8, usu.getDatos());
            
            stm.executeUpdate();  
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLUsuariosDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
    }

    @Override
    public void deleteUsuario(String usuario) {
        String sql = "DELETE FROM usuarios WHERE usuario = ?";
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, usuario);
            
            stm.executeUpdate(); 
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLUsuariosDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }  finally {
            ConnectionFactory.closeConnnection();
        }
    }

    
}
