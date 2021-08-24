<%--
    Document   : Actividad
    Created on : 20-ago-2021, 23:42:45
    Author     : ramir
--%>

<%@page import="java.sql.Time"%>
<%@page import="logico.lCronograma"%>
<%@page import="datos.Cronograma"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logico.lTrabajador"%>
<%@page import="datos.Trabajador"%>
<%@page import="java.util.Calendar"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Registro Actividad</title>
    </head>
    <body>
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
                        <a class="nav-link active" aria-current="page" href="#">Cerrar sesion</a>
                    </form>
                </div>
            </div>
        </nav>
        <br><br>
        <form action="Actividad.jsp" method="POST">

            <div class="container">
                <h1 class="text-center">Registro de Actividad</h1>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="InputTitulo" placeholder="Titulo">
                    <label for="floatingInput">Ingresar Actividad</label>
                </div>
                <div class="form-floating mb-3">
                    <textarea class="form-control" placeholder="Descipcion" id="floatingTextarea2" name="InputDescripcion" style="height: 100px"></textarea>
                    <label for="floatingTextarea2">Detalles de la Actividad</label>
                </div>
                <div class="form-floating mb-3">
                    <select class="form-select" id="floatingSelect"  name="InputDniTrabajador" aria-label="Floating label select example">
                        <option selected>Seleccione un Trabajador</option>
                        <%                        lTra.ListarTrabajadores(1);
                            int b = 0;
                            for (int i = 0; i < lTrabajador.lTra.size(); i++) {
                                Tra = (Trabajador) lTrabajador.lTra.get(i);
                                b = lTra.UltimoProyecto(Tra.getDNI());
                                if (b == Integer.parseInt(proyecto)) {

                        %>
                        <option value="<%=Tra.getDNI()%>"><%=Tra.getNombre()%></option>
                        <%

                                }
                            }
                        %>
                    </select>
                    <label for="floatingSelect">Trabajador </label>
                </div>
                <div class="form-floating mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <p>Comienzo</p>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-floating mb-3">
                                            <input type="date" class="form-control" id="floatingInput" name="InputFechaInicio" placeholder="Titulo"
                                                   <%
                                                       if (mes <= 9) {
                                                           out.print("min='" + annio + "-0" + mes + "-" + dia + "'");
                                                       } else {
                                                           out.print("min='" + annio + "-" + mes + "-" + dia + "'");
                                                       }
                                                   %>>
                                            <label for="floatingInput">Ingresar Fecha</label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-floating mb-3">
                                            <input type="Time" class="form-control" id="floatingInputValue" name="InputHoraInicio" min="06:00" max="20:00" placeholder="0:0" >
                                            <label for="floatingInputValue">Ingresar Hora</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-floating mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <p>Fin</p>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-floating mb-3">
                                            <input type="date" class="form-control" id="floatingInput" name="InputFechaFIN" placeholder="Titulo"
                                                   <%
                                                       if (mes <= 9) {
                                                           out.print("min='" + annio + "-0" + mes + "-" + dia + "'");
                                                       } else {
                                                           out.print("min='" + annio + "-" + mes + "-" + dia + "'");
                                                       }
                                                   %>>
                                            <label for="floatingInput">Ingresar Fecha</label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-floating mb-3">
                                            <input type="Time" class="form-control" id="floatingInputValue"name="InputHoraFin" min="06:00" max="20:00"  placeholder="0:0" >
                                            <label for="floatingInputValue">Ingresar Hora</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-floating mb-3">
                    <div class="d-grid gap-2">
                        <input class="btn btn-outline-primary" type="submit"  name="btnGuardar"value="Guardar"/>
                        <a class="btn btn-outline-info" type="button" href="MenuProyecto.jsp">Regresar</a>
                    </div>
                </div>
            </div>
        </form>
        <%
            if (request.getParameter("btnGuardar") != null) {
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                DateFormat hf = new SimpleDateFormat("hh:mm");
                Date dateI = df.parse(request.getParameter("InputFechaInicio"));
                Date dateF = df.parse(request.getParameter("InputFechaFIN"));
                Date hourI = hf.parse(request.getParameter("InputHoraInicio"));
                Date hourF = hf.parse(request.getParameter("InputHoraFin"));
                if (dateF.after(dateI)) {
                    Cro = new Cronograma(request.getParameter("InputTitulo"),
                            request.getParameter("InputFechaInicio"),
                            request.getParameter("InputFechaFIN"),
                            request.getParameter("InputHoraInicio"),
                            request.getParameter("InputHoraFin"),
                            request.getParameter("InputDescripcion"),"1",request.getParameter("InputDniTrabajador"),proyecto);
                    String DNITrabajador = request.getParameter("InputDniTrabajador");
                    lCro.InsertActividad(Cro);
                    response.sendRedirect("Cronograma.jsp");
                } else if (dateI.equals(dateF)) {
                    if (hourF.after(hourI)) {
                        Cro = new Cronograma(request.getParameter("InputTitulo"),
                                request.getParameter("InputFechaInicio"),
                                request.getParameter("InputFechaFIN"),
                                request.getParameter("InputHoraInicio"),
                                request.getParameter("InputHoraFin"),
                                request.getParameter("InputDescripcion"),"1",request.getParameter("InputDniTrabajador"),proyecto);
                        lCro.InsertActividad(Cro);
                        response.sendRedirect("Cronograma.jsp");
                    } else {
        %>
        <script type="text/javascript">
            alert("Problema con la hora");
        </script>
        <%
            }

        } else {
        %>
        <script type="text/javascript">
            alert("Problema con la fecha");
        </script>
        <%
                }

            }
        %>
    </body>
</html>
