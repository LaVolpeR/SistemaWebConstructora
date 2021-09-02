/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Proyecto;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lProyecto {

    public static ArrayList lPro = new ArrayList();
    conexion con = new conexion();

    public void CrearProyecto(Proyecto pro, String DNI) {
        try {
            con.getSt().executeUpdate("insert into Proyecto values ('"
                    + pro.getTitulo() + "','"
                    + pro.getFechaInicio() + "','"
                    + pro.getFechaFin() + "','"
                    + pro.getDescripcion() + "','"
                    + pro.getNombreCliente() + "','"
                    + pro.getDireccion() + "',0,'"
                    + DNI + "')");
            System.out.print("la creacion del proyecto fue un exito");
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public void ListarProyectos(String DNI) {
        try {
            con.consulta("select * from PROYECTO where  TRABAJADOR_dni = '" + DNI + "'");
            lPro.clear();
            while (con.getRs().next()) {
                Proyecto pro = new Proyecto(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7));
                lPro.add(pro);
                System.out.print("Se cargo los proyectos del trabajador"+DNI+" fue un exito");
            }
        } catch (Exception e) {
            System.out.print(e);
        }
    }
    public String TituloProyecto(int ID) {
        String Titulo = "nn";
        try {
            con.consulta("select concat('Proyecto N°',Proyecto.Proyecto_id, ' - ',Proyecto.PROYECTO_titulo ) from PROYECTO where Proyecto_id = "
                    + ID);
            con.getRs().next();
            Titulo = con.getRs().getString(1);
            System.out.print("Se obtuvo el titulo");
        } catch (Exception e) {

            System.out.print("TituloProyectoArchivo "+e);
        }
        return Titulo;
    }
    
    public void InsertarPlanilla(String DNI, String ID){
        try {
            con.getSt().executeUpdate("exec sp_InsertarPlanilla "+DNI+" , "+ ID);
        } catch (Exception e) {
            System.out.println(e + "InsertarPlanilla");
        }
    }
    
}
