/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Puesto;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lPuesto {
    public static ArrayList lPue = new ArrayList();
    conexion con = new conexion();
    
    public void MostrarPuestos(){
        try {
            con.consulta("Select * from Puesto");
            lPue.clear();
            while (con.getRs().next()) {                
                Puesto pue = new Puesto(con.getRs().getString(1), con.getRs().getString(2));
                lPue.add(pue);
            }
        } catch (Exception e) {
        }
    }
    public void UpdateTrabajadorPuesto(String DNI, String ID){
        try {
            con.getSt().executeUpdate("update Trabajador set PUESTO_id = "+ID+" where TRABAJADOR_dni = '"+DNI+"'");
        } catch (Exception e) {
        }
    }
}
