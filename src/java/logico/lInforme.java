/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Informe;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author ramir
 */
public class lInforme {

    Locale locale = new Locale("es", "PE");
    TimeZone tz = TimeZone.getTimeZone("America/Lima");
    Calendar c = Calendar.getInstance(tz, locale);
    Calendar cal = GregorianCalendar.getInstance(tz, locale);
    int dia = Integer.parseInt(Integer.toString(cal.get(Calendar.DATE)));
    int mes = Integer.parseInt(Integer.toString(cal.get(Calendar.MONTH))) + 1;
    int annio = Integer.parseInt(Integer.toString(cal.get(Calendar.YEAR)));
    int hour = Integer.parseInt(Integer.toString(cal.get(Calendar.HOUR_OF_DAY)));
    int min = Integer.parseInt(Integer.toString(cal.get(Calendar.MINUTE)));
    
    public static ArrayList lInf = new ArrayList();
    conexion con = new conexion();

    public void InsertarInforme(String Titulo, String Descripcion, String DNI, int IDProyecto) {
        try {
            con.getSt().execute("exec GenerarInforme '" + Titulo + "','" + Descripcion + "','" + DNI + "'," + IDProyecto+",'"+annio +"-"+mes+"-"+dia +" " + hour + ":" + min+":00'");
        } catch (Exception e) {
        }
    }

    public void ListarInformeDni(String DNI) {
        lInf.clear();
        try {
            con.consulta("select * from INFORME where TRABAJADOR_dni = '" + DNI + "'");
            while (con.getRs().next()) {
                Informe Inf = new Informe(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7),
                        con.getRs().getString(8),
                        con.getRs().getString(9));
                lInf.add(Inf);
            }
        } catch (Exception e) {
        }
        
    }

    public void ListarInformeProyectoXEstado(String IdProyecto, int IDEstado) {
        lInf.clear();
        try {
            con.consulta("select * from INFORME where PROYECTO_id = " + IdProyecto + " and ESTADO_id = " + IDEstado);
            while (con.getRs().next()) {
                Informe Inf = new Informe(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7),
                        con.getRs().getString(8),
                        con.getRs().getString(9));
                lInf.add(Inf);
            }
        } catch (Exception e) {
        }
        System.out.print(annio +"-"+mes+"-"+dia +" " + hour + ":" + min);
    }

    public void InsertarSolucion(String Solucion, String InformeID) {
        try {
            con.getSt().execute("exec InsertarSolucion '" + Solucion + "'," + InformeID +",'"+annio +"-"+mes+"-"+dia +" " + hour + ":" + min+":00'");
        } catch (Exception e) {
        }

    }
}
