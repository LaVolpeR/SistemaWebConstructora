package SERVLET;

import datos.Archivo;
import datos.Movimiento;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import logico.lArchivos;
import logico.lMovimiento;

@WebServlet(name = "ControllerPdf", urlPatterns = {"/ControllerPdf"})
@MultipartConfig(maxFileSize = 161772150)    // upload file's size up to 16MB 161772150

public class ControllerPdf extends HttpServlet {

    public static final String lIST_STUDENT = "/Archivos.jsp";
    public static final String INSERT_PDF = "/GuardarPDF.jsp";
    public static final String INSERT_PDF_PROYECTO = "/GuardarPDFProyecto.jsp";
    public static final String INSERT_GASTO = "/RegistroMovimiento.jsp";
    String estado = null;
    String tipo = null;
    lArchivos lArc;
    int id_pdf = -1;

    public ControllerPdf() {
        lArc = new lArchivos();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            forward = lIST_STUDENT;
            int studentId = Integer.parseInt(request.getParameter("id"));
            lArc.EliminarPDF(studentId);
        }
        if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_PDF;
            int studentIdM = Integer.parseInt(request.getParameter("id"));
            id_pdf = studentIdM;
            Archivo Arc = lArc.getArchivoID(id_pdf);
            request.setAttribute("row", Arc);
            boolean boo = false;
            if (Arc.getData2() != null) {
                boo = true;
            }
            request.setAttribute("row2", boo);
            estado = "edit";
        } else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT_PDF;
            estado = "insert";
        } else if (action.equalsIgnoreCase("insertMovimiento")) {
            forward = INSERT_GASTO;
            estado = "insertMovimiento";
        } else if (action.equalsIgnoreCase("insertPDFProyecto")){
            forward = INSERT_PDF_PROYECTO;
            estado = "insertPDFProyecto";
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Archivo Arc = new Archivo();
        int ID = Integer.parseInt(request.getParameter("InputID"));
        String DNI = request.getParameter("InputDNI");
        try {

            String name = request.getParameter("InputTitulo");
            String descripcion = request.getParameter("InputDescripcion");

            Arc.setTitulo(name);
            Arc.setDescripcion(descripcion);

            Arc.setPropietario(DNI);
        } catch (Exception ex) {
            System.out.println("nombre: " + ex.getMessage());
        }

        InputStream inputStream = null;
        try {
            Part filePart = request.getPart("formFile");
            if (filePart.getSize() > 0) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }
        } catch (Exception ex) {
            System.out.println("formFile: " + ex.getMessage());
        }

        try {

            if (estado.equalsIgnoreCase("insert")) {
                Arc.setID(0);
                if (inputStream != null) {
                    Arc.setData(inputStream);
                }
                lArc.InsertarArchivo(Arc, DNI, ID);
            } else if(estado.equalsIgnoreCase("insertPDFProyecto")){
                Arc.setID(0);
                if (inputStream != null) {
                    Arc.setData(inputStream);
                }
                lArc.InsertarArchivo(Arc, DNI, ID);
                RequestDispatcher view = request.getRequestDispatcher("/ArchivosProyecto.jsp");
                view.forward(request, response);
            }else if (estado.equalsIgnoreCase("insertMovimiento")) {
                Arc.setID(0);
                String IDArchivo = "null";
                ID = Integer.parseInt(request.getParameter("InputID"));
                DNI = request.getParameter("InputDNI");
                tipo = request.getParameter("InputTipo");
                lMovimiento lGas = new lMovimiento();
                Movimiento gas = new Movimiento("0",
                        request.getParameter("InputTitulo"),
                        request.getParameter("InputDescripcion"),
                        request.getParameter("InputMoney"),
                        request.getParameter("InputRuc"),
                        request.getParameter("InputRazonSocial"),
                        "0/0/0","0");

                if (inputStream != null) {
                    Arc.setData(inputStream);
                    lArc.InsertarArchivo(Arc, DNI, ID);
                    IDArchivo = lArc.UltimoArchivo();
                }

                lGas.GenerarGasto(gas, ID, IDArchivo,tipo);
                RequestDispatcher view = request.getRequestDispatcher("/MenuProyecto.jsp");
                view.forward(request, response);
            } else {
                Arc.setID(id_pdf);
                if (inputStream != null) {
                    Arc.setData(inputStream);
                    lArc.ModificarPDF(Arc);
                } else {
                    lArc.ModificarPDF2(Arc);
                }
            }
        } catch (Exception ex) {
            System.out.println("textos: " + ex.getMessage());
        }

        RequestDispatcher view = request.getRequestDispatcher("/Archivos.jsp");
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
