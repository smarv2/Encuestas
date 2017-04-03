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
public class DAOOpcion {

    public DAOOpcion() {
    }

    public Opcion getOpcion(String IdOpcion) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        Opcion Opcion = new Opcion();
        try {
            String strSQL = "select * from opcion a INNER JOIN pregunta b on (a.id_pregunta = b.id_pregunta) where id_opcion = ?";

            pst = con.getConexion().prepareStatement(strSQL);
            pst.setString(1, IdOpcion);

            rs = pst.executeQuery();

            if (rs.next()) {
                
                Opcion.setIdOpcion(rs.getString("id_opcion"));
                Opcion.setNombreOpcion(rs.getString("nombre_opcion"));
                Opcion.setIdPregunta(rs.getString("id_pregunta"));
                Opcion.setNombrePregunta(rs.getString("nombre_pregunta"));
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return Opcion;
    }

}
