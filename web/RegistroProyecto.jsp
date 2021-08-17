<%--
    Document   : RegistroProyecto
    Created on : 31/07/2021, 01:54:17 AM
    Author     : ramir
--%>

<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page import="java.util.Calendar"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Registro Proyecto</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo;
            //crear un input no visible con el dni request.getParameter("InputID");
            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1")) {
                user = sesion.getAttribute("user").toString();
                puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
            } else {
                if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("2")) {
                    response.sendRedirect("MenuPrincipalPersonal.jsp");
                    out.print("<script>location.replace('MenuPrincipalPersonal.jsp');<script>");
                } else {
                    response.sendRedirect("index.jsp");
                    out.print("<script>location.replace('index.jsp');<script>");
                }
            }
            Calendar c = Calendar.getInstance();
            int dia = Integer.parseInt(Integer.toString(c.get(Calendar.DATE)));
            int mes = Integer.parseInt(Integer.toString(c.get(Calendar.MONTH)));
            mes++;
            int annio = Integer.parseInt(Integer.toString(c.get(Calendar.YEAR)));
        %>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">MENU PRINCIPAL JEFE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Trabajadores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Documentos</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav> <br><br><br>
        <form action="RegistroProyecto.jsp" method="POST">
            <diV class="container">
                <div class="mb-3">
                    <label class="form-label">Nombre del Proyecto</label>
                    <input type="text" class="form-control" name="InputTitulo" >
                </div>
                <div class="mb-3">
                    <label class="form-label">Nombre del cliente</label>
                    <input type="text" class="form-control" name="InputNombreCliente" >
                </div>
                <div class="mb-3">
                    <label class="form-label">Direccion del Proyecto</label>
                    <input type="text" class="form-control" name="InputDireccion" >
                </div>
                <div class="mb-3">
                    <label class="form-label">Ingresar Fecha de Inicio</label>
                    <input type="date" class="form-control" name="InputFechaInicio" <%
                        if (mes <= 9) {
                            out.print("min='" + annio + "-0" + mes + "-" + dia + "'");
                        } else {
                            out.print("min='" + annio + "-" + mes + "-" + dia + "'");
                        }
                           %> max="2200-12-31">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ingresar Fecha de Fin de Proyecto</label>
                    <input type="date" class="form-control" name="InputFechaFin" <%
                        if (mes <= 9) {
                            out.print("min='" + annio + "-0" + mes + "-" + dia + "'");
                        } else {
                            out.print("min='" + annio + "-" + mes + "-" + dia + "'");
                        }
                           %> max="2200-12-31">
                </div>
                <div class="mb-3">
                    <label class="form-label">Descripcion del Proyecto</label>
                    <textarea class="form-control" name="InputDescripcion" rows="1"></textarea>
                </div>
                <div class="d-grid gap-2">
                    <input class="btn btn-primary" type="submit" name="CrearProyecto" value="Crear Proyecto"/>
                </div>
                <br>
                <div class="d-grid gap-2">
                    <a type="button" class="btn btn-outline-secondary" href="MenuPrincipalJefe.jsp">REGRESAR</a>
                </div>
            </div>
        </form>
        <%
            if (request.getParameter("CrearProyecto") != null) {
                Proyecto pro = new Proyecto("00",
                        request.getParameter("InputTitulo"),
                        request.getParameter("InputFechaInicio"),
                        request.getParameter("InputFechaFin"),
                        request.getParameter("InputDescripcion"),
                        request.getParameter("InputNombreCliente"),
                        request.getParameter("InputDireccion"));
                lProyecto lPro = new lProyecto();
                lPro.CrearProyecto(pro, sesion.getAttribute("codigo").toString());
                response.sendRedirect("MenuPrincipalJefe.jsp");
            }
        %>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
