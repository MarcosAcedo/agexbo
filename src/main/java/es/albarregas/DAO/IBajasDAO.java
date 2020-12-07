/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Bajas;
import java.util.List;

/**
 *
 * @author Markitos
 */
public interface IBajasDAO {
    
    public List<Bajas> setBajas(Bajas baja);
    
    public Bajas getBaja(String DIB);
    
    public List<Bajas> getBajas(String REGA);
    
    public void updateBajas(Bajas baja);
    
    public void deleteBajas(String DIB);
    
}
