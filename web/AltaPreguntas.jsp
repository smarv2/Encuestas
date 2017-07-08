<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="Objetos.DAO.DAOEncuesta"%>
<%@page import="Objetos.VO.EncuestaVO"%>
<%@page import="BaseDatos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Objetos.VO.PreguntaVO"%>
<%@page import="Objetos.DAO.DAOPregunta"%>
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
    PreguntaVO preguntaVO = null;

    if (!IdPregunta.equalsIgnoreCase("")) {
        daos = new DAOPregunta();
        preguntaVO = daos.getPregunta(IdPregunta);

        NombrePregunta = preguntaVO.getNombrePregunta();
        IdEncuesta = preguntaVO.getIdEncuesta();

        System.out.println("IdEncuesta combo: " + IdEncuesta);
    }

    List<EncuestaVO> listaEncuesta = null;
    DAOEncuesta daoEncuesta = new DAOEncuesta();
    listaEncuesta = daoEncuesta.getListaEncuestas();
    Iterator<EncuestaVO> encuestaIte = listaEncuesta.iterator();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Pregunta</title>
        <script src="js/funcionesGenerales.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
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
                <input type="button" value="Guardar" class="btn btn-success" id="btnGuardar" onclick="fnEnviaPregunta();"/> 
                <input type="button" value="Cancelar" class="btn btn-warning" id="btnCancelar" onclick="location.href = 'Preguntas.jsp'"/>
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
                    <% while (encuestaIte.hasNext()) {%>
                    <% EncuestaVO encuestaVO = new EncuestaVO(); %>
                    <% encuestaVO = encuestaIte.next(); %>
                            <OPTION VALUE="<%=encuestaVO.getIdEncuesta()%>"><%=encuestaVO.getNombreEncuesta()%></OPTION>
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
        </script>
    </body>
</html>
