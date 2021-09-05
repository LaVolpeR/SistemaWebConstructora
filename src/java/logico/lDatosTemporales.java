/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.DatosTemporales;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lDatosTemporales {

    public static ArrayList lDatTem = new ArrayList();
    conexion con = new conexion();

    public void ListarReporteActividadDia(String IDProyecto) {
        try {
            con.consulta("exec sp_ListarReporteActividadDia " + IDProyecto);
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
        } catch (SQLException e) {
        }
    }

    public void sp_ListarReporteActividadDia(String IDProyecto, String IDEstado) {
        try {
            con.consulta("exec sp_ListarReporteActividadDiaXestado " + IDProyecto + "," + IDEstado);
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
        } catch (SQLException e) {
        }
    }

    public void ListarReporteActividadSemana(int Annio, int Mes, int Dia, String IDProyecto) {
        try {
            con.consulta("sp_ListarReporteActividadSemana " + IDProyecto + " , '" + Annio + "-" + Mes + "-" + Dia + "'");
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
}
