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
public class PreguntaVO implements Serializable {
    
    /**
    * El campo {@code serialVersionUID}, es una instancia {@code long}.
    */
    private static final long serialVersionUID = 1L;
    
    /**
     * campo IdPregunta de tipo String.
     */
    private String IdPregunta;
    
    /**
     * campo NombrePregunta de tipo String.
     */
    private String NombrePregunta;
    
    /**
     * campo IdEncuesta de tipo String.
     */
    private String IdEncuesta;
    
    /**
     * campo NombreEncuesta de tipo String.
     */
    private String NombreEncuesta;

    /**
     * @return the IdPregunta
     */
    public String getIdPregunta() {
        return IdPregunta;
    }

    /**
     * @param IdPregunta the IdPregunta to set
     */
    public void setIdPregunta(String IdPregunta) {
        this.IdPregunta = IdPregunta;
    }

    /**
     * @return the NombrePregunta
     */
    public String getNombrePregunta() {
        return NombrePregunta;
    }

    /**
     * @param NombrePregunta the NombrePregunta to set
     */
    public void setNombrePregunta(String NombrePregunta) {
        this.NombrePregunta = NombrePregunta;
    }

    /**
     * @return the IdEncuesta
     */
    public String getIdEncuesta() {
        return IdEncuesta;
    }

    /**
     * @param IdEncuesta the IdEncuesta to set
     */
    public void setIdEncuesta(String IdEncuesta) {
        this.IdEncuesta = IdEncuesta;
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
