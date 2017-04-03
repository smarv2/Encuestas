<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = "";
    usuario = (String) objSession.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <header>
            <div class="container-fluid">
                <h1>.:Sistema de Encuestas:..</h1>
            </div>
        </header>

        <div class="container-fluid">
            <div class="color1">
                <h3>Menu</h3>
            </div>
        </div>

        <div class="container">
            <h1>Hola <%=usuario%>.</h1>    
        </div>
        <div class="container">
            <div class="">
                <p>Por favor elija una opcion para administrar: </p> <br>
            </div>
            <input type="button" class="btn btn-primary" value="Encuestas" id="btnEncuestas" onclick="fnRedEncuesta();"/> 
            <input type="button" class="btn btn-primary" value="Preguntas" id="btnPregunta" onclick="fnRedPregunta();"/>
            <input type="button" class="btn btn-primary" value="Opcones" id="btnOpcion" onclick="fnRedOpcion();"/> 
            <input type="button" class="btn btn-primary" value="Responder Encuestas" id="btnOpcion" onclick="fnRedResEncuesta();"/> 
            <input type="button" class="btn btn-danger" value="Salir" id="btnOpcion" onclick="fnRedSalir();"/> 
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
                function fnRedEncuesta() {
                    location.href = 'Encuestas.jsp';
                }

                function fnRedPregunta() {
                    location.href = 'Preguntas.jsp';
                }

                function fnRedOpcion() {
                    location.href = 'Opciones.jsp';
                }
                
                function fnRedResEncuesta(){
                    location.href = 'ListaEncuestas.jsp';
                }
                
                function fnRedSalir(){
                    location.href = 'Salir.jsp';
                }
        </script>
    </body>

</html>
