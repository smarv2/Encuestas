<%@page import="Objetos.DAO.DAOOpcion"%>
<%@page import="Objetos.VO.OpcionVO"%>
<%@page import="java.util.List"%>
<%@page import="Objetos.VO.EncuestaVO"%>
<%@page import="Objetos.DAO.DAOEncuesta"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BaseDatos.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
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
    EncuestaVO encuestaVO = null;

    List<OpcionVO> listaOpciones = null;
    DAOOpcion daoOpcion = null;

    if (!IdEncuesta.equalsIgnoreCase("")) {
        daos = new DAOEncuesta();
        encuestaVO = daos.getEncuesta(IdEncuesta);

        NombreEncuesta = encuestaVO.getNombreEncuesta();

        daoOpcion = new DAOOpcion();
        listaOpciones = daoOpcion.getListaPreguntasYOpciones(IdEncuesta);
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
                <h3>Encuesta - <%=NombreEncuesta%></h3>
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <input type="button" class="btn btn-success" value="Guardar" id="btniniciar" onclick=""/> 
                <input type="button" class="btn btn-warning" value="Cancelar" id="btnMenu" onclick="location.href = 'ListaEncuestas.jsp'"/>
            </div>

            <form action="" method="post" id="">
                <input type="hidden" name="IdEncuesta" id="IdEncuesta" value="<%=IdEncuesta%>"/>

                <%

                    String PreguntaAnt = "";

                    for (OpcionVO opcionVO : listaOpciones) {
                        if (!opcionVO.getNombrePregunta().equalsIgnoreCase(PreguntaAnt) && !PreguntaAnt.equalsIgnoreCase("")) { 
                %>
                </select>
            </div>    
            <%

                }

                if (!opcionVO.getNombrePregunta().equalsIgnoreCase(PreguntaAnt)) {
            %>
        <div class="form-group">    
            <label><%=opcionVO.getNombrePregunta()%> </label>
            <%

                }

                if (!opcionVO.getNombrePregunta().equalsIgnoreCase(PreguntaAnt)) {%>
            <SELECT NAME="Pregunta" id="Pregunta" class="form-control" SIZE=1> 
                <OPTION selected="" VALUE="0">Elija una opcion.</OPTION>
                <OPTION VALUE="<%=opcionVO.getIdOpcion()%>"><%=opcionVO.getNombreOpcion()%></OPTION>
                    <% } else { %>
                        <OPTION VALUE="<%=opcionVO.getIdOpcion()%>"><%=opcionVO.getNombreOpcion()%></OPTION>
                    <% }
                        PreguntaAnt = opcionVO.getNombrePregunta();
                    %>        
                    <% } %>
            </select>
        </div>    
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
            function fnEnviaEncuesta() {
                if (document.getElementById('NombreEncuesta').value != '') {
                    document.getElementById('formEncuesta').submit();
                } else {
                    alert('Por favor, capture el nombre de la Encuesta.');
                }
            }
        </script>
    </body>
</html>
