/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos.VO;

import java.io.Serializable;

/**
 *
 * @author MXI01020253A
 */
public class UsuarioVO implements Serializable{
    
    /**
    * El campo {@code serialVersionUID}, es una instancia {@code long}.
    */
    private static final long serialVersionUID = 1L;
    
    /**
     * campo usuario de tipo String.
     */
    private String usuario;
    
    /**
     * * campo contraseña de tipo String.
     */
    private String contraseña;

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the contraseña
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * @param contraseña the contraseña to set
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    
    
    
    
    
}
