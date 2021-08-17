<%--
    Document   : MenuPrincipalPersonal
    Created on : 11-ago-2021, 19:41:35
    Author     : ramir
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user;
            String Puesto;
            String codigo;
            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("2")) {
                user = sesion.getAttribute("user").toString();
                Puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
            } else {
                if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1")) {
                    response.sendRedirect("MenuPrincipalJefe.jsp");
                    out.print("<script>location.replace('MenuPrincipalJefe.jsp');<script>");
                } else {
                    response.sendRedirect("index.jsp");
                    out.print("<script>location.replace('index.jsp');<script>");
                }

            }

        %>
        <h1>Hello World!</h1>
    </body>
</html>
