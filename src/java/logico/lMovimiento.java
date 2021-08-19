/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Movimiento;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lMovimiento {

    public static ArrayList lGas = new ArrayList();
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
}
