<%-- 
    Document   : Cronograma
    Created on : 8/08/2021, 02:36:12 AM
    Author     : ramir
--%>

<%@page import="logico.lCronograma"%>
<%@page import="datos.Cronograma"%>
<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <script src="js/mainCalendar.js" type="text/javascript"></script>
        <link href="css/mainCalendar.css" rel="stylesheet" type="text/css"/>
        <link href="css/cronograma.css" rel="stylesheet" type="text/css"/>
        <title>Cronograma</title>
    </head>
    <%
        Proyecto pro = new Proyecto();
        lProyecto lPro = new lProyecto();
        HttpSession sesion = request.getSession();
        Trabajador Tra = new Trabajador();
        lTrabajador lTra = new lTrabajador();
        Cronograma Cro = new Cronograma();
        lCronograma lCro = new lCronograma();
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
        Calendar c = Calendar.getInstance();
        int dia = Integer.parseInt(Integer.toString(c.get(Calendar.DATE)));
        int mes = Integer.parseInt(Integer.toString(c.get(Calendar.MONTH)));
        mes++;
        int annio = Integer.parseInt(Integer.toString(c.get(Calendar.YEAR)));


    %>
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
        <div class="container">
            <div id='calendar'></div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                    headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                            center: 'title',
                            right: 'dayGridMonth,dayGridWeek,dayGridDay,listMonth'
                    },
                            initialDate: <%                        if (mes <= 9) {
            %>
                    '<%=annio%>-0<%=mes%>-<%=dia%>'
            <%
            } else {
            %>'<%=annio%>-<%=mes%>-<%=dia%>',
            <%
                }
            %>,
                                navLinks: true, // can click day/week names to navigate views
                                editable: false,
                                dayMaxEvents: true, // allow "more" link when too many events
                                events: [
            <%
                lCro.MostrarCronograma(proyecto);
                for (int i = 0; i < lCronograma.lCro.size(); i++) {
                    Cro = (Cronograma) lCronograma.lCro.get(i);
            %>
                                {
                                title: '<%=Cro.getTitulo()%> - <%=lTra.Nombre(Cro.getTrabajadorDNI())%>',
                                                            start: '<%=Cro.getFechaInico()%>T<%=Cro.getHoraIncio()%>',
                                                                                        end: '<%=Cro.getFechaFin()%>T<%=Cro.getHoraFin()%>',
            <%
                switch (Integer.parseInt(Cro.getEstadoId())) {
                    case 1:%>
                                                                                                            color: '#993366'
            <%
                    break;
                case 2:
            %>
                                                                                                            color: '#65C0A3'
            <%
                        break;
                }
            %>

                                                                                                            },
            <%
                }
            %>




                                                                                                            /*{
                                                                                                             title: 'Envento de un dia entero',
                                                                                                             start: '2021-08-08',
                                                                                                             color: '#257e4a'
                                                                                                             },
                                                                                                             {
                                                                                                             title: 'Evento de varios dias',
                                                                                                             start: '2021-08-07',
                                                                                                             end: '2021-08-10'
                                                                                                             },
                                                                                                             {
                                                                                                             title: 'LIJAR PAREDES - CURO',
                                                                                                             start: '2021-08-14',
                                                                                                             end: '2021-08-16'
                                                                                                             }                    ,
                                                                                                             {
                                                                                                             
                                                                                                             title: 'Eevento repetitivo 1',
                                                                                                             start: '2021-08-09T16:00:00.000000'
                                                                                                             },
                                                                                                             {
                                                                                                             title: 'Repeating Event',
                                                                                                             start: '2021-08-09T17:00:00',
                                                                                                             end: '2021-08-09T18:00:00'
                                                                                                             },
                                                                                                             {
                                                                                                             title: 'Repeating Event',
                                                                                                             start: '2021-08-09T08:00:00',
                                                                                                             end: '2021-08-09T10:00:00'
                                                                                                             },*/
                                                                                                            ]
                                                                                                    });
                                                                                                    calendar.render();
                                                                                            });

        </script>
        <style>

            body {
                margin: 40px 10px;
                padding: 0;
                font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
                font-size: 14px;
            }

            #calendar {
                max-width: 1100px;
                margin: 0 auto;
            }

        </style>
    </body>
</html>
