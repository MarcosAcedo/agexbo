/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import static es.albarregas.DAO.ConnectionFactory.getMySQLConnection;
import es.albarregas.DAO.IBajasDAO;
import es.albarregas.beans.Bajas;
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
public class MySQLBajasDAO implements IBajasDAO {

    @Override
    public List<Bajas> setBajas(Bajas baja) {
        String sql = "INSERT INTO Baja (DIB, fechaBaja, causa, destino) VALUES (?, ?, ?, ?)";
        
        ArrayList<Bajas> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, baja.getDIB());
            stm.setString(2, baja.getFechaBaja());
            stm.setString(3, baja.getCausa());
            stm.setString(4, baja.getDestino());
            
            lista.add(baja); 
            
            stm.executeUpdate();
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBajasDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista; 
    }

   @Override
    public List<Bajas> getBajas(String REGA) {
        String sql = "SELECT * FROM Baja, explotacion WHERE REGA LIKE ? ";
        Bajas baja;
        ArrayList<Bajas> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, REGA);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                baja = new Bajas();
                
                baja.setDIB(resultado.getString("DIB"));
                baja.setFechaBaja(resultado.getString("fechaBaja"));
                baja.setCausa(resultado.getString("Causa"));
                baja.setDestino(resultado.getString("Destino"));
                
                lista.add(baja);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBajasDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return lista;
    }
    
    @Override
    public Bajas getBaja(String DIB) {
        String sql = "SELECT * FROM Baja WHERE DIB LIKE ?";
        Bajas baja = null;
        ArrayList<Bajas> lista = new ArrayList<>();
        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(1, DIB);
            ResultSet resultado = stm.executeQuery();
            while(resultado.next()){
                baja = new Bajas();
                
                baja.setDIB(DIB);
                baja.setFechaBaja(resultado.getString("fechaBaja"));
                baja.setCausa(resultado.getString("Causa"));
                baja.setDestino(resultado.getString("Destino"));
                
                lista.add(baja);
            }
            conexion.commit();
            
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBajasDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
        return baja;
    }

    @Override
    public void updateBajas(Bajas baja) {
        String sql = "UPDATE Baja SET fechaBaja = ?, causa = ?, destino = ? WHERE DIB = ?";

        Connection conexion = null;
        try {
            conexion = getMySQLConnection();
            conexion.setAutoCommit(false);
            PreparedStatement stm = ConnectionFactory.getMySQLConnection().prepareStatement(sql);
            stm.setString(4, baja.getDIB());
            stm.setString(1, baja.getFechaBaja());
            stm.setString(2, baja.getCausa());
            stm.setString(3, baja.getDestino());
            
            stm.executeUpdate();  
            
            conexion.commit();
            conexion.close();
        } catch (SQLException ex) {
            MyLogger.doLog(ex, this.getClass(), "fatal");
            try {
                conexion.rollback();
                conexion.close();
            } catch (SQLException ex1) {
                Logger.getLogger(MySQLBajasDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            ConnectionFactory.closeConnnection();
        }
    }

    @Override
    public void deleteBajas(String DIB) {
        String sql = "DELETE FROM Baja WHERE DIB = ?";
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
                Logger.getLogger(MySQLBajasDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }  finally {
            ConnectionFactory.closeConnnection();
        }
    }
}
