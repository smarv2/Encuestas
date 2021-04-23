/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos.DAO;

import Objetos.VO.OpcionVO;
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
public class DAOOpcion {

    public DAOOpcion() {
    }

    /**
     * Metodo getOpcion que obtiene el detalle de una opcion.
     *
     * @param IdOpcion
     * @return OpcionVO.
     */
    public OpcionVO getOpcion(String IdOpcion) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        OpcionVO Opcion = new OpcionVO();
        try {
            String strSQL = "select * from opcion a INNER JOIN pregunta b on (a.id_pregunta = b.id_pregunta) where id_opcion = ?";

            pst = con.getConexion().prepareStatement(strSQL);
            pst.setString(1, IdOpcion);

            System.out.println("pst: " + pst);
            rs = pst.executeQuery();

            if (rs.next()) {
                Opcion.setIdOpcion(rs.getString("id_opcion"));
                Opcion.setNombreOpcion(rs.getString("nombre_opcion"));
                Opcion.setIdPregunta(rs.getString("id_pregunta"));
                Opcion.setNombrePregunta(rs.getString("nombre_pregunta"));
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }
        return Opcion;
    }

    /**
     * Metodo getListaOpciones que obtiene todas las opciones.
     *
     * @return List de OpcionVO.
     */
    public List<OpcionVO> getListaOpciones() {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        List<OpcionVO> listaOpciones = new ArrayList<OpcionVO>();
        try {
            String strSQL = "select * from opcion a INNER JOIN pregunta b on (a.id_pregunta = b.id_pregunta) INNER JOIN encuesta c on (c.id_encuesta = b.id_encuesta) ORDER BY nombre_encuesta, nombre_pregunta, nombre_opcion;";

            pst = con.getConexion().prepareStatement(strSQL);
            System.out.println("pst: " + pst);

            rs = pst.executeQuery();

            while (rs.next()) {
                OpcionVO Opcion = new OpcionVO();
                Opcion.setIdOpcion(rs.getString("id_opcion"));
                Opcion.setNombreOpcion(rs.getString("nombre_opcion"));
                Opcion.setIdPregunta(rs.getString("id_pregunta"));
                Opcion.setNombrePregunta(rs.getString("nombre_pregunta"));
                Opcion.setNombreEncuesta(rs.getString("nombre_encuesta"));
                listaOpciones.add(Opcion);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }
        return listaOpciones;
    }

    /**
     * Metodo getListaPreguntasYOpciones que obtiene encuestas con opciones.
     *
     * @param idEncuesta
     * @return
     */
    public List<OpcionVO> getListaPreguntasYOpciones(String idEncuesta) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion con = new Conexion();
        List<OpcionVO> listaOpciones = new ArrayList<OpcionVO>();

        try {
            String strSQL = "select * from opcion a INNER JOIN pregunta b on (a.id_pregunta = b.id_pregunta) "
                    + "INNER JOIN encuesta c on (c.id_encuesta = b.id_encuesta) where c.id_encuesta = ? "
                    + "ORDER BY nombre_encuesta, nombre_pregunta, nombre_opcion";

            pst = con.getConexion().prepareStatement(strSQL);
            pst.setString(1, idEncuesta);

            System.out.println("pst: " + pst);
            rs = pst.executeQuery();

            while (rs.next()) {
                OpcionVO Opcion = new OpcionVO();
                Opcion.setIdOpcion(rs.getString("id_opcion"));
                Opcion.setNombreOpcion(rs.getString("nombre_opcion"));
                Opcion.setIdPregunta(rs.getString("id_pregunta"));
                Opcion.setNombrePregunta(rs.getString("nombre_pregunta"));
                Opcion.setNombreEncuesta(rs.getString("nombre_encuesta"));
                listaOpciones.add(Opcion);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e);
        }
        return listaOpciones;
    }

}
