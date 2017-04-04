<%@page import="Objetos.DAO.DAOEncuesta"%>
<%@page import="java.util.List"%>
<%@page import="Objetos.VO.EncuestaVO"%>
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

    List<EncuestaVO> listaEncuesta = null;
    DAOEncuesta daoEncuesta = new DAOEncuesta();
    listaEncuesta = daoEncuesta.getListaEncuestas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuestas</title>
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
                <h3>Listado de Encuestas</h3>    
            </div>
        </div>
        
        <div class="container">
            <div class="form-group">
                <input type="button"  class="btn btn-success" value="Nueva Encuesta" id="btnNuevaEncuesta" onclick="location.href = 'AltaEncuestas.jsp'"/> 
                <input type="button"  class="btn btn-primary" value="Menu" id="btnMenu" onclick="location.href = 'Menu.jsp'"/> 
            </div>
            
            <table WIDTH=25%>
                <tr>
                    <td><b>ENCUESTA</b></td>
                    <td></td>
                </tr>
                <% for (EncuestaVO encuestaVO : listaEncuesta) {%>
                    <tr>
                        <td><a href="AltaEncuestas.jsp?IdEncuesta=<%=encuestaVO.getIdEncuesta()%>" class="btn btn-default btn-block"><%=encuestaVO.getNombreEncuesta()%></a></td>
                        <td><input type="button"  class="btn btn-danger" value="Borrar" id="btnBorraEncuesta" onclick="fnBorraEncuesta(<%=encuestaVO.getIdEncuesta()%>,'<%=encuestaVO.getNombreEncuesta()%>')"/></td>
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
            function fnBorraEncuesta(idEncuesta,nombreEncuesta){
                if(confirm("Esta seguro que desea borrar la encuesta: " + nombreEncuesta + "?")){
                    location.href='BorraEncuesta.do?IdEncuesta='+idEncuesta;
                }
            }
        </script>
    </body>
</html>

</body>
</html>
