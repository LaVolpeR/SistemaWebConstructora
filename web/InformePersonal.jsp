<%-- 
    Document   : InformePersonal
    Created on : 18-sep-2021, 0:35:01
    Author     : ramir
--%>

<%@page import="logico.lInforme"%>
<%@page import="datos.Informe"%>
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
        <title>Informe</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            lProyecto lPro = new lProyecto();
            lTrabajador lTra = new lTrabajador();
            Informe Inf = new Informe();
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
            if (request.getParameter("btnAcabado") != null) {
                lCro.CambiarActividadXVerificar(request.getParameter("InputIDActividad"));
            }
            if (request.getParameter("btnRectificar") != null) {
                lCro.CambiarActividadEnProceso(request.getParameter("InputIDActividad"));
            }

            if (lTra.UltimoProyecto(codigo) != 0) {
                activador = "active";
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
        <div class="container">
            <div class="d-grid gap-2">
                <a class="btn btn-primary" type="button" href="CreacionInforme.jsp">Crear Informe</a>
            </div>
            <br>
            <div class="accordion  " id="accordion">
                <div class="accordion-item ">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Informes Creados
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
                        <div class="accordion-body">
                            <table class="table table-responsive ">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Titulo</th>
                                        <th>Descripcion</th>
                                        <th>Fecha</th>
                                        <th>Proyecto</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        lInf.ListarInformeDni(codigo);
                                        for (int i = 0; i < lInforme.lInf.size(); i++) {
                                            Inf = (Informe) lInforme.lInf.get(i);

                                    %>
                                    <tr>
                                        <td><%=Inf.getID()%></td>
                                        <td><%=Inf.getTitulo()%></td>
                                        <td><%=Inf.getDescripcion()%></td>
                                        <td><%=Inf.getFecha()%></td>
                                        <td><%=lPro.TituloProyecto(lTra.UltimoProyecto(codigo))%></td>
                                        <%
                                            if (Inf.getEstadoID().equalsIgnoreCase("3")) {
                                        %> 
                                        <td>Falta Resolver</td>
                                        <%
                                        } else {
                                        %> 
                                        <td>Resuelto</td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <%                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="accordion-item ">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            Informes Resueltos
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
                        <div class="accordion-body">
                            <table class="table table-responsive ">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Titulo</th>
                                        <th>Descripcion</th>
                                        <th>Fecha</th>
                                        <th>Solucion</th>
                                        <th>Fecha</th>
                                        <th>Proyecto</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        lInf.ListarInformeDni(codigo);
                                        for (int i = 0; i < lInforme.lInf.size(); i++) {
                                            Inf = (Informe) lInforme.lInf.get(i);
                                            if (Inf.getEstadoID().equals("2")) {
                                    %>
                                    <tr>
                                        <td><%=Inf.getID()%></td>
                                        <td><%=Inf.getTitulo()%></td>
                                        <td><%=Inf.getDescripcion()%></td>
                                        <td><%=Inf.getFecha()%></td>
                                        <td><%=Inf.getSolucion()%></td>
                                        <td><%=Inf.getFechasolucion()%></td>
                                        <td><%=lPro.TituloProyecto(lTra.UltimoProyecto(codigo))%></td>
                                    </tr>
                                    <%                                        }
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
