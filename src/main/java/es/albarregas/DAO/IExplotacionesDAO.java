/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Explotaciones;
import java.util.List;

/**
 *
 * @author Markitos
 */
public interface IExplotacionesDAO {
    
    public List<Explotaciones> setExplotacion(Explotaciones explo);
    
    public List<Explotaciones> getExplotacion(String REGA);
    
    public List<Explotaciones> getExplotacionUsu(String usuario);
    
    public List<Explotaciones> getAllExplotaciones();
    
    public List<Explotaciones> getAllExplotacionesValidadas();
    
    public void updateExplotacion(Explotaciones explo);
    
    public void deleteExplotacion(String REGA);
}
