/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

/**
 *
 * @author smarv
 */
public class Pregunta {
    
    private String IdPregunta;
    private String NombrePregunta;
    private String IdEncuesta;
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
