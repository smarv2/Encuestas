/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author smarv
 */
public class Conexion {

    public String user = "root";
    public String password = "";
    public String host = "localhost";
    public String port = "3306";
    public String database = "encuesta";
    public String classname = "com.mysql.jdbc.Driver";

    public String url = "jdbc:mysql://" + host + ":" + port + "/" + database;

    public Connection con;

    /**
     * 
     */
    public Conexion() {
        try {
            Class.forName(classname);
            con = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: " + e);
        }
    }

    public Connection getConexion() {
        return con;
    }
    
}
