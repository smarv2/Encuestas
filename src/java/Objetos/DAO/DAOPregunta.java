/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos.DAO;

import Objetos.VO.PreguntaVO;
import BaseDatos.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;

/**
 *
 * @author smarv
 */
public class DAOPregunta {

    public DAOPregunta() {
    }

    public PreguntaVO getPregunta(String IdPregunta) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        PreguntaVO Pregunta = new PreguntaVO();
        try {
            String strSQL = "select * from pregunta a INNER JOIN encuesta b on (a.id_encuesta = b.id_encuesta) where a.id_Pregunta = ?";

            pst = con.getConexion().prepareStatement(strSQL);
            pst.setString(1, IdPregunta);
            System.out.println(pst);
            rs = pst.executeQuery();

            if (rs.next()) {
                
                Pregunta.setIdPregunta(rs.getString("id_pregunta"));
                Pregunta.setNombrePregunta(rs.getString("nombre_pregunta"));
                Pregunta.setIdEncuesta(rs.getString("id_Encuesta"));
                Pregunta.setNombreEncuesta(rs.getString("nombre_encuesta"));
                
                System.out.println("rsIdEncuesta: " + rs.getString("id_Encuesta"));    
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return Pregunta;
    }

}
