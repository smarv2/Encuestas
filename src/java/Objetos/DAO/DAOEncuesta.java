/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos.DAO;

import Objetos.VO.EncuestaVO;
import BaseDatos.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author smarv
 */
public class DAOEncuesta {

    public DAOEncuesta() {
    }

    public EncuestaVO getEncuesta(String idEncuesta) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        EncuestaVO Encuesta = new EncuestaVO();
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

    /**
     * Metodo getListaEncuestas.

     * @return List de EncuestaVO.
     */
    public List<EncuestaVO> getListaEncuestas () {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        List<EncuestaVO> listaEncuenstaVO = new ArrayList<EncuestaVO>();
        
        try {
            String strSQL = "select * from encuesta order by nombre_encuesta";

            pst = con.getConexion().prepareStatement(strSQL);

            rs = pst.executeQuery();

            while (rs.next()) {
                EncuestaVO encuestaVO = new EncuestaVO();
                encuestaVO.setIdEncuesta(rs.getString("id_Encuesta"));
                encuestaVO.setNombreEncuesta(rs.getString("nombre_encuesta"));
                listaEncuenstaVO.add(encuestaVO);
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        return listaEncuenstaVO;
    }

}
