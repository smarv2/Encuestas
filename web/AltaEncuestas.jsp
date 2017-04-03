<%@page import="Objetos.Encuesta"%>
<%@page import="Objetos.DAOEncuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession objSession = request.getSession(false);
    String usuario = "";
    usuario = (String) objSession.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");

    }

    String IdEncuesta = "";
    String NombreEncuesta = "";

    if (request.getParameter("IdEncuesta") != null) {
        IdEncuesta = request.getParameter("IdEncuesta").toString();
    }

    DAOEncuesta daos = null;
    Encuesta encuesta = null;

    if (!IdEncuesta.equalsIgnoreCase("")) {
        daos = new DAOEncuesta();
        encuesta = daos.getEncuesta(IdEncuesta);

        NombreEncuesta = encuesta.getNombreEncuesta();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Encuenta</title>
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
                <h3>Detalle de Encuesta</h3>
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Guardar" id="btniniciar" onclick="fnEnviaEncuesta();"/> 
                <input type="button" class="btn btn-warning" value="Cancelar" id="btnMenu" onclick="location.href = 'Encuestas.jsp'"/>
            </div>
            
            <form action="RegistraEncuesta.do" method="post" id="formEncuesta">
                <input type="hidden" name="IdEncuesta" id="IdEncuesta" value="<%=IdEncuesta%>"/>
                <label>Encuesta: </label>
                <input type="text" class="form-control" name="NombreEncuesta" id="NombreEncuesta" value="<%=NombreEncuesta%>"/> 
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
            function fnEnviaEncuesta(){
                if(document.getElementById('NombreEncuesta').value != ''){
                    document.getElementById('formEncuesta').submit();
                }else{
                    alert('Por favor, capture el nombre de la Encuesta.');
                }
            }
        </script>
    </body>
</html>
