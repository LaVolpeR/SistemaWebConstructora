<%-- 
    Document   : Cotizacion
    Created on : 5/08/2021, 06:55:35 PM
    Author     : ramir
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Locale"%>
<%@page import="logico.lMovimiento"%>
<%@page import="datos.Movimiento"%>
<%@page import="logico.lDatosTemporales"%>
<%@page import="datos.DatosTemporales"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="datos.Chart"%>
<%@page import="java.util.Calendar"%>
<%@page import="logico.lChart"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <link href="css/cotizacionCss.css" rel="stylesheet" type="text/css"/>
        <title>Movimientos</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo;
            String proyecto = "0";
            String ID_Proyecto = "null";
            DatosTemporales DatTem = new DatosTemporales();
            lDatosTemporales lDatTem = new lDatosTemporales();
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
            lChart lCha = new lChart();
            Locale locale = new Locale("es", "PE");
            TimeZone tz = TimeZone.getTimeZone("America/Lima");
            Calendar c = Calendar.getInstance(tz, locale);
            Calendar cal = GregorianCalendar.getInstance(tz, locale);
            int dia = Integer.parseInt(Integer.toString(cal.get(Calendar.DATE)));
            int mes = Integer.parseInt(Integer.toString(cal.get(Calendar.MONTH))) + 1;
            int annio = Integer.parseInt(Integer.toString(cal.get(Calendar.YEAR)));
            int hour = Integer.parseInt(Integer.toString(cal.get(Calendar.HOUR_OF_DAY)));
            int min = Integer.parseInt(Integer.toString(cal.get(Calendar.MINUTE)));
            lCha.ListarGastoSemana(annio, mes, dia);

            int DiasMes = lCha.DiasTotalMes(mes, annio);

            Chart Cha = new Chart();
            lCha.ListarGastoSemana(annio, mes, dia);
            int b = lChart.lCha.size() - 1;
            float GastoAnnio = 0;
            float IngresoAnnio = 0;
            float GastoSemana = 0;
            float IngresoSemana = 0;
            float GastoMes = 0;
            float IngresoMes = 0;
            float Ingresos = 0;
            float Gastos = 0;
            float Total = 0;
            int d = 0;
            lDatTem.IngresoGastoTotalProyecto(proyecto);
            if (lDatosTemporales.lDatTem.size() != 0) {
                if (lDatosTemporales.lDatTem.size() == 1) {
                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(0);
                    if (DatTem.getDato1().equalsIgnoreCase("1")) {
                        Ingresos = Float.parseFloat(DatTem.getDato());
                    } else if (DatTem.getDato1().equalsIgnoreCase("2")) {
                        Gastos = Float.parseFloat(DatTem.getDato());
                    }
                    Total = Ingresos - Gastos;
                }
                if (lDatosTemporales.lDatTem.size() == 2) {
                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(0);
                    Ingresos = Float.parseFloat(DatTem.getDato());
                    DatTem = (DatosTemporales) lDatosTemporales.lDatTem.get(1);
                    Gastos = Float.parseFloat(DatTem.getDato());
                    Total = Ingresos - Gastos;
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

        <div class="container">
            <div class="px-lg-4 px-xl-5 container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <p class="card-text">
                                    Ingreso Obtenido: S/.<%=(double) Math.round(Ingresos * 100d) / 100%>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-white bg-danger ">
                            <div class="card-body">
                                <p class="card-text" >
                                    Gasto Total: S/.<%=(double) Math.round(Gastos * 100d) / 100%>
                                </p>
                            </div>
                        </div> 
                    </div>
                    <div class="col">
                        <div class="card text-dark  bg-warning  ">
                            <div class="card-body">
                                <p class="card-text" >
                                    Gasto Total: S/.<%=(double) Math.round(Total * 100d) / 100%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="page-header">
                    <h1 class="page-heading">Graficos Del Proyecto</h1>
                </div>
                <section>
                    <div class="mb-4 row">
                        <div class="mb-4 mb-lg-0 col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-heading">
                                        Gasto/Ingresos del Mes actual
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="mb-2">
                                        <div class="mb-3">
                                            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom2" aria-controls="offcanvasBottom2">Informacion de Gasto del Mes</button>
                                        </div>
                                        <div class="mt-5 mb-5">
                                            <canvas id="ChartGastosMes"  style="display: block; box-sizing: border-box; height: 280.8px; width: 563.2px;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-4 card">
                                <div class="card-body">
                                    <div id="Semi-Donut-Mes"></div>
                                </div>
                            </div>
                            <div class="mb-4 card">
                                <div class="card-body">
                                    <div class="card text-white bg-success">
                                        <div class="card-body">
                                            <p class="card-text" id="IngresoMes"></p>
                                        </div>
                                    </div>
                                    <div class="card text-white bg-danger ">
                                        <div class="card-body">
                                            <p class="card-text" id="GastoMes"></p>
                                        </div>
                                    </div> 
                                    <div class="card text-dark  bg-warning  ">
                                        <div class="card-body">
                                            <p class="card-text" id="TotalMes"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="mb-4 row">
                        <div class="mb-4 mb-lg-0 col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-heading">
                                        Gastos/Ingreso de todo el Año actual
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="mb-2">
                                        <div class="mb-3">
                                            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">Informacion de Gasto del Año </button>
                                        </div>
                                        <div class="mt-5 mb-5">
                                            <canvas id="ChartGastoAnnio"  style="display: block; box-sizing: border-box; height: 280.8px; width: 563.2px;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-4 card">
                                <div class="card-body">
                                    <div id="Semi-Donut-Annio"></div>
                                </div>
                            </div>
                            <div class="mb-4 card">
                                <div class="card-body">
                                    <div class="card text-white bg-success">
                                        <div class="card-body">
                                            <p class="card-text" id="IngresoAnnio"></p>
                                        </div>
                                    </div>
                                    <div class="card text-white bg-danger ">
                                        <div class="card-body">
                                            <p class="card-text" id="GastoAnnio"></p>
                                        </div>
                                    </div> 
                                    <div class="card text-dark  bg-warning  ">
                                        <div class="card-body">
                                            <p class="card-text" id="TotalAnnio"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="mb-4 row">
                        <div class="mb-4 mb-lg-0 col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-heading">
                                        Gasto/Ingreso de la semana
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="mb-2">
                                        <div class="mb-3">
                                            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom3" aria-controls="offcanvasBottom3">Informacion de Gasto de la semana</button>
                                        </div>
                                        <div class="mt-5 mb-5">
                                            <canvas id="ChartGastoSemanal"  style="display: block; box-sizing: border-box; height: 280.8px; width: 563.2px;"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-4 card">
                                <div class="card-body">
                                    <div id="Semi-Donut-Semana"></div>
                                </div>
                            </div>
                            <div class="mb-4 card">
                                <div class="card-body">
                                    <div class="card text-white bg-success">
                                        <div class="card-body">
                                            <p class="card-text" id="IngresoSemana"></p>
                                        </div>
                                    </div>
                                    <div class="card text-white bg-danger ">
                                        <div class="card-body">
                                            <p class="card-text" id="GastoSemana"></p>
                                        </div>
                                    </div> 
                                    <div class="card text-dark  bg-warning  ">
                                        <div class="card-body">
                                            <p class="card-text" id="TotalSemana"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

        </div>
        <!-- Tabla de Gasto Mes -->
        <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom2" aria-labelledby="offcanvasBottomLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasBottomLabel">Informacion de Gasto del Mes</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body small">
                <table class="table">
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
                            Movimiento Mov = new Movimiento();
                            lMovimiento lMov = new lMovimiento();
                            lMov.MostrarMovimientoMes(proyecto, mes, annio);
                            for (int i = 0; i < lMovimiento.lMov.size(); i++) {
                                d++;
                                String ClassTable = "table-light";
                                Mov = (Movimiento) lMovimiento.lMov.get(i);
                                if (Mov.getID().equalsIgnoreCase("1")) {
                                    ClassTable = "table-success";
                                }
                                if (Mov.getID().equalsIgnoreCase("2")) {
                                    ClassTable = "table-danger";
                                }
                                float Money = Float.parseFloat(Mov.getMoney());
                        %>
                        <tr class="<%=ClassTable%>">
                            <th><%=d%></th>
                            <td><%=Mov.getFecha()%></td>
                            <td><%=Mov.getTitulo()%></td>
                            <td><%=Mov.getDescripcion()%></td>
                            <td><%=Mov.getPDf()%></td>
                            <td><%=Mov.getRUC()%></td>
                            <td><%=Mov.getRazonSocial()%></td>
                            <td> <%=(double) Math.round(Money * 100d) / 100%></td>
                        </tr>

                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Tabla de Annio -->
        <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasBottomLabel">Informacion de Gastos de este año</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body small">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Mes</th>
                            <th scope="col">Ingreso Total</th>
                            <th scope="col">Gasto Total</th>
                            <th scope="col">Balance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 1; i <= 12; i++) {
                                String MesEscrito = "null";
                                switch (i) {
                                    case 1:
                                        MesEscrito = "Enero";
                                        break;
                                    case 2:
                                        MesEscrito = "Febrero";
                                        break;
                                    case 3:
                                        MesEscrito = "Marzo";
                                        break;

                                    case 4:
                                        MesEscrito = "Abril";
                                        break;
                                    case 5:
                                        MesEscrito = "Mayo";
                                        break;
                                    case 6:
                                        MesEscrito = "Junio";
                                        break;
                                    case 7:
                                        MesEscrito = "Julio";
                                        break;
                                    case 8:
                                        MesEscrito = "Agosto";
                                        break;
                                    case 9:
                                        MesEscrito = "Septiembre";
                                        break;
                                    case 10:
                                        MesEscrito = "Octubre";
                                        break;
                                    case 11:
                                        MesEscrito = "Noviembre";
                                        break;
                                    case 12:
                                        MesEscrito = "Diciembre";
                                        break;
                                    default:
                                }
                                float balance = 0;
                                String ClassTable = "table-light";
                                if (!lCha.SumaMesMovimiento("1", proyecto, i).equalsIgnoreCase("0") || !lCha.SumaMesMovimiento("2", proyecto, i).equalsIgnoreCase("0")) {
                                    balance = Float.parseFloat(lCha.SumaMesMovimiento("1", proyecto, i)) - Float.parseFloat(lCha.SumaMesMovimiento("2", proyecto, i));
                                    if (balance >= 0) {
                                        ClassTable = "table-success";
                                    } else {
                                        ClassTable = "table-danger";
                                    }
                        %>
                        <tr>
                            <td> <%=MesEscrito%></td>
                            <td>S/. <%=(double) Math.round(Float.parseFloat(lCha.SumaMesMovimiento("1", proyecto, i)) * 100d) / 100%></td>
                            <td>S/. <%=(double) Math.round(Float.parseFloat(lCha.SumaMesMovimiento("2", proyecto, i)) * 100d) / 100%></td>
                            <td class="<%=ClassTable%>">S/. <%=(double) Math.round(balance * 100d) / 100%></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Tabla Semana -->
        <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom3" aria-labelledby="offcanvasBottomLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasBottomLabel">Informacion de Gasto de la Semanal</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body small">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">RUC</th>
                            <th scope="col">Razon Social</th>
                            <th scope="col">PDF</th>
                            <th scope="col">Gasto Total</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            d = 0;
                            for (int i = 0; i <= 6; i++) {

                                lMov.MostrarMovimientoSemana(lDatTem.MostrarFechaSemana(i), proyecto);

                                for (int j = 0; j < lMovimiento.lMov.size(); j++) {
                                    d++;

                                    Mov = (Movimiento) lMovimiento.lMov.get(j);
                                    String ClassTable = "table-light";

                                    if (Mov.getID().equalsIgnoreCase("1")) {
                                        ClassTable = "table-success";
                                    }
                                    if (Mov.getID().equalsIgnoreCase("2")) {
                                        ClassTable = "table-danger";
                                    }
                                    Float Money = Float.parseFloat(Mov.getMoney());
                        %>
                        <tr class="<%=ClassTable%>">
                            <th><%=d%></th>
                            <td><%=Mov.getFecha()%></td>
                            <td><%=Mov.getTitulo()%></td>
                            <td><%=Mov.getDescripcion()%></td>
                            <td><%=Mov.getRUC()%></td>
                            <td><%=Mov.getRazonSocial()%></td>
                            <td><%=Mov.getPDf()%></td>
                            <td> <%=(double) Math.round(Money * 100d) / 100%></td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script>
            //Grafico Gasto Mensual
            var ChartGastoAnnio = document.getElementById('ChartGastoAnnio').getContext('2d');
            var ChartGastoSemanal = document.getElementById('ChartGastoSemanal').getContext('2d');
            var ChartGastosMes = document.getElementById('ChartGastosMes').getContext('2d');
            //Graficos de Gasto Annio
            var ChartGastoAnnio = new Chart(ChartGastoAnnio, {
            type: 'line',
                    data: {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                            datasets: [{
                            label: 'Gasto Mensual',
                                    data: [
            <%                for (int i = 1; i <= 12; i++) {
                    GastoAnnio += Float.parseFloat(lCha.SumaMesMovimiento("2", proyecto, i));
            %>
            <%=lCha.SumaMesMovimiento("2", proyecto, i)%>,
            <%
                }
            %>

                                    ],
                                    borderColor: [
                                            'rgb(255,99,132)'
                                    ]
                            }, {
                            label: 'Ingreso total',
                                    data: [
            <%
                for (int i = 1; i <= 12; i++) {
                    IngresoAnnio += Float.parseFloat(lCha.SumaMesMovimiento("1", proyecto, i));
            %>
            <%=lCha.SumaMesMovimiento("1", proyecto, i)%>,
            <%
                }
            %>

                                    ],
                                    borderColor: [
                                            'rgb(99,210,255)'
                                    ]
                            }
                            ]
                    },
                    options: {
                    fill: true,
                            tension: 0.5,
                            maintainAspectRatio: true,
                            scales: {
                            yAxes: [{
                            stacked: true,
                                    gridLines: {
                                    display: true,
                                            color: "rgba(255,99,132,0.2)"
                                    }
                            }],
                                    xAxes: [{
                                    gridLines: {
                                    display: false
                                    }
                                    }]
                            }
                    }
            });
            var optionsSemiDonutAnnio = {
            series: [<%=GastoAnnio%>, <%=IngresoAnnio%>],
                    chart: {
                    type: 'donut',
                    },
                    labels: ['Gastos', 'Ingreso'],
                    colors: ['#FF6384', '#3B83BD'],
                    plotOptions: {
                    pie: {
                    startAngle: - 90,
                            endAngle: 90,
                            offsetY: 10
                    }
                    },
                    grid: {
                    padding: {
                    bottom: - 80
                    }
                    },
                    responsive: [{
                    breakpoint: 480,
                            options: {
                            chart: {
                            width: 200
                            },
                                    legend: {
                                    position: 'bottom'
                                    }
                            }
                    }]
            };
            var chartSemiDonutAnnio = new ApexCharts(document.querySelector("#Semi-Donut-Annio"), optionsSemiDonutAnnio);
            chartSemiDonutAnnio.render();
            //Graficos de Gasto Semanal
            var ChartGastoSemanal = new Chart(ChartGastoSemanal, {
            type: 'line',
                    data: {
                    labels: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo', ],
                            datasets: [{
                            label: 'Gasto Total',
                                    data: [
            <%
                for (int i = b; i >= 0; i--) {
                    Cha = (Chart) lChart.lCha.get(i);
                    GastoSemana += Float.parseFloat(lCha.SumDiaSemanaMovimiento(Cha.getDia(), Cha.getMes(), Cha.getAnnio(), 2, Integer.parseInt(proyecto)));
            %>
            <%=lCha.SumDiaSemanaMovimiento(Cha.getDia(), Cha.getMes(), Cha.getAnnio(), 2, Integer.parseInt(proyecto))%>,
            <%

                }
            %>

                                    ],
                                    borderColor: [
                                            'rgb(255,99,132)'
                                    ]
                            },
                            {
                            label: 'Ingreso Total',
                                    data: [
            <%
                for (int i = b; i >= 0; i--) {
                    Cha = (Chart) lChart.lCha.get(i);
                    IngresoSemana += Float.parseFloat(lCha.SumDiaSemanaMovimiento(Cha.getDia(), Cha.getMes(), Cha.getAnnio(), 1, Integer.parseInt(proyecto)));
            %>
            <%=lCha.SumDiaSemanaMovimiento(Cha.getDia(), Cha.getMes(), Cha.getAnnio(), 1, Integer.parseInt(proyecto))%>,
            <%

                }
            %>

                                    ],
                                    borderColor: [
                                            'rgb(59, 131, 189)'
                                    ]
                            }
                            ]
                    },
                    options: {
                    fill: true,
                            tension: 0.5,
                            maintainAspectRatio: true,
                            scales: {
                            yAxes: [{
                            stacked: true,
                                    gridLines: {
                                    display: true,
                                            color: "rgba(255,99,132,0.2)"
                                    }
                            }],
                                    xAxes: [{
                                    gridLines: {
                                    display: false
                                    }
                                    }]
                            }
                    }
            });
            var optionsSemiDonutSemana = {
            series: [<%=GastoSemana%>, <%=IngresoSemana%>],
                    chart: {
                    type: 'donut',
                    },
                    labels: ['Gastos', 'Ingreso'],
                    colors: ['#FF6384', '#3B83BD'],
                    plotOptions: {
                    pie: {
                    startAngle: - 90,
                            endAngle: 90,
                            offsetY: 10
                    }
                    },
                    grid: {
                    padding: {
                    bottom: - 80
                    }
                    },
                    responsive: [{
                    breakpoint: 480,
                            options: {
                            chart: {
                            width: 200
                            },
                                    legend: {
                                    position: 'bottom'
                                    }
                            }
                    }]
            };
            var chartSemiDonutSemana = new ApexCharts(document.querySelector("#Semi-Donut-Semana"), optionsSemiDonutSemana);
            chartSemiDonutSemana.render();
            //Graficos de Gasto Mes
            var ChartGastosMes = new Chart(ChartGastosMes, {
            type: 'line',
                    data: {
                    labels: [
            <%
                int a = 0;
                for (int i = 0; i < DiasMes; i++) {
                    a++;
            %>

                    '<%=a%>/<%=mes%>',
            <%
                }
                a = 0;
            %>
                                ],
                                        datasets: [{
                                        label: 'Gasto Total',
                                                data: [
            <%
                for (int i = 0; i <= DiasMes; i++) {
                    a++;
                    GastoMes += Float.parseFloat(lCha.SumaDiaMesMovimiento("2", proyecto, mes, a));
            %>

            <%=lCha.SumaDiaMesMovimiento("2", proyecto, mes, a)%>,
            <%
                }
                a = 0;
            %>
                                                ],
                                                borderColor: [
                                                        'rgb(255, 99, 132)'
                                                ]
                                        }, {
                                        label: 'Ingreso Total',
                                                data: [
            <%
                for (int i = 0; i <= DiasMes; i++) {
                    a++;
                    IngresoMes += Float.parseFloat(lCha.SumaDiaMesMovimiento("1", proyecto, mes, a));
            %>

            <%=lCha.SumaDiaMesMovimiento("1", proyecto, mes, a)%>,
            <%
                }
            %>
                                                ],
                                                borderColor: [
                                                        'rgb(59, 131, 189)'
                                                ]
                                        }, ]
                                },
                                options: {
                                fill: true,
                                        tension: 0.5,
                                        maintainAspectRatio: true,
                                        scales: {
                                        yAxes: [{
                                        stacked: true,
                                                gridLines: {
                                                display: true,
                                                        color: "rgba(255,99,132,0.2)"
                                                }
                                        }],
                                                xAxes: [{
                                                gridLines: {
                                                display: false
                                                }
                                                }]
                                        }
                                }
                        });
                        var optionsSemiDonutMes = {
                        series: [<%=GastoMes%>, <%=IngresoMes%>],
                                chart: {
                                type: 'donut',
                                },
                                labels: ['Gastos', 'Ingreso'],
                                colors: ['#FF6384', '#3B83BD'],
                                plotOptions: {
                                pie: {
                                startAngle: - 90,
                                        endAngle: 90,
                                        offsetY: 10
                                }
                                },
                                grid: {
                                padding: {
                                bottom: - 80
                                }
                                },
                                responsive: [{
                                breakpoint: 480,
                                        options: {
                                        chart: {
                                        width: 200
                                        },
                                                legend: {
                                                position: 'bottom'
                                                }
                                        }
                                }]
                        };
                        var chartSemiDonutMes = new ApexCharts(document.querySelector("#Semi-Donut-Mes"), optionsSemiDonutMes);
                        chartSemiDonutMes.render();
            <%
                float TotalMes = IngresoMes - GastoMes;
                float TotalAnnio = IngresoAnnio - GastoAnnio;
                float TotalSemana = IngresoSemana - GastoSemana;
            %>

                        document.getElementById('IngresoMes').innerHTML = 'Ingresos S/. ' + <%=(double) Math.round(IngresoMes * 100d) / 100%>; ;
                        document.getElementById('GastoMes').innerHTML = 'Gastos   S/. ' + <%=(double) Math.round(GastoMes * 100d) / 100%>; ;
                        document.getElementById('TotalMes').innerHTML = 'Total   S/. ' + <%=(double) Math.round(TotalMes * 100d) / 100%>;
                        document.getElementById('IngresoAnnio').innerHTML = 'Ingresos S/. ' + <%=(double) Math.round(IngresoAnnio * 100d) / 100%>; ;
                        document.getElementById('GastoAnnio').innerHTML = 'Gastos   S/. ' + <%=(double) Math.round(GastoAnnio * 100d) / 100%>; ;
                        document.getElementById('TotalAnnio').innerHTML = 'Total   S/. ' + <%=(double) Math.round(TotalAnnio * 100d) / 100%>;
                        document.getElementById('IngresoSemana').innerHTML = 'Ingresos S/. ' + <%=(double) Math.round(IngresoSemana * 100d) / 100%>; ;
                        document.getElementById('GastoSemana').innerHTML = 'Gastos   S/. ' + <%=(double) Math.round(GastoSemana * 100d) / 100%>; ;
                        document.getElementById('TotalSemana').innerHTML = 'Total   S/. ' + <%=(double) Math.round(TotalSemana * 100d) / 100%>;




        </script>
    </body>
</html>