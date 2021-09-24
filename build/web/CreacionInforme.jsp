<%-- 
    Document   : CreacionInforme
    Created on : 18-sep-2021, 0:52:56
    Author     : ramir
--%>

<%@page import="logico.lInforme"%>
<%@page import="logico.lTrabajador"%>
<%@page import="logico.lPlanilla"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Cronograma"%>
<%@page import="logico.lCronograma"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/InformeCss.css" rel="stylesheet" type="text/css"/>
        <title>Creacion Informe</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            lProyecto lPro = new lProyecto();
            lTrabajador lTra = new lTrabajador();
            lInforme lInf = new lInforme();
            String user;
            String Puesto;
            String codigo = null;
            String activador = "disabled";
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
            if (lTra.UltimoProyecto(codigo) != 0) {
                activador = "active";
            }
            if (request.getParameter("CrearInforme") != null) {
                lInf.InsertarInforme(request.getParameter("Titulo"),
                        request.getParameter("Descripcion"),
                        codigo, lTra.UltimoProyecto(codigo));
                response.sendRedirect("InformePersonal.jsp");
            }
        %>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="MenuPrincipalPersonal.jsp" tabindex="-1" aria-disabled="true">MENU PRINCIPAL PERSONAL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="CronogramaPersonal.jsp">Cronograma</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%=activador%>" aria-current="page" href="InformePersonal.jsp">Informe</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
        <form action="CreacionInforme.jsp" method="POST">

            <div class="container">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="Titulo" placeholder="Tittle">
                    <label for="floatingInput">Problema</label>
                </div>
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Leave a comment here" name="Descripcion" style="height: 200px"></textarea>
                    <label for="floatingTextarea2">Descripcion</label>
                </div>
                <br>
                <div class="d-grid gap-2">
                    <input class="btn btn-primary" type="submit" name="CrearInforme" value="Crear Informe"/>
                </div>
            </div>
        </form>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
