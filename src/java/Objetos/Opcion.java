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
public class Opcion {
    
    private String IdOpcion;
    private String NombreOpcion;
    private String IdPregunta;
    private String NombrePregunta;

    /**
     * @return the IdOpcion
     */
    public String getIdOpcion() {
        return IdOpcion;
    }

    /**
     * @param IdOpcion the IdOpcion to set
     */
    public void setIdOpcion(String IdOpcion) {
        this.IdOpcion = IdOpcion;
    }

    /**
     * @return the NombreOpcion
     */
    public String getNombreOpcion() {
        return NombreOpcion;
    }

    /**
     * @param NombreOpcion the NombreOpcion to set
     */
    public void setNombreOpcion(String NombreOpcion) {
        this.NombreOpcion = NombreOpcion;
    }

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

}
