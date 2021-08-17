<%--
    Document   : Planilla
    Created on : 7/08/2021, 08:57:43 PM
    Author     : ramir
--%>

<%@page import="datos.Puesto"%>
<%@page import="logico.lPuesto"%>
<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/Planilla.css" rel="stylesheet" type="text/css"/>
        <title>PLANILLA</title>
    </head>
    <body>
        <%
            Trabajador tra = new Trabajador();
            lTrabajador lTra = new lTrabajador();
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            lPuesto lPue = new lPuesto();
            Puesto pue = new Puesto();
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo;
            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1")) {
                user = sesion.getAttribute("user").toString();
                puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
                sesion.setAttribute("proyecto","0");
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

            lPue.MostrarPuestos();
            if (request.getParameter("UpdateTrabajadorPuesto") != null) {
                lPue.UpdateTrabajadorPuesto(request.getParameter("Trabjador"), request.getParameter("Puesto"));
            }
            if (request.getParameter("InsertarPlanilla") != null) {
                lPro.InsertarPlanilla(request.getParameter("Trabjador2"), request.getParameter("Planilla"));
            }

            lTra.ListarTrabajadores(1);
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
                            <a class="nav-link active" aria-current="page" href="Planilla.jsp">Trabajadores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Archivos.jsp">Documentos</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
        <form action="Planilla.jsp" method="POST">

            <div class="container">
                <div class="container2">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">DNI</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Puesto</th>
                                <th scope="col">Proyecto Asignado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%int a = 0;

                                for (int i = 0; i < lTrabajador.lTra.size(); i++) {
                                    int b = 0;
                                    a++;
                                    tra = (Trabajador) lTrabajador.lTra.get(i);
                                    b = lTra.UltimoProyecto(tra.getDNI());
                            %>
                            <tr>
                                <th scope="row"><%=a%></th>
                                <td><%=tra.getDNI()%></td>
                                <td><%=tra.getNombre()%></td>
                                <td><%=tra.getApellido()%></td>
                                <td><%=tra.getTelefono()%></td>
                                <td><%=tra.getCorreo()%></td><td>
                                    <%
                                        if (b == 0) {
                                    %>
                                    No se le asigno ningun proyecto todavia
                                    <%
                                    } else {
                                    %>
                                    <%=lPro.TituloProyecto(b)%>
                                    <%
                                        }
                                    %>

                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="container">
                    <div class="row">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Cambiar Puesto
                        </button>
                    </div>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Cambiar Puesto</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <select class="form-select" aria-label="Default select example" name="Trabjador">
                                        <option selected>Seleccione trabajador</option>
                                        <%
                                            for (int i = 0; i < lTrabajador.lTra.size(); i++) {
                                                tra = (Trabajador) lTrabajador.lTra.get(i);

                                        %>
                                        <option value="<%=tra.getDNI()%>"><%=tra.getNombre()%></option>
                                        <% }%>
                                    </select>
                                    <p>Seleccione Puesto</p>
                                    <select class="form-select" aria-label="Default select example" name="Puesto">
                                        <option selected>Seleccione Puesto de Trabajao</option>
                                        <%
                                            for (int i = 0; i < lPuesto.lPue.size(); i++) {
                                                pue = (Puesto) lPuesto.lPue.get(i);

                                        %>
                                        <option value="<%=pue.getID()%>"><%=pue.getNombre()%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" name="UpdateTrabajadorPuesto">Realizar Cambios</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                            Mover a otro Proyecto
                        </button>
                    </div>
                    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <select class="form-select" aria-label="Default select example" name="Trabjador2">
                                        <option selected>Seleccione trabajador que desea mover</option>
                                        <%
                                            for (int i = 0; i < lTrabajador.lTra.size(); i++) {
                                                tra = (Trabajador) lTrabajador.lTra.get(i);

                                        %>
                                        <option value="<%=tra.getDNI()%>"><%=tra.getNombre()%></option>
                                        <% }%>
                                    </select>
                                    <p>Selecciona un proyecto suyo</p>
                                    <select class="form-select" aria-label="Default select example" name="Planilla">
                                        <option selected>Seleccion Proyecto</option>
                                        <%
                                            for (int i = 0; i < lProyecto.lPro.size(); i++) {
                                                pro = (Proyecto) lProyecto.lPro.get(i);

                                        %>
                                        <option value="<%=pro.getID()%>"><%=lPro.TituloProyecto(Integer.parseInt(pro.getID()))%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" name="InsertarPlanilla">Realizar Transferencia</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <a type="button" class="btn btn-outline-secondary" href="MenuPrincipalJefe.jsp">Regresar</a>
                    </div>
                </div>
            </div>
        </form>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!-- Personal Script -->
    </body>
</html>
