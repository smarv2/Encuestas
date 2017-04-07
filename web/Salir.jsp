<%@page contentType="text/html" pageEncoding="ISO-8859-5"%>
<%
    HttpSession obsSession = request.getSession(true);
    obsSession.setAttribute("usuario", null);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-5">
        <title>JSP Page..</title>
    </head>
    <body>
        <script>
            location.href='index.jsp'
        </script>
    </body>
</html>
