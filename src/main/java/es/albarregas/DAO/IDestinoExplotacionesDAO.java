/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.DestinosExplotaciones;
import java.util.List;

/**
 *
 * @author Markitos
 */
public interface IDestinoExplotacionesDAO {
    
    public List<DestinosExplotaciones> setDestinosExplotacion(DestinosExplotaciones destiExplo);
    
    public DestinosExplotaciones getDestinoExplotacion(String DIB);
    
    public List<DestinosExplotaciones> getDestinosExplotacion(String REGA);
    
    public List<DestinosExplotaciones> getDestinosCebaderos(String REGA);
    
    public List<DestinosExplotaciones> getDestinosReposiciones(String REGA);
    
    public void updateDestinosExplotacio(DestinosExplotaciones destiExplo);
    
    public void deleteDestinosExplotacio(String DIB);
    
}
