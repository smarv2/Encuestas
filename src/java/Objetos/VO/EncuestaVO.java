/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos.VO;

import java.io.Serializable;

/**
 *
 * @author smarv
 */
public class EncuestaVO implements Serializable {
    
    /**
    * El campo {@code serialVersionUID}, es una instancia {@code long}.
    */
    private static final long serialVersionUID = 1L;
    
    /**
     * campo idEncuesta de tipo String.
     */
    private String idEncuesta;
    
    /**
     * campo NombreEncuesta de tipo String.
     */
    private String NombreEncuesta;

    /**
     * @return the idEncuesta
     */
    public String getIdEncuesta() {
        return idEncuesta;
    }

    /**
     * @param idEncuesta the idEncuesta to set
     */
    public void setIdEncuesta(String idEncuesta) {
        this.idEncuesta = idEncuesta;
    }

    /**
     * @return the NombreEncuesta
     */
    public String getNombreEncuesta() {
        return NombreEncuesta;
    }

    /**
     * @param NombreEncuesta the NombreEncuesta to set
     */
    public void setNombreEncuesta(String NombreEncuesta) {
        this.NombreEncuesta = NombreEncuesta;
    }   
}
