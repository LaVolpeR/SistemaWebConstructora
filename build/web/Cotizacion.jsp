<%-- 
    Document   : Cotizacion
    Created on : 5/08/2021, 06:55:35 PM
    Author     : ramir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="css/cotizacionCss.css" rel="stylesheet" type="text/css"/>
        <title>Cotizacion</title>
    </head>
    <body>
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
                            <a class="nav-link active" aria-current="page" href="Planilla.jsp">Planilla</a>
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
                        <li class="nav-item">
                            <a class="nav-link active" href="#seccion-1">Año</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#seccion-2">Mes</a>
                        </li>
                        <li class="nav-item">
                            <a  class="nav-link active"href="#seccion-3">Semana</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="#">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
        <div class="Gastos">
            <section id="seccion-1">
                <div class="GastosMensuales">
                    <div class="BoxGastosDiario">
                        <canvas id="ChartGastoMensual"></canvas>
                    </div>
                    <div>
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
                    </div>
                </div>
            </section>
            <section id="seccion-2">
                <div class="GastosDiaros">
                    <div class="BoxGastosDiario">
                        <canvas id="ChartGastosMes"></canvas>
                    </div>
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
            </section>
            <section id="seccion-3">
                <div class="GastosSemanal">
                    <div class="BoxGastosDiario">
                        <canvas id="ChartGastoSemanal"></canvas>
                    </div>
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
                </div>
            </section>

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
                                    data: [12, 19, 13, 10, 12, 13],
                                    borderColor: [
                                            'rgb(59, 131, 189)'
                                    ]
                            }]
                    },
                    options: {
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
                    labels: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo',],
                            datasets: [{
                            label: 'Gasto Semanal',
                                    data: [13, 42, 13, 31, 17, 53],
                                    borderColor: [
                                            'rgb(59, 131, 189)'
                                    ]
                            }]
                    },
                    options: {
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
                            for(int i = 0; i<=30; i++){
            %>
                            
            '<%=i %>',
            <% 
                            }
            %>
                    ],
                            datasets: [{
                            label: 'Gasto Semanal',
                                    data: [
                                        <% 
                                           
                            for(int i = 0; i<=30; i++){
                                 
            %>
                            
            <%=i %>,
            <% 
                            }
            %>
                                    ],
                                    borderColor: [
                                            'rgb(59, 131, 189)'
                                    ]
                            }]
                    },
                    options: {
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
