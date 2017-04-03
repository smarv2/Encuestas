<%@page import="BaseDatos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Objetos.Pregunta"%>
<%@page import="Objetos.DAOPregunta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = "";
    usuario = (String) objSession.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");

    }
    
    String IdPregunta = "";
    String NombrePregunta = "";
    String IdEncuesta = "0";

    if (request.getParameter("IdPregunta") != null) {
        IdPregunta = request.getParameter("IdPregunta").toString();
    }

    DAOPregunta daos = null;
    Pregunta pregunta = null;

    if (!IdPregunta.equalsIgnoreCase("")) {
        daos = new DAOPregunta();
        pregunta = daos.getPregunta(IdPregunta);

        NombrePregunta = pregunta.getNombrePregunta();
        IdEncuesta = pregunta.getIdEncuesta();

        System.out.println("IdEncuesta combo: " + IdEncuesta);
    }

    PreparedStatement pst = null;
    ResultSet rsEncuesta = null;
    String strSQL = "select * from encuesta";

    Conexion con = new Conexion();
    pst = con.getConexion().prepareStatement(strSQL);

    rsEncuesta = pst.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Pregunta</title>
        <!-- Latest compiled and minified CSS -->
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
                <h3>Detalle de Pregunta</h3>
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <input type="button" value="Guardar" class="btn btn-success" id="btniniciar" onclick="fnEnviaPregunta();"/> 
                <input type="button" value="Cancelar" class="btn btn-warning" id="btnMenu" onclick="location.href = 'Preguntas.jsp'"/>
            </div>
        
            <form action="RegistraPregunta.do" method="post" id="formEncuesta">
                <input type="hidden" name="IdPregunta" id="IdPregunta" value="<%=IdPregunta%>"/>
                <div class="form-group">
                    <label>Pregunta: </label>
                    <input type="text" class="form-control" name="NombrePregunta" id="NombrePregunta" value="<%=NombrePregunta%>"/>
                </div>
                <label>Encuesta: </label>
                <SELECT NAME="IdEncuesta" id="IdEncuesta" class="form-control" SIZE=1 onChange=""> 
                    <OPTION selected="" VALUE="0">Elija una opcion.</OPTION>
                        <% while (rsEncuesta.next()) {%>
                            <OPTION VALUE="<%=rsEncuesta.getString("id_encuesta")%>"><%=rsEncuesta.getString("nombre_encuesta")%></OPTION>
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
            document.getElementById("IdEncuesta").value = '<%=IdEncuesta%>';

            function fnEnviaPregunta() {
                if (document.getElementById('NombrePregunta').value != '') {
                    if (document.getElementById('IdEncuesta').value == '0') {
                        alert('Por favor, elija una Encuesta.');
                    } else {
                        document.getElementById('formEncuesta').submit();
                    }
                } else {
                    alert('Por favor, capture el nombre de la Pregunta.');
                }
            }
        </script>
    </body>
</html>
