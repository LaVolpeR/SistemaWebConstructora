<%-- 
    Document   : Cotizacion
    Created on : 5/08/2021, 06:55:35 PM
    Author     : ramir
--%>

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
        <link href="css/cotizacionCss.css" rel="stylesheet" type="text/css"/>
        <title>Cotizacion</title>
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
            Calendar c = Calendar.getInstance();
            int dia = Integer.parseInt(Integer.toString(c.get(Calendar.DATE)));
            int mes = Integer.parseInt(Integer.toString(c.get(Calendar.MONTH)));
            int annio = Integer.parseInt(Integer.toString(c.get(Calendar.YEAR)));
            mes++;
            lCha.ListarGastoSemana(annio, mes, dia);
            int DiasMes = lCha.DiasTotalMes(mes, annio);
            Chart Cha = new Chart();
            lCha.ListarGastoSemana(annio, mes, dia);
            int b = lChart.lCha.size() - 1;
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
        <br><br>
        <div class="container">
            <div class="px-lg-4 px-xl-5 container-fluid">
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
                                                                <th scope="col">Descripcion</th>
                                                                <th scope="col">Gasto</th>
                                                                <th scope="col">Responsable</th>
                                                                <th scope="col">Fecha</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th>1</th>
                                                                <td>Comida</td>
                                                                <td>20.00</td>
                                                                <td>Ramiro</td>
                                                                <td>15/05/2021</td>
                                                            </tr>
                                                            <tr>
                                                                <th>2</th>
                                                                <td>Maquinaria</td>
                                                                <td>50.00</td>
                                                                <td>Ramiro</td>
                                                                <td>17/05/2021</td>
                                                            </tr>
                                                            <tr>
                                                                <th>3</th>
                                                                <td>Reparacion</td>
                                                                <td>25.00</td>
                                                                <td>Orlando</td>
                                                                <td>17/05/2021</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
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
                                <div class="card-header">
                                    <h4>Gastos/de todo el Año actual</h4>
                                </div>
                                <div class="card-body">
                                    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">Informacion de Gastos de este año</button>
                                    <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
                                        <div class="offcanvas-header">
                                            <h5 class="offcanvas-title" id="offcanvasBottomLabel">Informacion de Gastos de este año</h5>
                                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                        </div>
                                        <div class="offcanvas-body small">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Mes</th>
                                                        <th scope="col">Gasto Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th>1</th>
                                                        <td>Enero</td>
                                                        <td>12</td>
                                                    </tr>
                                                    <tr>
                                                        <th>2</th>
                                                        <td>Febrero</td>
                                                        <td>19</td>
                                                    </tr>
                                                    <tr>
                                                        <th>3</th>
                                                        <td>Marzo</td>
                                                        <td>13</td>
                                                    </tr>
                                                    <tr>
                                                        <th>4</th>
                                                        <td>Abril</td>
                                                        <td>10</td>
                                                    </tr>
                                                    <tr>
                                                        <th>5</th>
                                                        <td>Mayo</td>
                                                        <td>12</td>
                                                    </tr>
                                                    <tr>
                                                        <th>6</th>
                                                        <td>Junio</td>
                                                        <td>13</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <canvas id="ChartGastoMensual"></canvas>
                                </div>
                            </div>
                            <div class="mb-4 card">
                                <div class="card-header">
                                    <h4>Gasto/Ingreso de la semana</h4>
                                </div>
                                <div class="card-body">
                                    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom3" aria-controls="offcanvasBottom3">Informacion de Gasto de la Semanal</button>
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
                                                        <th scope="col">Descripcion</th>
                                                        <th scope="col">Gasto Total</th>
                                                        <th scope="col">Responsable</th>
                                                        <th scope="col">Fecha</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th>1</th>
                                                        <td>Comida</td>
                                                        <td>20.00</td>
                                                        <td>Ramiro</td>
                                                        <td>15/05/2021</td>
                                                    </tr>
                                                    <tr>
                                                        <th>2</th>
                                                        <td>Maquinaria</td>
                                                        <td>50.00</td>
                                                        <td>Ramiro</td>
                                                        <td>17/05/2021</td>
                                                    </tr>
                                                    <tr>
                                                        <th>3</th>
                                                        <td>Reparacion</td>
                                                        <td>25.00</td>
                                                        <td>Orlando</td>
                                                        <td>17/05/2021</td>
                                                    </tr>
                                                    <tr>
                                                        <th>3</th>
                                                        <td>Reparacion</td>
                                                        <td>25.00</td>
                                                        <td>Orlando</td>
                                                        <td>17/05/2021</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <canvas id="ChartGastoSemanal"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script>
            //Grafico Gasto Mensual
            var ctx1 = document.getElementById('ChartGastoMensual').getContext('2d');
            var ctx2 = document.getElementById('ChartGastoSemanal').getContext('2d');
            var ctx3 = document.getElementById('ChartGastosMes').getContext('2d');
            var ChartGastoMensual = new Chart(ctx1, {
            type: 'line',
                    data: {
                    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                            datasets: [{
                            label: 'Gasto Mensual',
                                    data: [
            <%
                for (int i = 1; i <= 12; i++) {
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
            var ChartGastoSemanal = new Chart(ctx2, {
            type: 'line',
                    data: {
                    labels: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo', ],
                            datasets: [{
                            label: 'Gasto Total',
                                    data: [
            <%
                for (int i = b; i >= 0; i--) {
                    Cha = (Chart) lChart.lCha.get(i);
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
            var ChartGastosMes = new Chart(ctx3, {
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
                }a=0;
            %>
                                ],
                                        datasets: [{
                                        label: 'Gasto Total',
                                                data: [
            <%
                for (int i = 0; i <= DiasMes; i++) {
                    a++;
            %>

            <%=lCha.SumaDiaMesMovimiento("2", proyecto, mes, a)%>,
            <%
                }a=0;
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
        </script>
    </body>
</html>
