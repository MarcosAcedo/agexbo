/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DaoFactory;

import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.DAO.IBovinoDAO;
import es.albarregas.DAO.IDestinoExplotacionesDAO;
import es.albarregas.DAO.IBajasDAO;
import es.albarregas.DAO.IExplotacionesDAO;

/**
 *
 * @author Markitos
 */
public abstract class DAOFactory {
    
    public abstract IUsuariosDAO getUsuariosDAO();
    public abstract IExplotacionesDAO getExplotacionesDAO();
    public abstract IBovinoDAO getBovinoDAO();
    public abstract IDestinoExplotacionesDAO getDestinoExplotacionesDAO();
    public abstract IBajasDAO getBajasDAO();
    
    
    public static DAOFactory getDAOFactory() {
        DAOFactory daof = null;

        daof = new MySQLDAOFactory();

        return daof;
    }
    
}
