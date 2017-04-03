<%-- 
    Document   : registro
    Created on : 16/09/2016, 07:30:00 PM
    Author     : smarv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Formulario de registro</h1>
        
        <form action="nuevousuario" method="post">
            <label>Nombre</label>
            <input type="text" name="Nombre"/><br>
            <label>Apellido</label>
            <input type="text" name="Apellido"/><br>
            <label>Usuario</label>
            <input type="text" name="Usuario"/><br>
            <label>Contraseña</label>
            <input type="password" name="Password"/><br>
            <label>Rol</label>
            <input type="text" name="Rol"/><br>
            
            <input type="submit" value="Registrar"/>
        </form>
    </body>
</html>
