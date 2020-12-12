/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import static es.albarregas.DAO.ConnectionFactory.getMySQLConnection;
import es.albarregas.beans.DestinosExplotaciones;
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
public class MySQLDestinoExplotacionesDAO implements IDestinoExplotacionesDAO{

    @Override
    public List<DestinosExplotaciones> setDestinosExplotacion(DestinosExplotaciones destiExplo) {
        String sql = "INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES (?, ?)";
        
        ArrayList<DestinosExplotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, destiExplo.getDIB());
            stm.setString(2, destiExplo.getDestinoExplo());
            
            lista.add(destiExplo); 
            
            stm.executeUpdate();
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista; 
    }

    @Override
    public DestinosExplotaciones getDestinoExplotacion(String DIB) {
        String sql = "SELECT * FROM destinoExplotacion WHERE DIB LIKE ?";
        DestinosExplotaciones destiExplo = null;
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, DIB);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                destiExplo = new DestinosExplotaciones();
                
                destiExplo.setDIB(DIB);
                destiExplo.setDestinoExplo(resultado.getString("destinoExplo"));
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return destiExplo;
    }
    
    @Override
    public List<DestinosExplotaciones> getDestinosExplotacion(String REGA) {
        String sql = "SELECT * FROM destinoExplotacion, explotacion WHERE REGA LIKE ?";
        DestinosExplotaciones destiExplo = null;
        ArrayList<DestinosExplotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                destiExplo = new DestinosExplotaciones();
                
                destiExplo.setDIB(resultado.getString("DIB"));
                destiExplo.setDestinoExplo(resultado.getString("destinoExplo"));
                
                lista.add(destiExplo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public List<DestinosExplotaciones> getDestinosCebaderos(String REGA) {
        String sql = "SELECT * FROM destinoExplotacion, explotacion WHERE REGA LIKE ? AND destinoExplo LIKE 'Cebadero'";
        DestinosExplotaciones destiExplo;
        ArrayList<DestinosExplotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                destiExplo = new DestinosExplotaciones();
                
                destiExplo.setDIB(resultado.getString("DIB"));
                destiExplo.setDestinoExplo(resultado.getString("destinoExplo"));
                
                lista.add(destiExplo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public List<DestinosExplotaciones> getDestinosReposiciones(String REGA) {
        String sql = "SELECT * FROM destinoExplotacion, explotacion WHERE REGA LIKE ? AND destinoExplo LIKE 'Reposicion'";
        DestinosExplotaciones destiExplo;
        ArrayList<DestinosExplotaciones> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                destiExplo = new DestinosExplotaciones();
                
                destiExplo.setDIB(resultado.getString("DIB"));
                destiExplo.setDestinoExplo(resultado.getString("destinoExplo"));
                
                lista.add(destiExplo);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }

    @Override
    public void updateDestinosExplotacio(DestinosExplotaciones destiExplo) {
         String sql = "UPDATE destinoExplotacion SET destinoExplo = ? WHERE DIB = ?";

        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(2, destiExplo.getDIB());
            stm.setString(1, destiExplo.getDestinoExplo());
            
            stm.executeUpdate();  
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
    }

    @Override
    public void deleteDestinosExplotacio(String DIB) {
        String sql = "DELETE FROM destinoExplotacion WHERE DIB = ?";
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, DIB);
            
            stm.executeUpdate(); 
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLDestinoExplotacionesDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }  finally {
            ConnectionFactory.closeConnnection();
        }
    }
    
}
