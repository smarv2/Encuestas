<%@page import="Objetos.VO.EncuestaVO"%>
<%@page import="Objetos.DAO.DAOEncuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession objSession = request.getSession(false);
    String usuario = "";
    usuario = (String) objSession.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }

    String IdEncuestaConsulta = "";
    
    if (request.getParameter("IdEncuesta") != null) {
        IdEncuestaConsulta = request.getParameter("IdEncuesta").toString();
    }

    DAOEncuesta dao = null;
    EncuestaVO encuestaVO = null;

    if (!IdEncuestaConsulta.equalsIgnoreCase("")) {
        dao = new DAOEncuesta();
        encuestaVO = dao.getEncuesta(IdEncuestaConsulta);
    } 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Encuenta</title>
        <script src="js/funcionesGenerales.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <header>
            <div class="container-fluid">
                <h1>.:Sistema de Encuestas:.</h1>
            </div>
        </header>

        <div class="container-fluid">
            <div class="color1">
                <h3>Detalle de Encuesta</h3>
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Guardar" id="btniniciar" onclick="fnEnviaEncuesta();"/> 
                <input type="button" class="btn btn-warning" value="Cancelar" id="btnMenu" onclick="location.href = 'Encuestas.jsp'"/>
            </div>
            
            <form action="RegistraEncuesta.do" method="post" id="formEncuesta">
                <input type="hidden" name="IdEncuesta" id="IdEncuesta" value="<%=encuestaVO != null ? encuestaVO.getIdEncuesta(): ""%>"/>
                <label>Encuesta: </label>
                <input type="text" class="form-control" name="NombreEncuesta" id="NombreEncuesta" value="<%=encuestaVO != null ? encuestaVO.getNombreEncuesta(): ""%>"/> 
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
    </body>
</html>