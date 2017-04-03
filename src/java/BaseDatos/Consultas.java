/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDatos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author smarv
 */
public class Consultas extends Conexion {

    public boolean autenticacion(String Usuario, String Password) {
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String consulta = "select * from usuarios where Usuario = ? and Password = ?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, Usuario);
            pst.setString(2, Password);
            System.out.println(pst);
            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }

        }

        return false;
    }

    /*public static void main(String[] args) {
        Consultas co = new Consultas();
        System.out.println(co.autenticacion("mramirez", "1234"));
        
    }*/
    public boolean registraEncuesta(String IdEncuesta, String NombreEncuesta) {
        PreparedStatement pst = null;
        try {
            if (IdEncuesta != "") {
                String consulta = "update encuesta set nombre_encuesta = ? where id_encuesta = ?";
                pst = getConexion().prepareStatement(consulta);
                pst.setString(1, NombreEncuesta);
                pst.setString(2, IdEncuesta);
                System.out.println(pst);
            } else {
                String consulta = "insert into encuesta (nombre_encuesta) values (?)";
                pst = getConexion().prepareStatement(consulta);
                pst.setString(1, NombreEncuesta);
                System.out.println(pst);
            }

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
        }
        return false;
    }

    public boolean registraPregunta(String IdPregunta, String NombrePregunta, String IdEncuesta) {

        PreparedStatement pst = null;
        try {
            if (IdPregunta != "") {
                String consulta = "update pregunta set nombre_pregunta = ?, id_encuesta = ? where id_pregunta = ?";
                pst = getConexion().prepareStatement(consulta);
                pst.setString(1, NombrePregunta);
                pst.setString(2, IdEncuesta);
                pst.setString(3, IdPregunta);
                System.out.println(pst);
            } else {
                String consulta = "insert into pregunta (nombre_pregunta, id_encuesta) values (?,?)";
                pst = getConexion().prepareStatement(consulta);
                pst.setString(1, NombrePregunta);
                pst.setString(2, IdEncuesta);
                System.out.println(pst);
            }

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
        }
        return false;
    }
    
        public boolean registraOpcion(String IdOpcion, String NombreOpcion, String IdPregunta) {

        PreparedStatement pst = null;
        try {
            if (IdOpcion != "") {
                String consulta = "update opcion set nombre_opcion = ?, id_pregunta = ? where id_opcion = ?";
                pst = getConexion().prepareStatement(consulta);
                pst.setString(1, NombreOpcion);
                pst.setString(2, IdPregunta);
                pst.setString(3, IdOpcion);
                System.out.println(pst);
            } else {
                String consulta = "insert into opcion (nombre_opcion, id_pregunta) values (?,?)";
                pst = getConexion().prepareStatement(consulta);
                pst.setString(1, NombreOpcion);
                pst.setString(2, IdPregunta);
                System.out.println(pst);
            }

            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
        }
        return false;
    }

    public boolean borraEncuesta(String IdEncuesta) {
        PreparedStatement pst = null;
        try {
            String consulta = "call st_borraEncuesta(?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, IdEncuesta);
            System.out.println(pst);
            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
        }
        return false;
    }

    public boolean borraPregunta(String IdPregunta) {
        PreparedStatement pst = null;
        try {
            String consulta = "call st_borraPregunta(?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, IdPregunta);
            System.out.println(pst);
            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
        }
        return false;
    }
    
    public boolean borraOpcion(String IdOpcion) {
        PreparedStatement pst = null;
        try {
            String consulta = "call st_borraOpcion(?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, IdOpcion);
            System.out.println(pst);
            if (pst.executeUpdate() == 1) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
        }
        return false;
    }
}
