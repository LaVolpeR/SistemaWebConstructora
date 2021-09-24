<%-- 
    Document   : ReporteMovimientos
    Created on : 12-sep-2021, 1:59:54
    Author     : ramir
--%>

<%@page import="datos.DatosTemporales"%>
<%@page import="logico.lDatosTemporales"%>
<%@page import="logico.lMovimiento"%>
<%@page import="datos.Movimiento"%>
<%@page import="logico.lChart"%>
<%@page import="java.util.Calendar"%>
<%@page import="logico.lProyecto"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
                        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="js/html2pdf.bundle.min.js" type="text/javascript"></script>
        <link href="css/Reportecss.css" rel="stylesheet" type="text/css"/>
        <title>Reporte Movimiento</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            lProyecto lPro = new lProyecto();
            lChart lCha = new lChart();
            Movimiento Mov = new Movimiento();
            lMovimiento lMov = new lMovimiento();
            lDatosTemporales lDatTem = new lDatosTemporales();
            DatosTemporales DatTem = new DatosTemporales();
            Calendar c = Calendar.getInstance();
            int dia = Integer.parseInt(Integer.toString(c.get(Calendar.DATE)));
            int mes = Integer.parseInt(Integer.toString(c.get(Calendar.MONTH)));
            int annio = Integer.parseInt(Integer.toString(c.get(Calendar.YEAR)));
            mes++;
            int DiasMes = lCha.DiasTotalMes(mes, annio);

            String opcion1 = null;
            String opcion2 = null;
            String opcion3 = null;
            String opcion4 = null;
            String opcion5 = null;
            String user;
            String puesto;
            String codigo;
            String proyecto = "0";
            int a = 0;
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
                opcion1 = request.getParameter("Mes");
                opcion2 = request.getParameter("Semana");
                opcion3 = request.getParameter("Annio");
                opcion4 = request.getParameter("AnnioFactura");
                opcion5 = request.getParameter("Total");
            }
            float MoneyTotal = 0;
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
                
                <h3 class="text-center">Reporte de Movimientos del  <%=lPro.TituloProyecto(Integer.parseInt(proyecto))%></h3>
                <br>
                <div class="Movimientos">
                    <%
                        if (opcion1 != null) {
                    %>
                    <div class="mes">
                        <div class="card">
                            <h4 class="card-header">Reporte Del Mes </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                            <th>Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            a = 0;
                                            lMov.MostrarMovimientoMes(proyecto, mes, annio);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {
                                                a++;
                                                String Tipo = "Nulo";
                                                Mov = (Movimiento) lMovimiento.lMov.get(i);
                                                if (Mov.getID().equalsIgnoreCase("1")) {
                                                    Tipo = "Ingreso";
                                                }
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    Tipo = "Gasto";
                                                }
                                                float Money = Float.parseFloat(Mov.getMoney());
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                            <td><%=Tipo%></td>
                                        </tr>

                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Del Mes - Ingresos </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            a = 0;
                                            lMov.MostrarMovimientoMes(proyecto, mes, annio);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {

                                                Mov = (Movimiento) lMovimiento.lMov.get(i);

                                                float Money = Float.parseFloat(Mov.getMoney());
                                                if (Mov.getID().equalsIgnoreCase("1")) {
                                                    a++;
                                        %>
                                        <tr>
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>

                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Del Mes - Gastos </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            a = 0;
                                            lMov.MostrarMovimientoMes(proyecto, mes, annio);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {

                                                Mov = (Movimiento) lMovimiento.lMov.get(i);

                                                float Money = Float.parseFloat(Mov.getMoney());
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    a++;
                                        %>
                                        <tr>
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>

                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Del Mes - Gastos (facturas)</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            a = 0;
                                            lMov.MostrarMovimientoMes(proyecto, mes, annio);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {

                                                Mov = (Movimiento) lMovimiento.lMov.get(i);

                                                float Money = Float.parseFloat(Mov.getMoney());
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    if (!Mov.getRUC().equalsIgnoreCase("           ") && !Mov.getRazonSocial().equalsIgnoreCase("")) {

                                                        a++;
                                        %>
                                        <tr>
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>


                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>

                                        </tr>
                                        <%
                                                        MoneyTotal += Money;
                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>
                                    <caption>Gasto Total a Facturar S/. <%=(double) Math.round(MoneyTotal * 100d) / 100%></caption>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                    </div>
                    <%
                        }
                        if (opcion2 != null) {
                    %>
                    <div class="Semana">
                        <div class="card">
                            <h4 class="card-header">Reporte de la Semana </h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">Razon Social</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            a = 0;
                                            for (int i = 0; i <= 6; i++) {

                                                lMov.MostrarMovimientoSemana(lDatTem.MostrarFechaSemana(i),proyecto);

                                                for (int j = 0; j < lMovimiento.lMov.size(); j++) {
                                                    a++;

                                                    Mov = (Movimiento) lMovimiento.lMov.get(j);
                                                    String Tipo = null;

                                                    if (Mov.getID().equalsIgnoreCase("1")) {
                                                        Tipo = "Ingreso";
                                                    }
                                                    if (Mov.getID().equalsIgnoreCase("2")) {
                                                        Tipo = "Gasto";
                                                    }
                                                    Float Money = Float.parseFloat(Mov.getMoney());
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                            <td><%=Tipo%></td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte de la Semana - Ingresos</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">Razon Social</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            a = 0;
                                            for (int i = 0; i <= 6; i++) {

                                                lMov.MostrarMovimientoSemana(lDatTem.MostrarFechaSemana(i),proyecto);

                                                for (int j = 0; j < lMovimiento.lMov.size(); j++) {
                                                    a++;

                                                    Mov = (Movimiento) lMovimiento.lMov.get(j);

                                                    if (Mov.getID().equalsIgnoreCase("1")) {

                                                        Float Money = Float.parseFloat(Mov.getMoney());
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                        </tr>
                                        <%
                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte de la Semana - Gastos</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">Razon Social</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            a = 0;
                                            for (int i = 0; i <= 6; i++) {

                                                lMov.MostrarMovimientoSemana(lDatTem.MostrarFechaSemana(i),proyecto);

                                                for (int j = 0; j < lMovimiento.lMov.size(); j++) {
                                                    a++;

                                                    Mov = (Movimiento) lMovimiento.lMov.get(j);
                                                    if (Mov.getID().equalsIgnoreCase("2")) {

                                                        Float Money = Float.parseFloat(Mov.getMoney());
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>

                                        </tr>
                                        <%
                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                    </div>
                    <%
                        }
                        if (opcion3 != null) {
                    %>
                    <div class="Annio">
                        <div class="card">
                            <h4 class="card-header">Reporte Del Año</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                            <th>Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 1; i <= 12; i++) {
                                                a = 0;
                                                String MesDescripcion = null;
                                                switch (i) {
                                                    case 1:
                                                        MesDescripcion = "Enero";
                                                        break;
                                                    case 2:
                                                        MesDescripcion = "Febrero";
                                                        break;
                                                    case 3:
                                                        MesDescripcion = "Marzo";
                                                        break;
                                                    case 4:
                                                        MesDescripcion = "Abril";
                                                        break;
                                                    case 5:
                                                        MesDescripcion = "Mayo";
                                                        break;
                                                    case 6:
                                                        MesDescripcion = "Junio";
                                                        break;
                                                    case 7:
                                                        MesDescripcion = "Julio";
                                                        break;
                                                    case 8:
                                                        MesDescripcion = "Agosto";
                                                        break;
                                                    case 9:
                                                        MesDescripcion = "Septiembre";
                                                        break;
                                                    case 10:
                                                        MesDescripcion = "Octubre";
                                                        break;
                                                    case 11:
                                                        MesDescripcion = "Noviembre";
                                                        break;
                                                    case 12:
                                                        MesDescripcion = "Diciembre";
                                                        break;
                                                    default:
                                                }
                                                lMov.MostrarMovimientoAnnio(proyecto, i);
                                        %> 
                                        <tr>
                                            <th colspan="9"><%=MesDescripcion%></th>
                                        </tr>
                                        <%
                                            if (lMovimiento.lMov.size() == 0) {
                                        %> 
                                        <tr>
                                            <td colspan="9">No hay registro de movimientos</td>
                                        </tr>
                                        <%
                                        } else {
                                            for (int j = 0; j < lMovimiento.lMov.size(); j++) {
                                                a++;
                                                String Tipo = "Nulo";
                                                Mov = (Movimiento) lMovimiento.lMov.get(j);
                                                if (Mov.getID().equalsIgnoreCase("1")) {
                                                    Tipo = "Ingreso";
                                                }
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    Tipo = "Gasto";
                                                }
                                                float Money = Float.parseFloat(Mov.getMoney());
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                            <td><%=Tipo%></td>
                                        </tr>

                                        <%
                                                    }
                                                }

                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Del Año - Ingresos</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 1; i <= 12; i++) {
                                                a = 0;
                                                String MesDescripcion = null;
                                                switch (i) {
                                                    case 1:
                                                        MesDescripcion = "Enero";
                                                        break;
                                                    case 2:
                                                        MesDescripcion = "Febrero";
                                                        break;
                                                    case 3:
                                                        MesDescripcion = "Marzo";
                                                        break;
                                                    case 4:
                                                        MesDescripcion = "Abril";
                                                        break;
                                                    case 5:
                                                        MesDescripcion = "Mayo";
                                                        break;
                                                    case 6:
                                                        MesDescripcion = "Junio";
                                                        break;
                                                    case 7:
                                                        MesDescripcion = "Julio";
                                                        break;
                                                    case 8:
                                                        MesDescripcion = "Agosto";
                                                        break;
                                                    case 9:
                                                        MesDescripcion = "Septiembre";
                                                        break;
                                                    case 10:
                                                        MesDescripcion = "Octubre";
                                                        break;
                                                    case 11:
                                                        MesDescripcion = "Noviembre";
                                                        break;
                                                    case 12:
                                                        MesDescripcion = "Diciembre";
                                                        break;
                                                    default:
                                                }
                                                lMov.MostrarMovimientoAnnio(proyecto, i);
                                        %> 
                                        <tr>
                                            <th colspan="8"><%=MesDescripcion%></th>
                                        </tr>
                                        <%

                                            for (int j = 0; j < lMovimiento.lMov.size(); j++) {

                                                Mov = (Movimiento) lMovimiento.lMov.get(j);
                                                if (Mov.getID().equalsIgnoreCase("1")) {
                                                    a++;
                                                    float Money = Float.parseFloat(Mov.getMoney());
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                        </tr>

                                        <%

                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Del Año - Gastos</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 1; i <= 12; i++) {
                                                a = 0;
                                                String MesDescripcion = null;
                                                switch (i) {
                                                    case 1:
                                                        MesDescripcion = "Enero";
                                                        break;
                                                    case 2:
                                                        MesDescripcion = "Febrero";
                                                        break;
                                                    case 3:
                                                        MesDescripcion = "Marzo";
                                                        break;
                                                    case 4:
                                                        MesDescripcion = "Abril";
                                                        break;
                                                    case 5:
                                                        MesDescripcion = "Mayo";
                                                        break;
                                                    case 6:
                                                        MesDescripcion = "Junio";
                                                        break;
                                                    case 7:
                                                        MesDescripcion = "Julio";
                                                        break;
                                                    case 8:
                                                        MesDescripcion = "Agosto";
                                                        break;
                                                    case 9:
                                                        MesDescripcion = "Septiembre";
                                                        break;
                                                    case 10:
                                                        MesDescripcion = "Octubre";
                                                        break;
                                                    case 11:
                                                        MesDescripcion = "Noviembre";
                                                        break;
                                                    case 12:
                                                        MesDescripcion = "Diciembre";
                                                        break;
                                                    default:
                                                }
                                                lMov.MostrarMovimientoAnnio(proyecto, i);
                                        %> 
                                        <tr>
                                            <th colspan="8"><%=MesDescripcion%></th>
                                        </tr>
                                        <%
                                            for (int j = 0; j < lMovimiento.lMov.size(); j++) {

                                                Mov = (Movimiento) lMovimiento.lMov.get(j);
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    a++;
                                                    float Money = Float.parseFloat(Mov.getMoney());

                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                        </tr>

                                        <%

                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                    </div>
                    <%
                        }
                        if (opcion4 != null) {
                    %>
                    <div class="AnnioFactura">
                        <div class="card">
                            <h4 class="card-header">Reporte Del Año - Facturas</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            MoneyTotal = 0;
                                            for (int i = 1; i <= 12; i++) {
                                                a = 0;
                                                String MesDescripcion = null;
                                                switch (i) {
                                                    case 1:
                                                        MesDescripcion = "Enero";
                                                        break;
                                                    case 2:
                                                        MesDescripcion = "Febrero";
                                                        break;
                                                    case 3:
                                                        MesDescripcion = "Marzo";
                                                        break;
                                                    case 4:
                                                        MesDescripcion = "Abril";
                                                        break;
                                                    case 5:
                                                        MesDescripcion = "Mayo";
                                                        break;
                                                    case 6:
                                                        MesDescripcion = "Junio";
                                                        break;
                                                    case 7:
                                                        MesDescripcion = "Julio";
                                                        break;
                                                    case 8:
                                                        MesDescripcion = "Agosto";
                                                        break;
                                                    case 9:
                                                        MesDescripcion = "Septiembre";
                                                        break;
                                                    case 10:
                                                        MesDescripcion = "Octubre";
                                                        break;
                                                    case 11:
                                                        MesDescripcion = "Noviembre";
                                                        break;
                                                    case 12:
                                                        MesDescripcion = "Diciembre";
                                                        break;
                                                    default:
                                                }
                                                lMov.MostrarMovimientoAnnio(proyecto, i);
                                        %> 
                                        <tr>
                                            <th colspan="8"><%=MesDescripcion%></th>
                                        </tr>
                                        <%

                                            for (int j = 0; j < lMovimiento.lMov.size(); j++) {

                                                Mov = (Movimiento) lMovimiento.lMov.get(j);
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    if (!Mov.getRUC().equalsIgnoreCase("           ") && !Mov.getRazonSocial().equalsIgnoreCase("")) {

                                                        a++;
                                                        float Money = Float.parseFloat(Mov.getMoney());
                                                        MoneyTotal += Money;
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                        </tr>

                                        <%
                                                        }
                                                    }
                                                }
                                            }
                                        %>
                                    </tbody>
                                    <caption>Gasto Total a Facturar S/. <%=(double) Math.round(MoneyTotal * 100d) / 100%></caption>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="html2pdf__page-break"></div>
                    <br>
                    <%
                        }
                        if (opcion5 != null) {
                    %>
                    <div class="Total">
                        <div class="card">
                            <h4 class="card-header">Reporte Completo de Movimientos del Proyecto</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                            <th>Tipo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            MoneyTotal = 0;
                                            a = 0;
                                            lMov.MostrarMovimientoTotal(proyecto);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {
                                                a++;
                                                String Tipo = "Nulo";
                                                Mov = (Movimiento) lMovimiento.lMov.get(i);
                                                float Money = Float.parseFloat(Mov.getMoney());
                                                if (Mov.getID().equalsIgnoreCase("1")) {
                                                    Tipo = "Ingreso";
                                                    MoneyTotal += Money;
                                                }
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    Tipo = "Gasto";
                                                    MoneyTotal -= Money;
                                                }
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                            <td><%=Tipo%></td>
                                        </tr>

                                        <%
                                            }
                                        %>
                                    </tbody>
                                    <caption>Balance total S/. <%=(double) Math.round(MoneyTotal * 100d) / 100%></caption>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Completo de Movimientos del Proyecto - Ingresos</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            MoneyTotal = 0;
                                            a = 0;
                                            lMov.MostrarMovimientoTotal(proyecto);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {

                                                String Tipo = "Nulo";
                                                Mov = (Movimiento) lMovimiento.lMov.get(i);
                                                float Money = Float.parseFloat(Mov.getMoney());
                                                if (Mov.getID().equalsIgnoreCase("1")) {
                                                    Tipo = "Ingreso";
                                                    MoneyTotal += Money;
                                                    a++;
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                        </tr>

                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                    <caption>Ingreso total S/. <%=(double) Math.round(MoneyTotal * 100d) / 100%></caption>
                                </table>
                            </div>
                        </div>
                        <div class="html2pdf__page-break"></div>
                        <br>
                        <div class="card">
                            <h4 class="card-header">Reporte Completo de Movimientos del Proyecto - Ingresos</h4>
                            <div class="card-body">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Titulo</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">PDF</th>
                                            <th scope="col">RUC</th>
                                            <th scope="col">RazonSocial</th>
                                            <th scope="col">Dinero</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            MoneyTotal = 0;
                                            a = 0;
                                            lMov.MostrarMovimientoTotal(proyecto);
                                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {

                                                String Tipo = "Nulo";
                                                Mov = (Movimiento) lMovimiento.lMov.get(i);
                                                float Money = Float.parseFloat(Mov.getMoney());
                                                if (Mov.getID().equalsIgnoreCase("2")) {
                                                    Tipo = "Ingreso";
                                                    MoneyTotal += Money;
                                                    a++;
                                        %>
                                        <tr >
                                            <th><%=a%></th>
                                            <td><%=Mov.getFecha()%></td>
                                            <td><%=Mov.getTitulo()%></td>
                                            <td><%=Mov.getDescripcion()%></td>
                                            <%
                                                if (Mov.getPDf().equalsIgnoreCase("No")) {
                                            %> 
                                            <td><%=Mov.getPDf()%></td>         
                                            <%
                                            } else {
                                            %> 
                                            <td><a href="pdf?id=<%=Mov.getPDf()%>" target="_blank">Pdf-<%=Mov.getPDf()%></a></td> 
                                            <%
                                                }
                                            %>
                                            <td><%=Mov.getRUC()%></td>
                                            <td><%=Mov.getRazonSocial()%></td>
                                            <td>S/. <%=(double) Math.round(Money * 100d) / 100%></td>
                                        </tr>

                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                    <caption>Gasto total S/. <%=(double) Math.round(MoneyTotal * 100d) / 100%></caption>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script type="text/javascript">


                        function ConvertirPDF() {
                            const $elementoParaConvertir = document.querySelector("#ImpresionPDF"); // <-- Aquí puedes elegir cualquier elemento del DOM
                            html2pdf()
                                    .set({
                                        margin: 1,
                                        filename: 'Reporte de Movimientos.pdf',
                                        
                                        image: {
                                            type: 'jpeg',
                                            quality: 0.98
                                        },
                                        html2canvas: {
                                            scale: 3, // A mayor escala, mejores gráficos, pero más peso
                                            letterRendering: true
                                        },
                                        jsPDF: {
                                            unit: "cm",
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
