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
    String strSQL = "select * from pregunta a INNER JOIN encuesta b on (a.id_encuesta = b.id_encuesta) order by nombre_encuesta, nombre_pregunta";

    Conexion con = new Conexion();
    pst = con.getConexion().prepareStatement(strSQL);

    rs = pst.executeQuery();


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preguntas</title>
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
                <h3>Listado de Preguntas</h3>    
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Nueva Pregunta" id="btnNuevaEncuesta" onclick="location.href='AltaPreguntas.jsp'"/> 
                <input type="button" class="btn btn-primary" value="Menu" id="btnMenu" onclick="location.href='Menu.jsp'"/> <br> <br> 
            </div>
            <table WIDTH=50%>
                <tr>
                    <td><b>ENCUESTA</b></td>
                    <td><b>PREGUNTA</b></td>
                    <td></td>
                </tr>
                <% while (rs.next()) { %> 
                    <tr>
                        <td><%=rs.getString("nombre_encuesta")%></td>
                        <td><a href="AltaPreguntas.jsp?IdPregunta=<%=rs.getString("id_pregunta")%>" class="btn btn-default btn-block"><%=rs.getString("nombre_pregunta")%></a></td>
                        <td><input type="button"  class="btn btn-danger" value="Borrar" id="btnBorraPregunta" onclick="fnBorraPregunta(<%=rs.getString("id_pregunta")%>,'<%=rs.getString("nombre_pregunta")%>')"/></td>
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
            function fnBorraPregunta(idPregunta,nombrePregunta){
                if(confirm("Esta seguro que desea borrar la pregunta: " + nombrePregunta + "?")){
                    location.href='BorraPregunta.do?IdPregunta='+idPregunta;
                }
            }
        </script>
    </body>
</html>

</body>
</html>
