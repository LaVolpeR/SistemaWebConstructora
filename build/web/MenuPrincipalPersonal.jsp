<%--
    Document   : MenuPrincipalPersonal
    Created on : 11-ago-2021, 19:41:35
    Author     : ramir
--%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Cronograma"%>
<%@page import="logico.lCronograma"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/MenuPrincipalPersonalcss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            lProyecto lPro = new lProyecto();
            String user;
            String Puesto;
            String codigo = null;
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

            lCro.ListarCronogramaPersonalXFecha(codigo);
        %>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">MENU PRINCIPAL PERSONAL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="CronogramaPersonal.jsp">Cronograma</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>

        <br><br><br>
        <div class="container">
            <%if (lCronograma.lCro.size() != 0) { %>
            <h3 class="text-center">Actividades pendientes por realizar hoy  (<%=lCronograma.lCro.size() %>)</h3>
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">

                <div class="carousel-inner">
                    <%
                        for (int i = 0; i < lCronograma.lCro.size(); i++) {
                            Cro = (Cronograma) lCronograma.lCro.get(i);
                            String HoraInicio = Cro.getHoraIncio();
                            String[] HoraI = HoraInicio.split(".0000000");
                            String part1 = HoraI[0];
                            String HoraFin = Cro.getHoraFin();
                            String[] HoraF = HoraFin.split(".0000000");
                            String part2 = HoraF[0];
                            int IDProyecto = Integer.parseInt(Cro.getProyectoId());
                            if (i == 0) {
                    %>
                    <div class="carousel-item active">       
                        <%
                        } else {
                        %> 
                        <div class="carousel-item">
                            <%
                                }
                            %>
                            <form action="MenuPrincipalPersonal.jsp" method="POST">
                                <div class="card text-center" style="background-color: #F8F9FA;">
                                    <div class="card-body" >
                                        <p class="p1"><b>Descripcion de la actividad:</b> <%=Cro.getDescripcion()%></p> 
                                        <p><b>Proyecto:</b> <%=lPro.TituloProyecto(IDProyecto)%> 


                                        </p> 
                                        <p><b>Fecha de inicio de la actividad:</b> <%=Cro.getFechaInico()%> Hora: <%=part1%></p> 
                                        <p><b>Fecha de culminacion de la actividad:</b> <%=Cro.getFechaFin()%> Hora: <%=part2%></p>
                                        <div class="d-grid gap-2">
                                            <input name="InputIDActividad"  type="hidden" value="<%=Cro.getID()%>">  
                                            <%if (Cro.getEstadoId().equals("1")) {


                                            %>
                                            <input type="submit" class="btn btn-primary" value="Acabado" name="btnAcabado" />
                                            <% }%>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%
                            }

                        %>
                    </div>
                    <%                    if (lCronograma.lCro.size() != 1) {
                    %>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <%
                        }
                    %>
                </div>
                <%                    }

                %>
                <br>
                <div class="accordion  " id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Actividades Por Realizar
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <%                                lCro.MostrarCronogramaXDni(codigo);
                                    for (int i = 0; i < lCronograma.lCro.size(); i++) {
                                        Cro = (Cronograma) lCronograma.lCro.get(i);
                                        if (Cro.getEstadoId().equals("1")) {
                                %>
                                <form action="MenuPrincipalPersonal.jsp" method="POST">  
                                    <%
                                        String HoraInicio = Cro.getHoraIncio();
                                        String[] HoraI = HoraInicio.split(".0000000");
                                        String part1 = HoraI[0];
                                        String HoraFin = Cro.getHoraFin();
                                        String[] HoraF = HoraFin.split(".0000000");
                                        String part2 = HoraF[0];
                                        int IDProyecto = Integer.parseInt(Cro.getProyectoId());
                                    %>
                                    <div class="card">
                                        <div class="card-header">
                                            Actividad #<%=Cro.getID()%> - <%=Cro.getTitulo()%>
                                        </div>
                                        <div class="card-body">
                                            <p><b>Descripcion de la actividad:</b> <%=Cro.getDescripcion()%></p> 
                                            <p><b>Proyecto:</b> <%=lPro.TituloProyecto(IDProyecto)%></p>
                                            <p><b>Fecha de inicio de la actividad:</b> <%=Cro.getFechaInico()%> Hora: <%=part1%></p> 
                                            <p><b>Fecha de culminacion de la actividad:</b> <%=Cro.getFechaFin()%> Hora: <%=part2%></p>
                                            <div class="d-grid gap-2">
                                                <input name="InputIDActividad"  type="hidden" value="<%=Cro.getID()%>">  
                                                <input type="submit" class="btn btn-primary" value="Acabado" name="btnAcabado" />
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </form>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Actividades por Revisar
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <%                                for (int i = 0; i < lCronograma.lCro.size(); i++) {
                                        Cro = (Cronograma) lCronograma.lCro.get(i);

                                        if (Cro.getEstadoId().equals("3")) {
                                %>
                                <form action="MenuPrincipalPersonal.jsp" method="POST">

                                    <%
                                        String HoraInicio = Cro.getHoraIncio();
                                        String[] HoraI = HoraInicio.split(".0000000");
                                        String part1 = HoraI[0];
                                        String HoraFin = Cro.getHoraFin();
                                        String[] HoraF = HoraFin.split(".0000000");
                                        String part2 = HoraF[0];
                                        int IDProyecto = Integer.parseInt(Cro.getProyectoId());
                                    %>
                                    <div class="card">
                                        <div class="card-header">
                                            Actividad #<%=Cro.getID()%> - <%=Cro.getTitulo()%>
                                        </div>
                                        <div class="card-body">
                                            <p><b>Descripcion de la actividad:</b> <%=Cro.getDescripcion()%></p> 
                                            <p><b>Proyecto:</b> <%=lPro.TituloProyecto(IDProyecto)%></p>
                                            <p><b>Fecha de inicio de la actividad:</b> <%=Cro.getFechaInico()%> Hora: <%=part1%></p> 
                                            <p><b>Fecha de culminacion de la actividad:</b><%=Cro.getFechaFin()%> Hora: <%=part2%></p> 
                                            <div class="d-grid gap-2">
                                                <input name="InputIDActividad"  type="hidden" value="<%=Cro.getID()%>">  
                                                <input type="submit" class="btn btn-primary" value="Rectificar" name="btnRectificar" />
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </form>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Actividades Terminadas
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                            </div>
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
