<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BaseDatos.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = "";
    usuario = (String) objSession.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");

    }

    PreparedStatement pst = null;
    ResultSet rs = null;
    String strSQL = "select * from opcion a INNER JOIN pregunta b on (a.id_pregunta = b.id_pregunta) INNER JOIN encuesta c on (c.id_encuesta = b.id_encuesta) ORDER BY nombre_encuesta, nombre_pregunta, nombre_opcion;";

    Conexion con = new Conexion();
    pst = con.getConexion().prepareStatement(strSQL);

    rs = pst.executeQuery();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Opciones</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <header>
            <div class="container-fluid">
                <h1>.:Sistema de Encuestas:.</h1>
            </div>
        </header>

        <div class="container-fluid">
            <div class="color1">
                <h3>Listado de Opciones</h3>    
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Nueva Opcion" id="btnNuevaOpcion" onclick="location.href='AltaOpciones.jsp'"/> 
                <input type="button" class="btn btn-primary" value="Menu" id="btnMenu" onclick="location.href='Menu.jsp'"/>
            </div>

            <table WIDTH=50%>
                <tr>
                    <td><b>Encuesta</b></td>
                    <td><b>Pregunta</b></td>
                    <td><b>Opcion</b></td>
                    <td><b></b></td>
                </tr>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%=rs.getString("nombre_encuesta")%></td>
                        <td><%=rs.getString("nombre_pregunta")%></td>
                        <td><a href="AltaOpciones.jsp?IdOpcion=<%=rs.getString("id_opcion")%>" class="btn btn-default btn-block"><%=rs.getString("nombre_opcion")%></a></td>
                        <td><input type="button"  class="btn btn-danger" value="Borrar" id="btnBorraPregunta" onclick="fnBorraOpcion(<%=rs.getString("id_opcion")%>,'<%=rs.getString("nombre_opcion")%>')"/></td>
                    </tr>
                <% } %>

            </table>
        </div>
        <br>
        <footer>
            <div class="container-fluid">
                <h3>
                    Derechos Reservados.
                </h3>
            </div>
        </footer>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            function fnBorraOpcion(idOpcion,nombreOpcion){
                if(confirm("Esta seguro que desea borrar la opcion: " + nombreOpcion + "?")){
                    location.href='BorraOpcion.do?IdOpcion='+idOpcion;
                }
            }
        </script>
    </body>
    </body>
</html>

</body>
</html>
