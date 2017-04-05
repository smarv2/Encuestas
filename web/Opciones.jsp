<%@page import="Objetos.DAO.DAOOpcion"%>
<%@page import="Objetos.VO.OpcionVO"%>
<%@page import="java.util.List"%>
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

    List<OpcionVO> listaOpciones = null;
    DAOOpcion daoOpcion = new DAOOpcion();
    listaOpciones = daoOpcion.getListaOpciones();
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
                <% for (OpcionVO opcionVO : listaOpciones) { %>
                    <tr>
                        <td><%=opcionVO.getNombreEncuesta()%></td>
                        <td><%=opcionVO.getNombrePregunta()%></td>
                        <td><a href="AltaOpciones.jsp?IdOpcion=<%=opcionVO.getIdOpcion()%>" class="btn btn-default btn-block"><%=opcionVO.getNombreOpcion()%></a></td>
                        <td><input type="button"  class="btn btn-danger" value="Borrar" id="btnBorraPregunta" onclick="fnBorraOpcion(<%=opcionVO.getIdOpcion()%>,'<%=opcionVO.getNombreOpcion()%>')"/></td>
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
