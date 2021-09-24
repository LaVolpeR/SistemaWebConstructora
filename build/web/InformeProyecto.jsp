<%-- 
    Document   : InformeProyecto
    Created on : 18-sep-2021, 2:39:20
    Author     : ramir
--%>

<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page import="logico.lInforme"%>
<%@page import="datos.Informe"%>
<%@page import="datos.Cronograma"%>
<%@page import="logico.lCronograma"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <link href="css/InformeCss.css" rel="stylesheet" type="text/css"/>
        <title>Informes</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            Informe Inf = new Informe();
            lInforme lInf = new lInforme();
            lTrabajador lTra = new lTrabajador();
            String user;
            String puesto;
            String codigo;
            String proyecto = "0";

            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1") && !sesion.getAttribute("proyecto").equals("0")) {
                user = sesion.getAttribute("user").toString();
                puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
                proyecto = sesion.getAttribute("proyecto").toString();
                lPro.ListarProyectos(codigo);
            } else {
                if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("2")) {
                    response.sendRedirect("MenuPrincipalPersonal.jsp");
                    out.print("<script>location.replace('MenuPrincipalPersonal.jsp');<script>");
                } else {
                    response.sendRedirect("index.jsp");
                    out.print("<script>location.replace('index.jsp');<script>");
                }
            }
            if (request.getParameter("btnSolucion") != null) {
                lInf.InsertarSolucion(request.getParameter("Solucion"), request.getParameter("InputID"));
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
                            <a class="nav-link active" href="MenuProyecto.jsp" tabindex="-1" aria-disabled="true">MENU PROYECTO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Movimientos.jsp">Movimientos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="PlanillaProyecto.jsp">Planilla</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Cronograma.jsp">Cronograma</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Reporte.jsp">Reportes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ArchivosProyecto.jsp">Archivos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="InformeProyecto.jsp">Informes</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="card">
                <h5 class="card-header">Informes por Resolver</h5>
                <div class="card-body">
                    <div class="table-responsive">
                    <table class="table table-bordered ">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Trabajador</th>
                                <th>Titulo</th>
                                <th>Descripcion</th>
                                <th>Fecha</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                lInf.ListarInformeProyectoXEstado(proyecto, 3);
                                for (int i = 0; i < lInforme.lInf.size(); i++) {
                                    Inf = (Informe) lInforme.lInf.get(i);

                            %>
                            <tr>
                                <td><%=Inf.getID()%></td>
                                <td><%=lTra.Nombre(Inf.getTrabajadorDNI())%></td>
                                <td><%=Inf.getTitulo()%></td>
                                <td><%=Inf.getDescripcion()%></td>
                                <td><%=Inf.getFecha()%></td>
                                <td><button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#Modal<%=Inf.getID()%>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
                                        <path d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.235.235 0 0 1 .02-.022z"></path>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                        <form action="InformeProyecto.jsp" method="POST">

                            <div class="modal fade" id="Modal<%=Inf.getID()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><%=Inf.getTitulo()%></h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating"><input name="InputID"  type="hidden" value="<%=Inf.getID()%>">
                                                <textarea class="form-control" placeholder="Leave a comment here" name="Solucion" style="height: 100px"></textarea>
                                                <label for="Solucion">Solucion</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <input type="submit" class="btn btn-primary" name='btnSolucion' value='Ingresar Solucion'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                        </div>
                </div>
            </div>
            <br>
            <div class="card">
                <h5 class="card-header">Informes Resueltos</h5>
                <div class="card-body">
                    <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Trabajador</th>
                                <th>Titulo</th>
                                <th>Descripcion</th>
                                <th>Fecha</th>
                                <th>Solucion</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                lInf.ListarInformeProyectoXEstado(proyecto, 2);
                                for (int i = 0; i < lInforme.lInf.size(); i++) {
                                    Inf = (Informe) lInforme.lInf.get(i);

                            %>
                            <tr>
                                <td><%=Inf.getID()%></td>
                                <td><%=lTra.Nombre(Inf.getTrabajadorDNI())%></td>
                                <td><%=Inf.getTitulo()%></td>
                                <td><%=Inf.getDescripcion()%></td>
                                <td><%=Inf.getFecha()%></td>
                                <td><%=Inf.getSolucion()%></td>
                                <td><%=Inf.getFechasolucion()%></td>
                            </tr>

                            <%
                                }
                            %>
                        </tbody>
                    </table>
                        </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
