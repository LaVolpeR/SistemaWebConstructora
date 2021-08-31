<%--
    Document   : GuardarPDF
    Created on : 13-ago-2021, 0:15:35
    Author     : ramir
--%>

<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page import="java.io.InputStream"%>
<%@page import="datos.Archivo"%>
<%@page import="logico.lArchivos"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo = "";
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();

            //crear un input no visible con el dni request.getParameter("InputID");
            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1")) {
                user = sesion.getAttribute("user").toString();
                puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
                lPro.ListarProyectos(codigo);
                sesion.setAttribute("proyecto","0");
            } else {
                if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("2")) {
                    response.sendRedirect("MenuPrincipalPersonal.jsp");
                    out.print("<script>location.replace('MenuPrincipalPersonal.jsp');<script>");
                } else {
                    response.sendRedirect("index.jsp");
                    out.print("<script>location.replace('index.jsp');<script>");
                }
            }

            Integer dato = 0;
            try {
                Archivo arc = (Archivo) request.getAttribute("row");
                dato = arc.getID();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row2");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
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
        <br><br><br>

        <form name="formpdf" action="ControllerPdf" method="post" enctype="multipart/form-data">
            <input name="InputDNI"  type="hidden" value="<%=codigo%>">
            <diV class="container">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="InputTitulo" >
                    <label for="floatingInput">Nombre del archivo</label>
                </div>
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Leave a comment here" name="InputDescripcion" style="height: 100px"></textarea>
                    <label for="floatingTextarea2">Descripcion</label>
                </div>
                <br>
                <div class="mb-3">
                    <select class="form-select" aria-label="Default select example" name="InputID">
                        <%

                            for (int i = 0; i < lProyecto.lPro.size(); i++) {
                                pro = (Proyecto) lProyecto.lPro.get(i);
                        %>
                        <option value="<%=pro.getID()%>"><%=lPro.TituloProyecto(Integer.parseInt(pro.getID()))%></option>
                        <%
                            }
                        %>


                    </select>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label">Insertar PDF</label>
                    <input class="form-control" type="file" name="formFile">
                </div>
                <div class="d-grid gap-2">
                    <input class="btn btn-primary" type="submit" name="GuardarPDF" value="Guardar PDF"/>
                </div>
                <br>
                <div class="d-grid gap-2">
                    <a type="button" class="btn btn-outline-secondary" href="Archivos.jsp">REGRESAR</a>
                </div>
            </diV>
        </form>

        <%
        %>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
