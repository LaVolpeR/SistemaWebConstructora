<%-- 
    Document   : ReporteActividad
    Created on : 04-sep-2021, 3:37:31
    Author     : ramir
--%>

<%@page import="datos.Chart"%>
<%@page import="java.util.Calendar"%>
<%@page import="logico.lChart"%>
<%@page import="logico.lDatosTemporales"%>
<%@page import="datos.DatosTemporales"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="js/html2pdf.bundle.min.js" type="text/javascript"></script>
        <link href="css/Reportecss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            DatosTemporales DatTem = new DatosTemporales();
            lDatosTemporales lDatTem = new lDatosTemporales();
            String user;
            String puesto;
            String codigo;
            String proyecto = "0";
            String ID_Proyecto = "null";
            String ReporteMes = null;
            String opcion1 = null;
            String opcion2 = null;
            String opcion3 = null;
            String opcion4 = null;
            String opcion5 = null;
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
                opcion1 = request.getParameter("Dia");
                opcion2 = request.getParameter("Semana");
                opcion3 = request.getParameter("Mes");
                opcion4 = request.getParameter("Annio");
                opcion5 = request.getParameter("DNITrabajador");
            } else {
                response.sendRedirect("Reporte.jsp");
            }

            //http://localhost:8080/SistemaWebConstructoraTesis1.1/ReporteActividad.jsp
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

        <div class="container">
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <button type="button" class="btn btn-outline-danger" onclick="ConvertirPDF()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-pdf" viewBox="0 0 16 16">
                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"></path>
                        <path d="M4.603 14.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.697 19.697 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.188-.012.396-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.066.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.712 5.712 0 0 1-.911-.95 11.651 11.651 0 0 0-1.997.406 11.307 11.307 0 0 1-1.02 1.51c-.292.35-.609.656-.927.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.266.266 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.71 12.71 0 0 1 1.01-.193 11.744 11.744 0 0 1-.51-.858 20.801 20.801 0 0 1-.5 1.05zm2.446.45c.15.163.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.876 3.876 0 0 0-.612-.053zM8.078 7.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z"></path>
                        </svg>
                        Convertir PDF
                    </button>
                </li>
            </ul>
            <br>
            <div class="ImpresionPDF" id="ImpresionPDF">
                <h3 class="text-center">Reporte de Actividades del  <%=lPro.TituloProyecto(Integer.parseInt(proyecto))%></h3>
                <br>

                <div class="Actividades">
                    <%
                        if (opcion1 != null) {
                    %>
                    <div class="Dia">
                        <div class="card">
                            <h4 class="card-header">Actividades del dia de Hoy </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Fecha Inicio</th>
                                            <th scope="col">Fecha Fin</th>
                                            <th scope="col">Responsable</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            lDatTem.ListarReporteActividadDia(proyecto);
                                            int a = 0;
                                            for (int i = 0; i < lDatosTemporales.lDatTem.size(); i++) {
                                                DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(i);
                                                a++;
                                        %>
                                        <tr>
                                            <td><%=a%></td>
                                            <td><%=DatTem.getDato()%></td>
                                            <td><%=DatTem.getDato1()%></td>
                                            <td><%=DatTem.getDato2()%></td>
                                            <td><%=DatTem.getDato3()%></td>
                                            <td><%=DatTem.getDato4()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Actividades del dia de Hoy - En Proceso </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Fecha Inicio</th>
                                            <th scope="col">Fecha Fin</th>
                                            <th scope="col">Responsable</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            lDatTem.sp_ListarReporteActividadDia(proyecto, "1");
                                            a = 0;
                                            if (lDatosTemporales.lDatTem.size() != 0) {
                                                for (int i = 0; i < lDatosTemporales.lDatTem.size(); i++) {
                                                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(i);
                                                    a++;
                                        %>
                                        <tr>
                                            <td><%=a%></td>
                                            <td><%=DatTem.getDato()%></td>
                                            <td><%=DatTem.getDato1()%></td>
                                            <td><%=DatTem.getDato2()%></td>
                                            <td><%=DatTem.getDato3()%></td>
                                            <td><%=DatTem.getDato4()%></td>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <tr>
                                            <td colspan="6"><p class="text-center">No hay Actividades en Procesos</p></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Actividades del dia de Hoy - Por Verificar </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Fecha Inicio</th>
                                            <th scope="col">Fecha Fin</th>
                                            <th scope="col">Responsable</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            lDatTem.sp_ListarReporteActividadDia(proyecto, "3");
                                            a = 0;
                                            if (lDatosTemporales.lDatTem.size() != 0) {
                                                for (int i = 0; i < lDatosTemporales.lDatTem.size(); i++) {
                                                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(i);
                                                    a++;
                                        %>
                                        <tr>
                                            <td><%=a%></td>
                                            <td><%=DatTem.getDato()%></td>
                                            <td><%=DatTem.getDato1()%></td>
                                            <td><%=DatTem.getDato2()%></td>
                                            <td><%=DatTem.getDato3()%></td>
                                            <td><%=DatTem.getDato4()%></td>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <tr>
                                            <td colspan="6"><p class="text-center">No hay Actividades Pro Verificar</p></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Actividades del dia de Hoy - Completadas </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Fecha Inicio</th>
                                            <th scope="col">Fecha Fin</th>
                                            <th scope="col">Responsable</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            lDatTem.sp_ListarReporteActividadDia(proyecto, "2");
                                            a = 0;
                                            if (lDatosTemporales.lDatTem.size() != 0) {
                                                for (int i = 0; i < lDatosTemporales.lDatTem.size(); i++) {
                                                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(i);
                                                    a++;
                                        %>
                                        <tr>
                                            <td><%=a%></td>
                                            <td><%=DatTem.getDato()%></td>
                                            <td><%=DatTem.getDato1()%></td>
                                            <td><%=DatTem.getDato2()%></td>
                                            <td><%=DatTem.getDato3()%></td>
                                            <td><%=DatTem.getDato4()%></td>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <tr>
                                            <td colspan="6"><p class="text-center">No hay Actividades Completadas</p></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="html2pdf__page-break"></div>
                    <%
                        }
                        if (opcion2 != null) {
                            Chart Cha = new Chart();
                            lChart lCha = new lChart();
                            Calendar c = Calendar.getInstance();
                            int dia = Integer.parseInt(Integer.toString(c.get(Calendar.DATE)));
                            int mes = Integer.parseInt(Integer.toString(c.get(Calendar.MONTH)));
                            int annio = Integer.parseInt(Integer.toString(c.get(Calendar.YEAR)));
                            mes++;
                            lCha.ListarGastoSemana(annio, mes, dia);
                            int b = lChart.lCha.size() - 1;
                    %>
                    <div class="Semana">
                        <div class="card">
                            <h4 class="card-header">Actividades de la Semana </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Fecha Inicio</th>
                                            <th scope="col">Fecha Fin</th>
                                            <th scope="col">Responsable</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = b; i >= 0; i--) {
                                                Cha = (Chart) lChart.lCha.get(i);
                                                lDatTem.ListarReporteActividadSemana(Cha.getAnnio(), Cha.getMes(), Cha.getDia(), proyecto);
                                                for (int j = 0; j < lDatosTemporales.lDatTem.size(); j++) {
                                                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(j);
                                        %>
                                        <tr>
                                            <td><%=i%></td>
                                            <td><%=DatTem.getDato()%></td>
                                            <td><%=DatTem.getDato1()%></td>
                                            <td><%=DatTem.getDato2()%></td>
                                            <td><%=DatTem.getDato3()%></td>
                                            <td><%=DatTem.getDato4()%></td>
                                        </tr>
                                        <%                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="html2pdf__page-break"></div>
                    <%
                        }
                    %>


                </div>
            </div>
            <%=opcion1%>
            <%=opcion2%>
            <%=opcion3%>
            <%=opcion4%>
            <%=opcion5%>
        </div>
        <style type="text/css">
            table { page-break-inside:auto }
            tr    { page-break-inside:avoid; page-break-after:auto }
        </style>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script type="text/javascript">
                        function ConvertirPDF() {
                            const $elementoParaConvertir = document.querySelector("#ImpresionPDF"); // <-- Aquí puedes elegir cualquier elemento del DOM
                            html2pdf()
                                    .set({
                                        margin: 10,
                                        filename: 'Reporte de Actividades.pdf',
                                        image: {
                                            type: 'jpeg',
                                            quality: 0.98
                                        },
                                        html2canvas: {
                                            scale: 3, // A mayor escala, mejores gráficos, pero más peso
                                            letterRendering: true,
                                        },
                                        jsPDF: {
                                            unit: "mm",
                                            format: "a4",
                                            orientation: 'portrait' // landscape o portrait
                                        }
                                    })
                                    .from($elementoParaConvertir)
                                    .save()
                                    .catch(err => console.log(err));
                        }
                        ;
        </script>
    </body>
</html>
