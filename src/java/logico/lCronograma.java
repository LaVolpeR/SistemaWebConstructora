/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Cronograma;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author ramir
 */
public class lCronograma {

    public static ArrayList lCro = new ArrayList();
    conexion con = new conexion();
    Locale locale = new Locale("es", "PE");
    TimeZone tz = TimeZone.getTimeZone("America/Lima");
    Calendar c = Calendar.getInstance(tz, locale);
    Calendar cal = GregorianCalendar.getInstance(tz, locale);
    int dia = Integer.parseInt(Integer.toString(cal.get(Calendar.DATE)));
    int mes = Integer.parseInt(Integer.toString(cal.get(Calendar.MONTH))) + 1;
    int annio = Integer.parseInt(Integer.toString(cal.get(Calendar.YEAR)));
    int hour = Integer.parseInt(Integer.toString(cal.get(Calendar.HOUR_OF_DAY)));
    int min = Integer.parseInt(Integer.toString(cal.get(Calendar.MINUTE)));

    public void InsertActividad(Cronograma cro) {

        try {
            con.getSt().executeUpdate("exec sp_insertCronograma '" + cro.getTitulo() + "','"
                    + cro.getDescripcion() + "','"
                    + cro.getTrabajadorDNI() + "','"
                    + cro.getFechaInico() + "','"
                    + cro.getHoraIncio() + "','"
                    + cro.getFechaFin() + "','"
                    + cro.getHoraFin() + "',"
                    + cro.getProyectoId()+",'"
                    + annio + "-" + mes + "-" + dia + " " + hour + ":" + min + ":00'");
            System.out.print("try InsertActividad: ");
        } catch (Exception e) {
            System.out.print("InsertActividad: " + e);
        }
    }

    public void ModificarCronograma(String ID, String Descripcion, String Fecha, String Time) {

        try {
            con.getSt().executeUpdate("exec ModCronograma " + ID + ",'" + Descripcion + "','" + Fecha + "','" + Time + "','" + annio + "-" + mes + "-" + dia + " " + hour + ":" + min + ":00'");
            System.out.print("try ModificarCronograma: ");
        } catch (Exception e) {
            System.out.print("ModificarCronograma: " + e);
        }
    }

    public void MostrarCronograma(String IDProyecto) {

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
                        con.getRs().getString(9),
                        con.getRs().getString(10),
                        con.getRs().getString(11),
                        con.getRs().getString(12));
                lCro.add(Cro);
            }
        } catch (Exception e) {
        }
    }

    public void MostrarCronogramaXProyectoXEstado(String ProyectoId, String EstadoID) {
        try {
            con.consulta("select * from CRONOGRAMA where PROYECTO_id = '" + ProyectoId + "' and ESTADO_id = '" + EstadoID + "'");
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
                        con.getRs().getString(9),
                        con.getRs().getString(10),
                        con.getRs().getString(11),
                        con.getRs().getString(12));
                lCro.add(Cro);
            }
        } catch (Exception e) {
        }
    }

    public void MostrarCronogramaXDni(String DNITrabajador) {
        try {
            con.consulta("select * from CRONOGRAMA where TRABAJADOR_dni = '" + DNITrabajador + "'");
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
                        con.getRs().getString(9),
                        con.getRs().getString(10),
                        con.getRs().getString(11),
                        con.getRs().getString(12));
                lCro.add(Cro);
            }
        } catch (Exception e) {
        }
    }

    public void CambiarActividadXVerificar(String ID) {
        try {
            con.getSt().execute("update CRONOGRAMA set ESTADO_id = 3, CRONOGRAMA_fechaMod = getDate() where Cronograma_id = " + ID);
        } catch (Exception e) {
        }
    }

    public void CambiarActividadEnProceso(String ID) {
        try {
            con.getSt().execute("update CRONOGRAMA set ESTADO_id = 1, CRONOGRAMA_fechaMod = getDate() where Cronograma_id = " + ID);
        } catch (Exception e) {
        }
    }

    public void CambiarActividadCompletado(String ID) {
        try {
            con.getSt().execute("update CRONOGRAMA set ESTADO_id = 2, CRONOGRAMA_fechaMod = getDate() where Cronograma_id = " + ID);
        } catch (Exception e) {
        }
    }

    public void ListarCronogramaPersonalXFecha(String DNITrabajador) {
        Calendar c = Calendar.getInstance();
        int dia = Integer.parseInt(Integer.toString(c.get(Calendar.DATE)));
        int mes = Integer.parseInt(Integer.toString(c.get(Calendar.MONTH)));
        mes++;
        int annio = Integer.parseInt(Integer.toString(c.get(Calendar.YEAR)));
        try {
            con.consulta("exec sp_ListarCronogramaXFecha '" + DNITrabajador + "','" + annio + "-" + mes + "-" + dia + "'");
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
                        con.getRs().getString(9),
                        con.getRs().getString(10),
                        con.getRs().getString(11),
                        con.getRs().getString(12));
                lCro.add(Cro);
            }
        } catch (Exception e) {
        }
    }
}
