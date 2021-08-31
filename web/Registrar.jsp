<%--
    Document   : Registrar
    Created on : 23/07/2021, 04:23:40 PM
    Author     : ramir
--%>
<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/maincss.css" rel="stylesheet" type="text/css"/>
        <title>REGISTRAR</title>
    </head>
    <body>
        <form name="Envio" action="Registrar.jsp">
            <%
                lTrabajador lTra = new lTrabajador();
                if (request.getParameter("CrearUsuario") != null) {
                    Trabajador tra = new Trabajador(request.getParameter("inputDNI"),
                            request.getParameter("inputNombre"),
                            request.getParameter("inputApellido"),
                            request.getParameter("inputTelefono"),
                            request.getParameter("inputEmail"),
                            request.getParameter("inputPassword"));
                    lTra.RegistrarTrabajador(tra);
                    response.sendRedirect("index.jsp");
                }
            %>

            <div class="contenedor">
                <div class="form-floating">
                    <input type="text" class="form-control" name="inputDNI" placeholder="12345678" required="" >
                    <label for="inputDNI">DNI</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" name="inputNombre" placeholder="name" required="">
                    <label for="inputNombre">Nombre</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" name="inputApellido" placeholder="surname" required="">
                    <label for="inputApellido">Apellido</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" name="inputTelefono" placeholder="surname" required="">
                    <label for="inputTelefono">Telefono</label>
                </div>
                <div class="form-floating">
                    <input type="email" class="form-control" name="inputEmail" placeholder="name@example.com" required="">
                    <label for="inputEmail">Correo</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" name="inputPassword" placeholder="password" required="">
                    <label for="inputDNI">Contraseña</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" name="inputPasswordRepeat" placeholder="password" required="">
                    <label for="inputPasswordRepeat">Repetir Contraseña</label>
                </div>
                <div class="Button">
                    <input class="btn btn-primary" type="submit" value="Crear Usuario"  name="CrearUsuario" />
                </div>
                <div class="Button">
                    <a type="submit" class="btn btn-primary" href="index.jsp" name="buttonRegresar" >Regresar</a>
                </div>
            </div>
        </form>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
