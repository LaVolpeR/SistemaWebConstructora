/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Planilla;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lPlanilla {

    public static ArrayList lPla = new ArrayList();
    conexion con = new conexion();
    conexion con2 = new conexion();

    public void ListarDNIUltFecha() {
        lPla.clear();
        Planilla Pla = new Planilla();
        try {
            con.consulta("select MAX(PLANILLA_fechaModificacion),TRABAJADOR_dni from PLANILLA Group by TRABAJADOR_dni");
            while (con.getRs().next()) {
                con2.consulta("select PLANILLA.PROYECTO_id from TRABAJADOR,PLANILLA \n"
                        + "where TRABAJADOR.TRABAJADOR_dni = PLANILLA.TRABAJADOR_dni \n"
                        + "and Trabajador.TRABAJADOR_dni = '" + con.getRs().getString(2) + "'\n"
                        + "and Planilla.PLANILLA_fechaModificacion = '" + con.getRs().getString(1) + "'");
                con2.getRs().next();
                Pla = new Planilla(con.getRs().getString(1), con.getRs().getString(2), con2.getRs().getString(1));
                lPla.add(Pla);
                System.out.println("logico.lPlanilla.ListarDNIUltFecha() " + con.getRs().getString(1) + "--" + con.getRs().getString(2) + "--" + con2.getRs().getString(1));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
}
