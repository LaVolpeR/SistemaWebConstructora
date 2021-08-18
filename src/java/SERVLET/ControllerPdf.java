package SERVLET;

import datos.Archivo;
import datos.Gasto;
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
import logico.lGasto;

@WebServlet(name = "ControllerPdf", urlPatterns = {"/ControllerPdf"})
@MultipartConfig(maxFileSize = 161772150)    // upload file's size up to 16MB

public class ControllerPdf extends HttpServlet {

    public static final String lIST_STUDENT = "/Archivos.jsp";
    public static final String INSERT_OR_EDIT = "/GuardarPDF.jsp";
    public static final String INSERT_GASTO = "/RegistroGasto.jsp";
    String estado = null;
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
            forward = INSERT_OR_EDIT;
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
            forward = INSERT_OR_EDIT;
            estado = "insert";
        } else if (action.equalsIgnoreCase("insertGasto")) {
            forward = INSERT_GASTO;
            estado = "insertGasto";
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
            } else if (estado.equalsIgnoreCase("insertGasto")) {
                Arc.setID(0);
                String IDArchivo = "null";
                ID = Integer.parseInt(request.getParameter("InputID"));
                DNI = request.getParameter("InputDNI");
                lGasto lGas = new lGasto();
                Gasto gas = new Gasto("0",
                        request.getParameter("InputTitulo"),
                        request.getParameter("InputDescripcion"),
                        Float.parseFloat(request.getParameter("InputMoney")),
                        request.getParameter("InputRuc"),
                        request.getParameter("InputRazonSocial"),
                        "0/0/0");

                if (inputStream != null) {
                    Arc.setData(inputStream);
                    lArc.InsertarArchivo(Arc, DNI, ID);
                    IDArchivo = lArc.UltimoArchivo();
                }

                lGas.GenerarGasto(gas, ID, IDArchivo);
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
