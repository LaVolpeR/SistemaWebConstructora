/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Movimiento;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author ramir
 */
public class lMovimiento {
    
    Calendar c = Calendar.getInstance();
    
    public static ArrayList lMov = new ArrayList();
    conexion con = new conexion();
    
    public void GenerarGasto(Movimiento gas, int ID_proyecto, String ID_Archivo, String ID_tipo) {
        try {
            
            con.getSt().executeUpdate("exec sp_MoviemientoInsert '"
                    + gas.getTitulo() + "','"
                    + gas.getDescripcion() + "',"
                    + gas.getMoney() + ",'"
                    + gas.getRUC() + "','"
                    + gas.getRazonSocial() + "',"
                    + ID_proyecto + ","
                    + ID_Archivo + ","
                    + ID_tipo);
        } catch (Exception e) {
            System.out.print("lGasto = " + e);
        }
    }
    
    public void MostrarMovimientoMes(String IDProyecto, int mes, int annio) {
        int mes2 = 0;
        int annio2 = 0;
        
        if (mes == 12) {
            mes = 1;
            annio2 = annio + 1;
        } else {
            mes2 = mes + 1;
            annio2 = annio;
        }
        String PDF = null;
        try {
            con.consulta("sp_MostrarMovimiento " + IDProyecto + ",'" + annio + "-" + mes + "-01','" + annio2 + "-" + mes2 + "-01'");
            lMov.clear();
            while (con.getRs().next()) {
                if (con.getRs().getString(8) == null) {
                    PDF = "No";
                } else {
                    PDF = con.getRs().getString(8);
                }
                Movimiento mov = new Movimiento(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7),
                        PDF);
                lMov.add(mov);
                System.out.print("try  / MostrarMovimientoMes exito");
                
            }
        } catch (Exception e) {
            System.out.print("catch  / MostrarMovimientoMes " + mes2 + "-" + e);
        }
    }

    public void MostrarMovimientoSemana(String Fecha) {
        String PDF = null;
        try {
            con.consulta("select TIPO_id,\n"
                    + "MOVIMIENTO_titulo, \n"
                    + "MOVIMIENTO_descripcion,\n"
                    + "MOVIMIENTO_money,\n"
                    + "MOVIMIENTO_RUC,\n"
                    + "MOVIMIENTO_razonSocial,MOVIMIENTO_fecha,\n"
                    + "ARCHIVO_id\n"
                    + "from MOVIMIENTO where PROYECTO_id = 1\n"
                    + "and cast(MOVIMIENTO_fecha as date) = cast('" + Fecha + "' as date)");
            lMov.clear();
            while (con.getRs().next()) {
                if (con.getRs().getString(8) == null) {
                    PDF = "No";
                } else {
                    PDF = con.getRs().getString(8);
                }
                Movimiento mov = new Movimiento(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        con.getRs().getString(7),
                        PDF);
                lMov.add(mov);
                System.out.print("try  / MostrarMovimientoMes exito");
                
            }
        } catch (Exception e) {
        }
    }
}
