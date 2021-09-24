/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.DatosTemporales;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author ramir
 */
public class lDatosTemporales {

    public static ArrayList lDatTem = new ArrayList();
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

    public void ListarReporteActividadDia(String IDProyecto) {
        try {
            con.consulta("exec sp_ListarReporteActividadDia " + IDProyecto+",'"+annio +"-"+mes+"-"+dia +" " + hour + ":" + min+":00'");
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (SQLException e) {
        }
    }

    public void ListarReporteActividadCreadaDia(String IDProyecto) {
        try {
            con.consulta("exec sp_ProyectoCreado " + IDProyecto +",'"+annio +"-"+mes+"-"+dia +"'");
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (SQLException e) {
        }
    }

    public void sp_ListarReporteActividadDia(String IDProyecto) {
        try {
            con.consulta("exec sp_ListarReporteActividadDiaXestado " + IDProyecto +",'"+annio +"-"+mes+"-"+dia);
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (SQLException e) {
        }
    }

    public void IngresoGastoTotalProyecto(String IDProyecto) {
        try {
            con.consulta("IngresoGastoTotalProyecto " + IDProyecto);
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        "0",
                        "0",
                        "0",
                        "0",
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (Exception e) {
        }
    }

    public void ListarReporteActividadSemana(String Fecha, String IDProyecto) {
        try {
            con.consulta("sp_ListarReporteActividadSemana " + IDProyecto + " , '" + Fecha + "'");
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        "0",
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (Exception e) {

        }
    }

    public void sp_ListarReporteActividadSemanaXEstado(String IDEstado, String IDProyecto, String Fecha) {
        try {
            con.consulta("sp_ListarReporteActividadSemanaXEstado " + IDEstado + " , " + IDProyecto + " ,'" + Fecha + "'");
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7),
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (Exception e) {

        }
    }

    public void sp_ListarReporteActividadSemanaXEstadoXSemana(String IDProyecto, String Fecha) {
        try {
            con.consulta("sp_ListarReporteActividadSemanaXEstadoXSemana " + IDProyecto + " ,'" + Fecha + "'");
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7),
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }
        } catch (Exception e) {
            System.out.print("sp_ListarReporteActividadSemanaXEstadoXSemana" + e);
        }
    }

    public void sp_ListarReporteActividadSemanaXEstadoXSemanaCreada(String IDProyecto, String Fecha) {
        try {
            con.consulta("sp_ListarReporteActividadSemanaXEstadoXSemanaCreada " + IDProyecto + " ,'" + Fecha + "'");
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }

        } catch (Exception e) {
        }
    }

    public void ListarActividadTotal(String IDProyecto) {
        try {
            con.consulta("exec ListarActividadTotal " + IDProyecto);
            lDatTem.clear();
            while (con.getRs().next()) {
                DatosTemporales DatTem = new DatosTemporales(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        "0",
                        "0",
                        "0",
                        "0");
                lDatTem.add(DatTem);
            }

        } catch (Exception e) {
        }
    }

    public int MostrarposicionSemana() {
        int i = 0;
        try {
            con.consulta("select DATENAME(weekday,getDate())");
            con.getRs().next();
            switch (con.getRs().getString(1)) {
                case "Monday":
                    i = 0;
                    break;
                case "Tuesday":
                    i = 1;
                    break;
                case "Wednesday":
                    i = 2;
                    break;
                case "Thursday":
                    i = 3;
                    break;
                case "Friday":
                    i = 4;
                    break;
                case "Saturday":
                    i = 5;
                    break;
                case "Sunday":
                    i = 6;
                    break;
            }
        } catch (Exception e) {
        }
        return i;
    }

    public String MostrarFechaSemana(int b) {
        String Fecha = null;

        try {
            con.consulta("select getDate()-" + MostrarposicionSemana() + "+" + b);
            con.getRs().next();
            Fecha = con.getRs().getString(1);
        } catch (Exception e) {
        }
        return Fecha;
    }

}
