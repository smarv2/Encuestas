<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Objetos.Opcion"%>
<%@page import="Objetos.DAOOpcion"%>
<%@page import="BaseDatos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = "";
    usuario = (String) objSession.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");

    }
    
    String IdOpcion = "";
    String NombreOpcion = "";
    String IdPregunta = "0";

    if (request.getParameter("IdOpcion") != null) {
        IdOpcion = request.getParameter("IdOpcion").toString();
    }

    DAOOpcion daos = null;
    Opcion opcion = null;

    if (!IdOpcion.equalsIgnoreCase("")) {
        daos = new DAOOpcion();
        opcion = daos.getOpcion(IdOpcion);

        NombreOpcion = opcion.getNombreOpcion();
        IdPregunta = opcion.getIdPregunta();
    }

    PreparedStatement pst = null;
    ResultSet rsPregunta = null;
    String strSQL = "select * from pregunta";

    Conexion con = new Conexion();
    pst = con.getConexion().prepareStatement(strSQL);

    rsPregunta = pst.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Opcion</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body onload="">
        <header>
            <div class="container-fluid">
                <h1>.:Sistema de Encuestas:.</h1>
            </div>
        </header>

        <div class="container-fluid">
            <div class="color1">
                <h3>Detalle de Opcion</h3>
            </div>
        </div>
        
        <div class="container">
            <form action="RegistraOpcion.do" method="post" id="formEncuesta">
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Guardar" id="btniniciar" onclick="fnEnviaOpcion();"/> 
                <input type="button" class="btn btn-warning" value="Cancelar" id="btnMenu" onclick="location.href = 'Opciones.jsp'"/>
            </div>
            <input type="hidden" name="IdOpcion" id="IdOpcion" value="<%=IdOpcion%>"/>
            <div class="form-group">
                <label>Opcion: </label>
                <input type="text" class="form-control" name="NombreOpcion" id="NombreOpcion" value="<%=NombreOpcion%>"/> 
            </div>
            <label>Pregunta: </label>
            <SELECT NAME="IdPregunta" class="form-control" id="IdPregunta" SIZE=1 onChange=""> 
                <OPTION selected="" VALUE="0">Elija una opcion.</OPTION>
                    <% while (rsPregunta.next()) {%>
                        <OPTION VALUE="<%=rsPregunta.getString("id_pregunta")%>"><%=rsPregunta.getString("nombre_pregunta")%></OPTION>
                    <% }%>
            </SELECT>
        </form>
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
            document.getElementById("IdPregunta").value = '<%=IdPregunta%>';

            function fnEnviaOpcion() {
                if (document.getElementById('NombreOpcion').value != '') {
                    if (document.getElementById('IdPregunta').value == '0') {
                        alert('Por favor, elija una Pregunta.');
                    } else {
                        document.getElementById('formEncuesta').submit();
                    }
                } else {
                    alert('Por favor, capture el nombre de la Opcion.');
                }
            }
        </script>
    </body>
</html>
