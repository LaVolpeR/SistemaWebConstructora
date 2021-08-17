<%-- 
    Document   : Cronograma
    Created on : 8/08/2021, 02:36:12 AM
    Author     : ramir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <script src="js/mainCalendar.js" type="text/javascript"></script>
        <link href="css/mainCalendar.css" rel="stylesheet" type="text/css"/>
        <link href="css/cronograma.css" rel="stylesheet" type="text/css"/>
        
        <script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      initialDate: '2021-08-08',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'Envento de un dia entero',
          start: '2021-08-08'
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
        },
        {
          
          title: 'Eevento repetitivo 1',
          start: '2021-08-09T16:00:00'
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
        },
      ]
    });

    calendar.render();
  });

</script>
        <title>Cronograma</title>
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
        <div class="container">
             <div id='calendar'></div>
        </div>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
