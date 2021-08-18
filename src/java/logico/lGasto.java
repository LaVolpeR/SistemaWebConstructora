/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Gasto;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lGasto {

    public static ArrayList lGas = new ArrayList();
    conexion con = new conexion();

    public void GenerarGasto(Gasto gas, int ID_proyecto, String ID_Archivo) {
        try {
           
            con.getSt().executeUpdate("exec sp_Gasto '"
                    + gas.getTitulo() + "','"
                    + gas.getDescripcion() + "',"
                    + gas.getMoney() + ",'"
                    + gas.getRUC() + "','"
                    + gas.getRazonSocial() + "',"
                    + ID_proyecto + ","
                    + ID_Archivo);
        } catch (Exception e) {
            System.out.print("lGasto = "+e);
        }
    }
}
