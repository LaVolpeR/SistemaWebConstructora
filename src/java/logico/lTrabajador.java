/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.DatosTemporales;
import datos.Trabajador;
import java.sql.Connection;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lTrabajador {

    public static ArrayList lTra = new ArrayList();
    conexion con = new conexion();
    Connection conn;

    public void RegistrarTrabajador(Trabajador temp) {
        try {
            con.getSt().executeUpdate("exec SP_CreacionUsuario '"
                    + temp.getDNI() + "','"
                    + temp.getNombre() + "','"
                    + temp.getApellido() + "','"
                    + temp.getTelefono() + "','"
                    + temp.getCorreo() + "','"
                    + temp.getPassword() + "'");
            System.out.print("El Registro del Trabajador fue un exito");
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public String ObtenerPassword(String CORREO) {
        try {
            con.consulta("exec sp_Clave '" + CORREO + "'");
            con.getRs().next();
            String Clave = con.getRs().getString(1);
            System.out.print("Obtencion de Clave exitoso");
            return Clave;
        } catch (Exception e) {
            System.out.print(e);
            return "NN";
        }
    }

    public int Login(String email, String password) {
        int nivel = 0;
        try {
            if (password.equals(ObtenerPassword(email))) {
                con.consulta("select Puesto_id from TRABAJADOR where TRABAJADOR_correo = '" + email + "'");
                while (con.getRs().next()) {
                    nivel = con.getRs().getInt(1);
                }
            }
            conn.close();
        } catch (Exception e) {
            return nivel;
        }
        return nivel;
    }

    public String Codigo(String email, String password) {
        String codigo = "nn";
        try {
            if (password.equals(ObtenerPassword(email))) {
                con.consulta("select TRABAJADOR_dni from TRABAJADOR where TRABAJADOR_correo = '" + email + "'");
                while (con.getRs().next()) {
                    codigo = con.getRs().getString(1);
                }
            }
            conn.close();
        } catch (Exception e) {
            return codigo;
        }
        return codigo;
    }

    public String Nombre(String DNI) {
        String nombre = "nn";
        try {
            con.consulta("select TRABAJADOR_nombre from TRABAJADOR where TRABAJADOR_DNI = '" + DNI + "'");
            while (con.getRs().next()) {
                nombre = con.getRs().getString(1);
            }
            conn.close();
        } catch (Exception e) {
            return nombre;
        }
        return nombre;
    }

    public void ListarTrabajadores(int ID) {
        try {
            con.consulta("exec sp_ListaTrabajadores " + ID);
            lTra.clear();
            while (con.getRs().next()) {
                Trabajador tra = new Trabajador(con.getRs().getString(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getString(4),
                        con.getRs().getString(5),
                        con.getRs().getString(5));
                lTra.add(tra);
            }
        } catch (Exception e) {
        }
    }

    public int UltimoProyecto(String DNI) {
        int ID = 0;
        try {
            con.consulta("select PROYECTO_id from PLANILLA where TRABAJADOR_dni = '" + DNI + "' order by PLANILLA_fechaModificacion DESC;");
            con.getRs().next();
            ID = Integer.parseInt(con.getRs().getString(1));
            System.out.print("Se obtuvo sastifactoriamente DNI:" + DNI + " - " + ID);
        } catch (Exception e) {
            System.out.print(e + "DNI: I");
        }
        return ID;
    }
}
