/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.logger.MyLogger;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Markitos
 */
public class ConnectionFactory {
    
    private static Connection conexion;
    private static DataSource dataSource;
    
    /*Abre la conexion de MYSQL*/
    public static Connection getMySQLConnection() {
        try {
            Context contexto = new InitialContext();
            dataSource = (DataSource) contexto.lookup("java:comp/env/jdbc/AGexBo");
            conexion = dataSource.getConnection();
        } catch (NamingException | SQLException ex) {
            MyLogger.doLog(ex, ConnectionFactory.class, "fatal");
        }

        return conexion;
    }
    
    /*Cierra la conexion de MYSQL*/
    public static void closeConnnection() {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException ex) {
                MyLogger.doLog(ex, ConnectionFactory.class, "fatal");
            }
        }
    }
}
