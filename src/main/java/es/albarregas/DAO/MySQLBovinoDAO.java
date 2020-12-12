/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import static es.albarregas.DAO.ConnectionFactory.getMySQLConnection;
import es.albarregas.beans.Bovinos;
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
public class MySQLBovinoDAO implements IBovinoDAO {

    @Override
    public List<Bovinos> setBovinos(Bovinos bovino) {
        String sql = "INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        ArrayList<Bovinos> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, bovino.getDIB());
            stm.setString(2, bovino.getREGA());
            stm.setString(3, bovino.getNacimiento());
            stm.setString(4, bovino.getPaisOrigen());
            stm.setString(5, bovino.getRaza());
            stm.setString(6, bovino.getSexo());
            stm.setString(7, bovino.getDIBMadre());
            stm.setString(8, bovino.getFechaAlta());
            stm.setString(9, bovino.getTernero());
            stm.setString(10, bovino.getExploNaci());
            
            lista.add(bovino); 
            
            stm.executeUpdate();
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBovinoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista; 
    }

    @Override
    public Bovinos getBovino(String DIB) {
        String sql = "SELECT * FROM bovino WHERE DIB LIKE ?";
        Bovinos bovino = null;
        ArrayList<Bovinos> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, DIB);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                bovino = new Bovinos();
                
                bovino.setDIB(DIB);
                bovino.setREGA(resultado.getString("REGA"));
                bovino.setNacimiento(resultado.getString("nacimiento"));
                bovino.setPaisOrigen(resultado.getString("paisOrigen"));
                bovino.setRaza(resultado.getString("raza"));
                bovino.setSexo(resultado.getString("sexo"));
                bovino.setDIBMadre(resultado.getString("DIBMadre"));
                bovino.setFechaAlta(resultado.getString("fechaAlta"));
                bovino.setTernero(resultado.getString("ternero"));
                bovino.setExploNaci(resultado.getString("exploNaci"));
                
                lista.add(bovino);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBovinoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return bovino;
    }
    
    @Override
    public List<Bovinos> getBovinos(String REGA) {
        String sql = "SELECT * FROM bovino WHERE REGA LIKE ? ORDER BY nacimiento DESC";
        Bovinos bovino = null;
        ArrayList<Bovinos> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                bovino = new Bovinos();
                
                bovino.setDIB(resultado.getString("DIB"));
                bovino.setREGA(REGA);
                bovino.setNacimiento(resultado.getString("nacimiento"));
                bovino.setPaisOrigen(resultado.getString("paisOrigen"));
                bovino.setRaza(resultado.getString("raza"));
                bovino.setSexo(resultado.getString("sexo"));
                bovino.setDIBMadre(resultado.getString("DIBMadre"));
                bovino.setFechaAlta(resultado.getString("fechaAlta"));
                bovino.setTernero(resultado.getString("ternero"));
                bovino.setExploNaci(resultado.getString("exploNaci"));
                
                lista.add(bovino);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBovinoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }

    @Override
    public List<Bovinos> getBovinosT(String REGA) {
        String sql = "SELECT * FROM bovino WHERE REGA LIKE ? AND ternero LIKE 'Si' ORDER BY nacimiento DESC";
        Bovinos bovino = null;
        ArrayList<Bovinos> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                bovino = new Bovinos();
                
                bovino.setDIB(resultado.getString("DIB"));
                bovino.setREGA(REGA);
                bovino.setNacimiento(resultado.getString("nacimiento"));
                bovino.setPaisOrigen(resultado.getString("paisOrigen"));
                bovino.setRaza(resultado.getString("raza"));
                bovino.setSexo(resultado.getString("sexo"));
                bovino.setDIBMadre(resultado.getString("DIBMadre"));
                bovino.setFechaAlta(resultado.getString("fechaAlta"));
                bovino.setTernero(resultado.getString("ternero"));
                bovino.setExploNaci(resultado.getString("exploNaci"));
                
                lista.add(bovino);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBovinoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public void updateBovinos(Bovinos bovino) {
         String sql = "UPDATE bovino SET REGA = ?, nacimiento = ?, paisOrigen = ?, raza = ?, sexo = ?, DIBMadre = ?, fechaAlta = ?, ternero = ?, exploNaci = ? WHERE DIB = ?";

        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(10, bovino.getDIB());
            stm.setString(1, bovino.getREGA());
            stm.setString(2, bovino.getNacimiento());
            stm.setString(3, bovino.getPaisOrigen());
            stm.setString(4, bovino.getRaza());
            stm.setString(5, bovino.getSexo());
            stm.setString(6, bovino.getDIBMadre());
            stm.setString(7, bovino.getFechaAlta());
            stm.setString(8, bovino.getTernero());
            stm.setString(9, bovino.getExploNaci());
            
            stm.executeUpdate();  
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBovinoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
    }

    @Override
    public void deleteBovinos(String DIB) {
        String sql = "DELETE FROM bovino WHERE DIB = ?";
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
                Logger.getLogger(MySQLBovinoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }  finally {
            ConnectionFactory.closeConnnection();
        }
    }
    
}
