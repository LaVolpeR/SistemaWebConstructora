<%-- 
    Document   : Reporte
    Created on : 04-sep-2021, 1:33:17
    Author     : ramir
--%>

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
                        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link href="css/Reportecss.css" rel="stylesheet" type="text/css"/>
        <title>Reporte</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            DatosTemporales DatTem = new DatosTemporales();

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
        <div class="container-md">
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalActividad">
                            Reporte de Actividades
                        </button>
                    </div>
                </div>
                <br>
                <br>
                <div class="col-md-6">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalMovimiento">
                            Reporte de Movimientos
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <form action="Reporte.jsp" method="POST">
            <div class="modal fade" id="ModalActividad" tabindex="-1" aria-labelledby="ModalActividad" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Seleccione las Opciones para generar su Reporte de Actividades</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteMes" id="ReporteMes">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Mes Actual</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteTotal" id="ReporteTotal">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte del todo el Proyecto</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteDia" id="ReporteDia">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Dia Actual</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteSemana" id="ReporteSemana">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Semana Actual</label>
                                    </div>
                                </div>
                                <p class="text-center">(opcional)</p>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="Trabajador" id="Trabajador" placeholder="Ingresar DNI Trabajador">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="btnReporteActividad">Generar Reporte</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="ModalMovimiento" tabindex="-1" aria-labelledby="ModalActividad" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Seleccione las Opciones para generar su Reporte de Movimientos</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteMovimientoMes" id="ReporteMovimientoMes">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Mes Actual</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteMovimientoSemana" id="ReporteMovimientoSemana">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Semana Actual</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteMovimientoAnnio" id="ReporteMovimientoAnnio">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Año Actual (todo)</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteMovimientoAnnioFactura" id="ReporteMovimientoAnnioFactura">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Año Actual (Facturas)</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="ReporteMovimientoTotal" id="ReporteMovimientoTotal">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Reporte Todo el proyecto</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="btnReporteMovimiento">Generar Reporte</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script type="text/javascript">
            //Actividades 
            const ReporteMes = document.querySelector('input[id="ReporteMes"]')
            const ReporteTotal = document.querySelector('input[id="ReporteTotal"]')
            const ReporteDia = document.querySelector('input[id="ReporteDia"]')
            const ReporteSemana = document.querySelector('input[id="ReporteSemana"]')
            const DNITrabajador = document.getElementById("Trabajador")
            const button = document.querySelector('button[id="btnReporteActividad"]')
            //Movimientos 
            const ReporteMovimientoMes = document.querySelector('input[id="ReporteMovimientoMes"]')
            const ReporteMovimientoSemana = document.querySelector('input[id="ReporteMovimientoSemana"]')
            const ReporteMovimientoAnnio = document.querySelector('input[id="ReporteMovimientoAnnio"]')
            const ReporteMovimientoAnnioFactura = document.querySelector('input[id="ReporteMovimientoAnnioFactura"]')
            const ReporteMovimientoTotal = document.querySelector('input[id="ReporteMovimientoTotal"]')
            const buttonM = document.querySelector('button[id="btnReporteMovimiento"]')
            //Funcion Actividad
            button.addEventListener('click', (e) => {
                if (ReporteMes.checked || ReporteTotal.checked || ReporteDia.checked || ReporteSemana.checked) {
                    const url = new URL(window.location.origin + '/ReporteActividad.jsp');
                    //const url = new URL(window.location.origin + '/SistemaWebConstructoraTesis1.1/ReporteActividad.jsp');
                    url.searchParams.append('action', 'btnReporteActividad')
                    if (ReporteMes.checked) {
                        url.searchParams.append('Mes', ReporteMes.value)
                    }
                    if (DNITrabajador.value) {
                        url.searchParams.append('DNITrabajador', DNITrabajador.value)
                    }
                    if (ReporteTotal.checked) {
                        url.searchParams.append('Total', ReporteTotal.value)
                    }
                    if (ReporteDia.checked) {
                        url.searchParams.append('Dia', ReporteDia.value)
                    }
                    if (ReporteSemana.checked) {
                        url.searchParams.append('Semana', ReporteSemana.value)
                    }
                    window.location.href = url.href;
                    //window.location.href = "ReporteActividad.jsp?action=btnReporteActividad&Mes=" + ReporteMes.value + "&Annio=" + ReporteAnnio.value + "&Dia=" + ReporteDia.value + "&Semana=" + ReporteSemana.value;
                } else {
                    alert("Selecciona alguna opción");
                }
            })
            //Fucion Movimiento
            buttonM.addEventListener('click', (e) => {
                if (ReporteMovimientoMes.checked || ReporteMovimientoSemana.checked || ReporteMovimientoAnnio.checked || ReporteMovimientoAnnioFactura.checked || ReporteMovimientoTotal.checked) {
                    //const url = new URL(window.location.origin + '/SistemaWebConstructoraTesis1.1/ReporteMovimientos.jsp');
                    const url = new URL(window.location.origin + '/ReporteMovimientos.jsp');
                    url.searchParams.append('action', 'btnReporteMovimiento')
                    if (ReporteMovimientoMes.checked) {
                        url.searchParams.append('Mes', ReporteMovimientoMes.value)
                    }
                    if (ReporteMovimientoSemana.checked) {
                        url.searchParams.append('Semana', ReporteMovimientoSemana.value)
                    }
                    if (ReporteMovimientoAnnio.checked) {
                        url.searchParams.append('Annio', ReporteMovimientoAnnio.value)
                    }
                    if (ReporteMovimientoAnnioFactura.checked) {
                        url.searchParams.append('AnnioFactura', ReporteMovimientoAnnioFactura.value)
                    }
                    if (ReporteMovimientoTotal.checked) {
                        url.searchParams.append('Total', ReporteMovimientoTotal.value)
                    }
                    window.location.href = url.href;
                    //window.location.href = "ReporteActividad.jsp?action=btnReporteActividad&Mes=" + ReporteMes.value + "&Annio=" + ReporteAnnio.value + "&Dia=" + ReporteDia.value + "&Semana=" + ReporteSemana.value;
                } else {
                    alert("Selecciona alguna opción");
                }
            })
        </script>
    </body>
</html>
