/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import BaseDatos.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;

/**
 *
 * @author smarv
 */
public class DAOEncuesta {

    public DAOEncuesta() {
    }

    public Encuesta getEncuesta(String idEncuesta) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        Encuesta Encuesta = new Encuesta();
        try {
            String strSQL = "select * from encuesta where id_encuesta = ?";

            pst = con.getConexion().prepareStatement(strSQL);
            pst.setString(1, idEncuesta);

            rs = pst.executeQuery();

            if (rs.next()) {
                

                Encuesta.setIdEncuesta(rs.getString("id_Encuesta"));
                Encuesta.setNombreEncuesta(rs.getString("nombre_encuesta"));
                
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return Encuesta;
    }

}
