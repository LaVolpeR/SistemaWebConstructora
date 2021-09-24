<%--
    Document   : Archivos
    Created on : Aug 13, 2021, 2:16:49 AM
    Author     : ramir
--%>

<%@page import="logico.lProyecto"%>
<%@page import="logico.lArchivos"%>
<%@page import="datos.Archivo"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/ArchivosCss.css" rel="stylesheet" type="text/css"/>
        <title>Archivos</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo = "null";
            //crear un input no visible con el dni request.getParameter("InputID");
            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1")) {
                user = sesion.getAttribute("user").toString();
                puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
                sesion.setAttribute("proyecto", "0");
            } else {
                if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("2")) {
                    response.sendRedirect("MenuPrincipalPersonal.jsp");
                    out.print("<script>location.replace('MenuPrincipalPersonal.jsp');<script>");
                } else {
                    response.sendRedirect("index.jsp");
                    out.print("<script>location.replace('index.jsp');<script>");
                }
            }
            Archivo Arc = new Archivo();
            lArchivos lArc = new lArchivos();
            lArc.ListarArchivos();
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
        <input name="InputDNI"  type="hidden" value="<%=codigo%>">
        <div class="container">
            <div class="d-grid gap-2">
                <a id="mostrar" class="btn btn-outline-primary" href="ControllerPdf?action=insert&id=">Subir PDF</a>
            </div>
            <br>
            <div class="table-responsive">
                <table class="table  table-bordered">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Proyecto</th>
                            <th>Titulo</th>
                            <th>Fecha</th>
                            <th>Descripcion</th>
                            <th>Propietario</th>

                            <th colspan="2">PDF</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            lProyecto lPro = new lProyecto();
                            for (int i = 0; i < lArchivos.lArc.size(); i++) {
                                Arc = (Archivo) lArchivos.lArc.get(i);
                        %>
                        <tr>
                            <td><%=Arc.getID()%></td>
                            <td><%=lPro.TituloProyecto(Integer.parseInt(Arc.getProyecto()))%></td>
                            <td><%=Arc.getTitulo()%></td>
                            <td><%=Arc.getFecha()%></td>
                            <td><%=Arc.getDescripcion()%></td>
                            <td><%=Arc.getPropietario()%></td>
                            <td>
                                <%
                                    if (Arc.getData2() != null) {
                                %>
                                <a href="pdf?id=<%=Arc.getID()%>" target="_blank"><img src="Imagen/mpdf.png" title="pdf"/></a>

                                <%
                                    } else {
                                        out.print("Vacio");
                                    }
                                %>
                            </td>
                            <td>
                                <!--<a id="mostrar" href="ControllerPdf?action=insert&id=<%=Arc.getID()%>"> <img src="Imagen/nuevo.png" title="Nuevo registro"/></a>-
                                <a href="ControllerPdf?action=edit&id=<%=Arc.getID()%>"> <img src="Imagen/editar.png" title="Modificar"/></a>-- -->
                                <a href="ControllerPdf?action=delete&id=<%=Arc.getID()%>"> <img src="Imagen/delete.png" title="Eliminar"/></a>
                            </td>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>
                <br>
                <div class="d-grid gap-2">
                    <a type="button" class="btn btn-outline-secondary" href="MenuPrincipalJefe.jsp">REGRESAR</a>
                </div>
                <!-- <a id="mostrar" href="ControllerPdf?action=insert&id="> <img src="Imagen/nuevo.png" title="Nuevo registro"/></a>-->
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script type="text/javascript">
            function ConvertirPDF() {
                const $elementoParaConvertir = document.body; // <-- Aquí puedes elegir cualquier elemento del DOM
                html2pdf()
                        .set({
                            margin: 1,
                            filename: 'documento.pdf',
                            image: {
                                type: 'jpeg',
                                quality: 0.98
                            },
                            html2canvas: {
                                scale: 3, // A mayor escala, mejores gráficos, pero más peso
                                letterRendering: true,
                            },
                            jsPDF: {
                                unit: "in",
                                format: "a3",
                                orientation: 'portrait' // landscape o portrait
                            }
                        })
                        .from($elementoParaConvertir)
                        .save()
                        .catch(err => console.log(err));
            }

        </script>
    </body>
</html>
