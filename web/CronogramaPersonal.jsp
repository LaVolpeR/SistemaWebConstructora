<%-- 
    Document   : CronogramaPersonal
    Created on : 02-sep-2021, 2:58:17
    Author     : ramir
--%>

<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page import="java.util.Calendar"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Cronograma"%>
<%@page import="logico.lCronograma"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="js/mainCalendar.js" type="text/javascript"></script>
        <link href="css/mainCalendar.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="css/cronograma.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            lCronograma lCro = new lCronograma();
            Cronograma Cro = new Cronograma();
            lProyecto lPro = new lProyecto();
            Trabajador Tra = new Trabajador();
            lTrabajador lTra = new lTrabajador();
            String user;
            String Puesto;
            String codigo = null;
            String proyecto = "0";
            if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("2")) {
                user = sesion.getAttribute("user").toString();
                Puesto = sesion.getAttribute("puesto").toString();
                codigo = sesion.getAttribute("codigo").toString();
lPro.ListarProyectos(codigo);
            } else {
                if (sesion.getAttribute("user") != null && sesion.getAttribute("puesto") != null && sesion.getAttribute("puesto").equals("1")) {
                    response.sendRedirect("MenuPrincipalJefe.jsp");
                    out.print("<script>location.replace('MenuPrincipalJefe.jsp');<script>");
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
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="MenuPrincipalPersonal.jsp" tabindex="-1" aria-disabled="true">MENU PRINCIPAL PERSONAL</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="CronogramaPersonal.jsp">Cronograma</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link active" aria-current="page" href="index.jsp?cerrar=true">Cerrar sesion</a>
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
            locale: 'es',
                    headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                            center: 'title',
                            right: 'dayGridMonth,dayGridWeek,dayGridDay,listMonth'
                    },
                    initialDate: <%                        if (mes <= 9) {
                                    if (dia <= 9) {
            %>
            '<%=annio%>-0<%=mes%>-0<%=dia%>'
            <%
            } else {
            %>
                '<%=annio%>-0<%=mes%>-<%=dia%>'
            <%
                }

            } else {
                if (dia <= 9) {
            %>
                    '<%=annio%>-<%=mes%>-0<%=dia%>'
            <%
            } else {
            %>
                        '<%=annio%>-<%=mes%>-<%=dia%>'
            <%
                    }
                }
            %>,
                                    navLinks: true, // can click day/week names to navigate views
                                    editable: false,
                                    dayMaxEvents: true, // allow "more" link when too many events
                                    events: [
            <%
                lCro.MostrarCronogramaXDni(codigo);
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
                                                                                        color: '#0d6efd'
            <%
                    break;
                case 2:
            %>
                                                                                        color: '#198754'
            <%
                    break;
                default:
            %>
                                                                                        color: '#ffc107'
            <%
                }
            %>

                                                                                        },
            <%
                }
            %>

                                                                                        ]
                                                                                });
                                                                                calendar.render();
                                                                                });

        </script>
    </body>
</html>
