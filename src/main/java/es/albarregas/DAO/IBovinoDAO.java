/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.DAO;

import es.albarregas.beans.Bovinos;
import java.util.List;

/**
 *
 * @author Markitos
 */
public interface IBovinoDAO {
    
    public List<Bovinos> setBovinos(Bovinos bovino);
    
    public Bovinos getBovino(String DIB);
    
    public List<Bovinos> getBovinos(String REGA);
    
    public List<Bovinos> getBovinosT(String REGA);
    
    public void updateBovinos(Bovinos bovino);
    
    public void deleteBovinos(String DIB);
    
}
