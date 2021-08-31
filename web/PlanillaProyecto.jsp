<%-- 
    Document   : PlanillaProyecto
    Created on : 20-ago-2021, 1:20:55
    Author     : ramir
--%>

<%@page import="datos.Trabajador"%>
<%@page import="logico.lTrabajador"%>
<%@page import="datos.Planilla"%>
<%@page import="logico.lPlanilla"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        

        <title>JSP Page</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            lPlanilla lPla = new lPlanilla();
            Planilla Pla = new Planilla();
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo;
            String proyecto = "0";
            String ID_Proyecto = "null";
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
            lPla.ListarDNIUltFecha();
            lTrabajador lTra = new lTrabajador();
            Trabajador Tra = new Trabajador();
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
                            <a class="nav-link active" aria-current="page" href="Cotizacion.jsp">Cotizacion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="PlanillaProyecto.jsp">Planilla</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Cronograma.jsp">Cronograma</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Reportes</a>
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
        <br><br><br>
        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">DNI</th>
                        <th scope="col">Nombre Completo</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Puesto</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        lTra.ListarTrabajadores(1);
                        int a = 0;
                        int b = 0;
                        for (int i = 0; i < lTrabajador.lTra.size(); i++) {
                            Tra = (Trabajador) lTrabajador.lTra.get(i);
                            b = lTra.UltimoProyecto(Tra.getDNI());
                            if (b == Integer.parseInt(proyecto)) {
                                a++;
                    %>
                    <tr>
                        <th><%=a%></th>
                        <td><%=Tra.getDNI()%></td>
                        <td><%=Tra.getNombre()%></td>
                        <td><%=Tra.getApellido()%></td>
                        <td><%=Tra.getTelefono()%></td>
                        <td><%=Tra.getCorreo()%></td>

                    </tr>
                    <%

                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
