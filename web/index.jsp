<%--
    Document   : index
    Created on : 14/07/2021, 07:06:05 PM
    Author     : ramir
--%>

<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page session="true"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/maincss.css" rel="stylesheet" type="text/css"/>
        <title>index</title>
    </head>
    <form action="index.jsp" method="POST">
        <body>
            <div class="card">
                <div class="card-body">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="inputEmail" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" name="inputPassword" placeholder="Password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <div class="Button">
                        <input type="submit" class="btn btn-primary" value="Login" name="buttonLogin" />
                    </div>
                    <div>
                        <p>Crear cuenta <a href="Registrar.jsp">aqui</a></p>
                    </div>
                </div>
            </div>
    </form>
    <%
        lTrabajador lTra = new lTrabajador();
        if (request.getParameter("buttonLogin") != null) {
            String email = request.getParameter("inputEmail");
            String password = request.getParameter("inputPassword");
            if (lTra.Login(email, password) == 1) {
                String Codigo = lTra.Codigo(email, password);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("user", email);
                sesion.setAttribute("puesto", "1");
                sesion.setAttribute("codigo", Codigo);
                sesion.setAttribute("Proeyecto", "0");
                response.sendRedirect("MenuPrincipalJefe.jsp");
            } else if (lTra.Login(email, password) >= 2 && lTra.Login(email, password) <= 11) {
                String Codigo = lTra.Codigo(email, password);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("user", email);
                sesion.setAttribute("puesto", "2");
                sesion.setAttribute("codigo", Codigo);
                sesion.setAttribute("proyecto", "0");
                response.sendRedirect("MenuPrincipalPersonal.jsp");
            } else {
    %>
    <script type="text/javascript">
        alert("Usuario no existe");
    </script>
    <%
            }
        }
        if (request.getParameter("cerrar") != null) {
            session.invalidate();
        }
    %>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!-- Personal Script -->
</body>
</html>
