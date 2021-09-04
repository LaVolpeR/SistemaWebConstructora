<%-- 
    Document   : MenuProyecto
    Created on : 2/08/2021, 05:07:50 PM
    Author     : ramir
--%>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        

        <link href="css/maincss.css" rel="stylesheet" type="text/css"/>
        <title>Menu Proyecto</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            String user;
            String puesto;
            String codigo;
            String proyecto = "0";
            String ID_Proyecto = "null";
            ;
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
            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                if (action.equals("editar")) {

                }
                if (action.equals("validar")) {
                    lCro.CambiarActividadCompletado(request.getParameter("id"));
                }
                if (action.equals("eliminar")) {

                }
            }

            lCro.MostrarCronogramaXProyectoXEstado(proyecto, "3");
        %>

        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">MENU PROYECTO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Cotizacion.jsp">Cotizacion</a>
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
                            <a class="nav-link active" aria-current="page" href="#">Archivos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Informes</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
        <div class="Contenedor">
            <div class="items">
                <h1 class="text-center">Bienvenido al <%=lPro.TituloProyecto(Integer.parseInt(proyecto))%></h1>
            </div>
            <% if(lCronograma.lCro.size()!=0){
            %>
                <div class="items">
                    <h3 class="text-center">Actividades Por revisar (<%=lCronograma.lCro.size() %>)</h3>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">#</th>
                                    <th scope="col" class="text-center">Titulo</th>
                                    <th scope="col" class="text-center">Descripcion</th>
                                    <th scope="col" class="text-center">Inicio</th>
                                    <th scope="col" class="text-center">Fin</th>
                                    <th scope="col" colspan="3" class="text-center">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
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
                                %>
                                <tr>
                                    <th scope="row">1</th>
                                    <td><%=Cro.getTitulo()%></td>
                                    <td>
                                        <a  type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">Presione Aqui</a>
                                        <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
                                            <div class="offcanvas-header">
                                                <h5 class="offcanvas-title" id="offcanvasBottomLabel">Descricion</h5>
                                                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                            </div>
                                            <div class="offcanvas-body small">
                                                <p><%=Cro.getDescripcion()%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td><%=Cro.getFechaInico()%> / <%=part1%></td>
                                    <td><%=Cro.getFechaFin()%> / <%=part2%></td>
                                    <td><a type="button" href="MenuProyecto.jsp?action=editar&id=<%=Cro.getID()%>"> <img src="Imagen/pencil-square.svg" title="Editar"/></a></td>
                                    <td><a type="button" href="MenuProyecto.jsp?action=validar&id=<%=Cro.getID()%>"> <img src="Imagen/check-square.svg" title="Validar"/></a></td>
                                    <td><a type="button" href="MenuProyecto.jsp?action=eliminar&id=<%=Cro.getID()%>"> <img src="Imagen/x-square.svg" title="Eliminar"/></a></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
               
            </div>
                           <% }%>
            <div class="items">
                <a id="mostrar" class="btn btn-outline-primary" href="ControllerPdf?action=insertMovimiento&id=">Registrar Movimiento</a>
                <br><br>
                <a id="Actividad" class="btn btn-outline-primary" href="Actividad.jsp">Ingresar Actividad</a>
            <br><br>
                <a class="btn btn-primary" type="button" href="MenuPrincipalJefe.jsp">Regresar</a>
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
