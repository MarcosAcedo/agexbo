/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DaoFactory;

import es.albarregas.DAO.IExplotacionesDAO;
import es.albarregas.DAO.IBajasDAO;
import es.albarregas.DAO.IBovinoDAO;
import es.albarregas.DAO.IDestinoExplotacionesDAO;
import es.albarregas.DAO.IUsuariosDAO;
import es.albarregas.DAO.MySQLBajasDAO;
import es.albarregas.DAO.MySQLBovinoDAO;
import es.albarregas.DAO.MySQLDestinoExplotacionesDAO;
import es.albarregas.DAO.MySQLExplotacionesDAO;
import es.albarregas.DAO.MySQLUsuariosDAO;

/**
 *
 * @author Markitos
 */
public class MySQLDAOFactory extends DAOFactory {
    @Override
    public IUsuariosDAO getUsuariosDAO() {
        return new MySQLUsuariosDAO();
    }

    @Override
    public IExplotacionesDAO getExplotacionesDAO() {
        return new MySQLExplotacionesDAO();
    }

    @Override
    public IBovinoDAO getBovinoDAO() {
        return new MySQLBovinoDAO();
    }

    @Override
    public IDestinoExplotacionesDAO getDestinoExplotacionesDAO() {
        return new MySQLDestinoExplotacionesDAO();
    }

    @Override
    public IBajasDAO getBajasDAO() {
        return new MySQLBajasDAO();
    }
    
}
