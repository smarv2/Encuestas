<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession obsSession = request.getSession(true);
    obsSession.setAttribute("usuario", null);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <script src="js/javascript.js"></script>
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
                <h3>Iniciar Sesion</h3>
            </div>
        </div>
        <div class="container">
            <form action="Iniciar.do" method="post" id="forminicio">
                <label>Nombre</label>
                <input type="text" class="form-control" name="Usuario" id="txtusuario" size="10"/> <br>
                <label>Contraseña</label>
                <input type="password" class="form-control" name="Password" id="txtpass"/> <br>
                <input type="button" value="iniciar sesion" id="btniniciar"/> <br>
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
