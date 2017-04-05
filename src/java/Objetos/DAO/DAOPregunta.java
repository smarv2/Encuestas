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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        PreguntaVO preguntaVO = new PreguntaVO();
        try {
            String strSQL = "select * from pregunta a INNER JOIN encuesta b on (a.id_encuesta = b.id_encuesta) where a.id_Pregunta = ?";

            pst = con.getConexion().prepareStatement(strSQL);
            pst.setString(1, IdPregunta);
            
            System.out.println("pst: " + pst);
            rs = pst.executeQuery();

            if (rs.next()) {
                
                preguntaVO.setIdPregunta(rs.getString("id_pregunta"));
                preguntaVO.setNombrePregunta(rs.getString("nombre_pregunta"));
                preguntaVO.setIdEncuesta(rs.getString("id_Encuesta"));
                preguntaVO.setNombreEncuesta(rs.getString("nombre_encuesta"));
                
                System.out.println("rsIdEncuesta: " + rs.getString("id_Encuesta"));    
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }
        return preguntaVO;
    }
    
        public List<PreguntaVO> getListaPregunta () {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        List<PreguntaVO> listaPreguntaVO = new ArrayList<PreguntaVO>();
        
        try {
            String strSQL = "select * from pregunta a INNER JOIN encuesta b on (a.id_encuesta = b.id_encuesta) order by nombre_encuesta, nombre_pregunta";

            pst = con.getConexion().prepareStatement(strSQL);
            System.out.println("pst: " + pst);

            rs = pst.executeQuery();

            while (rs.next()) {
                PreguntaVO preguntaVO = new PreguntaVO();
                preguntaVO.setIdPregunta(rs.getString("id_pregunta"));
                preguntaVO.setNombrePregunta(rs.getString("nombre_pregunta"));
                preguntaVO.setIdEncuesta(rs.getString("id_Encuesta"));
                preguntaVO.setNombreEncuesta(rs.getString("nombre_encuesta"));
                listaPreguntaVO.add(preguntaVO);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }
        return listaPreguntaVO;
    }

}
