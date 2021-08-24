/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Cronograma;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lCronograma {

    public static ArrayList lCro = new ArrayList();
    conexion con = new conexion();

    public void InsertActividad(Cronograma cro) {
        try {
            con.getSt().executeUpdate("exec sp_insertCronograma '" + cro.getTitulo() + "','"
                    + cro.getDescripcion() + "','"
                    + cro.getTrabajadorDNI() + "','"
                    + cro.getFechaInico() + "','"
                    + cro.getHoraIncio() + "','"
                    + cro.getFechaFin() + "','"
                    + cro.getHoraFin() + "',"
                    + cro.getProyectoId());
            System.out.print("try InsertActividad: ");
        } catch (Exception e) {
            System.out.print("InsertActividad: "+e);
        }
    }
    public void MostrarCronograma(String IDProyecto){
        
        try {
            con.consulta("select * from CRONOGRAMA where PROYECTO_id = " + IDProyecto);
        lCro.clear();
            while (con.getRs().next()) {                
                Cronograma Cro = new Cronograma(con.getRs().getString(1),
                        con.getRs().getString(2), 
                        con.getRs().getString(3), 
                        con.getRs().getString(4), 
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7), 
                        con.getRs().getString(8), 
                        con.getRs().getString(9));
                lCro.add(Cro);
            }
        } catch (Exception e) {
        }
    }
}
