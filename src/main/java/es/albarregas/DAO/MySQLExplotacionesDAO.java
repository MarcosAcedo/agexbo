/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import static es.albarregas.DAO.ConnectionFactory.getMySQLConnection;
import es.albarregas.beans.Explotaciones;
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
public class MySQLExplotacionesDAO implements IExplotacionesDAO {

    @Override
    public List<Explotaciones> setExplotacion(Explotaciones explo) {
        String sql = "INSERT INTO explotacion (REGA, nombre, provincia, municipio, usuario) VALUES (?, ?, ?, ?, ?)";
        
        ArrayList<Explotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, explo.getREGA());
            stm.setString(2, explo.getNombre());
            stm.setString(3, explo.getProvincia());
            stm.setString(4, explo.getMunicipio());
            stm.setString(5, explo.getUsuario());
             
            lista.add(explo); 
            
            stm.executeUpdate();
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista; 
    }

    @Override
    public List<Explotaciones> getExplotacion(String REGA) {
        String sql = "SELECT * FROM explotacion WHERE REGA LIKE ?";
        Explotaciones explo;
        ArrayList<Explotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                explo = new Explotaciones();
                
                explo.setREGA(REGA);
                explo.setNombre(resultado.getString("nombre"));
                explo.setProvincia(resultado.getString("provincia"));
                explo.setMunicipio(resultado.getString("municipio"));
                explo.setUsuario(resultado.getString("usuario"));
                
                lista.add(explo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public List<Explotaciones> getExplotacionUsu(String usuario) {
        String sql = "SELECT * FROM explotacion WHERE usuario LIKE ?";
        Explotaciones explo;
        ArrayList<Explotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, usuario);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                explo = new Explotaciones();
                
                explo.setREGA(resultado.getString("REGA"));
                explo.setNombre(resultado.getString("nombre"));
                explo.setProvincia(resultado.getString("provincia"));
                explo.setMunicipio(resultado.getString("municipio"));
                explo.setUsuario(usuario);
                
                lista.add(explo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }

    @Override
    public List<Explotaciones> getAllExplotaciones() {
        String sql = "SELECT * FROM explotacion";
        Explotaciones explo;
        ArrayList<Explotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                explo = new Explotaciones();
                
                explo.setREGA(resultado.getString("REGA"));
                explo.setNombre(resultado.getString("nombre"));
                explo.setProvincia(resultado.getString("provincia"));
                explo.setMunicipio(resultado.getString("municipio"));
                explo.setUsuario(resultado.getString("usuario"));
                
                lista.add(explo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public List<Explotaciones> getAllExplotacionesValidadas() {
        String sql = "SELECT e.*, u.validado FROM explotacion e, usuarios u where u.usuario = e.usuario && u.datos = 'Si';";
        Explotaciones explo;
        ArrayList<Explotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                explo = new Explotaciones();
                
                explo.setREGA(resultado.getString("REGA"));
                explo.setNombre(resultado.getString("nombre"));
                explo.setProvincia(resultado.getString("provincia"));
                explo.setMunicipio(resultado.getString("municipio"));
                explo.setUsuario(resultado.getString("usuario"));
                
                lista.add(explo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public void updateExplotacion(Explotaciones explo) {
         String sql = "UPDATE explotacion SET nombre = ?, provincia = ?, municipio = ?, usuario = ? WHERE REGA = ?";

        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(5, explo.getREGA());
            stm.setString(1, explo.getNombre());
            stm.setString(2, explo.getProvincia());
            stm.setString(3, explo.getMunicipio());
            stm.setString(4, explo.getUsuario());
            
            stm.executeUpdate();  
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
    }

    @Override
    public void deleteExplotacion(String REGA) {
        String sql = "DELETE FROM explotacion WHERE REGA = ?";
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            
            stm.executeUpdate(); 
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }  finally {
            ConnectionFactory.closeConnnection();
        }
    }
    
}
