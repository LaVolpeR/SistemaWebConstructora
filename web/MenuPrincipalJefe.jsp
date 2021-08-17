<%--
    Document   : MenuPrincipalJefe
    Created on : 24/07/2021, 01:00:09 AM
    Author     : ramir
--%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/CardCss.css" rel="stylesheet" type="text/css"/>
        <title>Menu Principal Jefe</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo;
            String proyecto;
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
            
        %>
        <!-- Navbar -->

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
        <!-- Contenedor de Proyectos -->
        <div class="BotonAgregar">
            <a id="AgregarProyecto" type="button" class="btn btn-outline-success" href="RegistroProyecto.jsp">Crear</a>
        </div>
        <div class="Contenedor">
            <%            for (int i = 0; i < lProyecto.lPro.size(); i++) {
                    pro = (Proyecto) lProyecto.lPro.get(i);
            %>
            <form action="MenuProyecto.jsp" method="POST">

                <input name="InputProyecto"  type="hidden" value="<%=pro.getID()%>">  
                <!-- Proyectos -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Proyecto #<%=pro.getID()%></h4>
                        <p class="card-text"> <%=pro.getDescripcion()%></p>
                    </div>
                    <div class="card-body">
                        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%=pro.getID()%>" ><!-- Identificador -->
                            Informacion de Proyecto #<%=pro.getID()%>
                        </button>
                        <button type="submit" class="btn btn-outline-primary" name="IngresarProyecto">Ingresar</button>
                    </div>
                </div>
            </form>
            <%
                }
            %>
        </div>
        <!-- Modal -->
        <%            for (int i = 0; i < lProyecto.lPro.size(); i++) {
                pro = (Proyecto) lProyecto.lPro.get(i);
        %>
        <div class="modal fade" id="staticBackdrop<%=pro.getID()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel"><%=pro.getTitulo()%></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Contenido Texto -->
                        Nombre del Cliente : <%=pro.getNombreCliente()%>
                        <br>
                        Direccion : <%=pro.getDireccion()%>
                        <br>
                        Fecha de Inicio : <%=pro.getFechaInicio()%>
                        <br>
                        Fecha de fin : <%=pro.getFechaFin()%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
