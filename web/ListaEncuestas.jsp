<%@page import="Objetos.VO.EncuestaVO"%>
<%@page import="Objetos.DAO.DAOEncuesta"%>
<%@page import="java.util.List"%>
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

    List<EncuestaVO> listaEncuestas = null;
    DAOEncuesta daoEncuesta = new DAOEncuesta();
    
    listaEncuestas = daoEncuesta.getListaEncuestas();
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
                <h3>Encuestas Disponibles</h3>    
            </div>
        </div>

        <div class="container">
            <div class="form-group">
                <input type="button"  class="btn btn-primary" value="Menu" id="btnMenu" onclick="location.href = 'Menu.jsp'"/> 
            </div>

            <table WIDTH=25%>
                <tr>
                    <td><b>ENCUESTAS</b></td>
                    <td></td>
                </tr>
                <% for (EncuestaVO encuestaVO : listaEncuestas) {%>
                    <tr>
                        <td><a href="ResponderEncuesta.jsp?IdEncuesta=<%=encuestaVO.getIdEncuesta()%>" class="btn btn-default btn-block"><%=encuestaVO.getNombreEncuesta()%></a></td>
                    </tr>
                <% }%>

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
    </body>
</html>

</body>
</html>
