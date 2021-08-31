<%-- 
    Document   : RegistroGasto
    Created on : 17-ago-2021, 2:11:16
    Author     : ramir
--%>

<%@page import="datos.Archivo"%>
<%@page import="logico.lProyecto"%>
<%@page import="datos.Proyecto"%>
<%@page contentType="text/html" pageEncoding="Windows-1252"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        

        <title>Registro de Movimiento</title>
    </head>
    <body>
        <%
            Proyecto pro = new Proyecto();
            lProyecto lPro = new lProyecto();
            HttpSession sesion = request.getSession();
            String user;
            String puesto;
            String codigo ="";
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
            Integer dato = 0;
            try {
                Archivo arc = (Archivo) request.getAttribute("row");
                dato = arc.getID();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            boolean icono = false;
            try {
                icono = (Boolean) request.getAttribute("row2");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
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
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">MENU PROYECTO</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Cotizacion.jsp">Cotizacion</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="">Planilla</a>
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
        <br><br><br>
        <form name="formpdf" action="ControllerPdf" method="post" enctype="multipart/form-data">
            <input name="InputDNI"  type="hidden" value="<%=codigo %>">
            <input name="InputID"  type="hidden" value="<%=proyecto%>">
            <div class="container"> 
                <h1 class="text-center">Registro de Movimiento</h1>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="InputTitulo" placeholder="Titulo">
                    <label for="floatingInput" >Ingresar Titulo</label>
                </div>
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="InputDescripcion" style="height: 100px"></textarea>
                    <label for="floatingTextarea2">Descripcion</label>
                </div>
                <br>
                <div class="form-floating mb-3">
                    <input type="number"step="0.01" class="form-control" name="InputMoney" placeholder="s/0.0">
                    <label for="floatingInput" >Ingresar monto gastado</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="InputRuc" placeholder="RUC">
                    <label for="floatingInput" >Ingresar RUC</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="InputRazonSocial" placeholder="Razon Social">
                    <label for="floatingInput" >Ingresar Razon Social</label>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label">Ingresar Archivo (opcional)</label>
                    <input class="form-control" type="file" name="formFile">
                </div>
                <div class="form-floating">
                    <select class="form-select" id="floatingSelect" name="InputTipo" aria-label="Floating label select example">
                        <option value="1">Ingreso</option>
                        <option value="2">Gasto</option>
                    </select>
                    <label for="floatingSelect">Ingresar el tipo de Movimiento</label>
                </div>
                <br>
                <div class="d-grid gap-2">
                    <input class="btn btn-primary" type="submit" name="btnGuardar" value="Guardar"/>
                    <a class="btn btn-primary" type="submit" href="MenuProyecto.jsp">Regresar</a>
                </div>
                
            </div>
        </form>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Personal Script -->
    </body>
</html>
