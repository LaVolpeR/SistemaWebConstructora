/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Archivo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ramir
 */
public class lArchivos {

    public static ArrayList lArc = new ArrayList();
    conexion con = new conexion();
    Connection conn;

    public void ListarArchivos() {
        lTrabajador lTra = new lTrabajador();
        String nombre = "nn";
        String TituloProyecto = "nn";
        
        try {
            con.consulta("select * from ARCHIVO");
            lArc.clear();
            while (con.getRs().next()) {
                nombre = lTra.Nombre(con.getRs().getString(7));

                Archivo arc = new Archivo(con.getRs().getInt(1),
                        con.getRs().getString(2),
                        con.getRs().getString(3),
                        con.getRs().getBytes(4),
                        con.getRs().getString(5),
                        con.getRs().getString(6),
                        nombre);
                lArc.add(arc);
                System.out.print("Se obtuvo los archivos");
            }
        } catch (Exception e) {
            System.out.print(e + "ListarArchivos ");
        }
    }

    public void InsertarArchivo(Archivo arc, String DNI, int ID) {
        String sql = "exec sp_GuardarArchivo ? , ?,?,?,?";
        PreparedStatement ps = null;
        try {
            ps = con.getCon().prepareStatement(sql);
            ps.setString(1, arc.getTitulo());
            ps.setBlob(2, arc.getData());
            ps.setString(3, arc.getDescripcion());
            ps.setInt(4, ID);
            ps.setString(5, DNI);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public void ModificarPDF(Archivo arc) {
        String sql = "update ARCHIVO SET Archivo_titulo = ?, Archivo_data = ? where Archivo_id = ?";
        PreparedStatement ps = null;
        try {
            ps = con.getCon().prepareStatement(sql);
            ps.setString(1, arc.getTitulo());
            ps.setBlob(2, arc.getData());
            ps.setInt(3, arc.getID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public void ModificarPDF2(Archivo arc) {
        String sql = "update ARCHIVO SET Archivo_titulo = ? where Archivo_id = ?";
        PreparedStatement ps = null;
        try {
            ps = con.getCon().prepareStatement(sql);
            ps.setString(1, arc.getTitulo());
            ps.setInt(3, arc.getID());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.print(e);
        }
    }

    public void EliminarPDF(int id) {
        try {
            con.getSt().executeUpdate("delete from ARCHIVO where ARCHIVO_ID = '" + id + "'");
        } catch (Exception e) {
        }
    }

    public Archivo getArchivoID(int studentID) {
        Archivo arc = new Archivo();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        String sql = "select * from ARCHIVO where ARCHIVO_id = ?";
        try {
            preparedStatement = con.getCon().prepareStatement(sql);
            preparedStatement.setInt(1, studentID);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                arc.setID(rs.getInt(1));
                arc.setTitulo(rs.getString(2));
                arc.setFecha(rs.getString(3));
                arc.setData2(rs.getBytes(4));
                arc.setDescripcion(rs.getString(5));
                arc.setProyecto(rs.getString(6));
                arc.setPropietario(rs.getString(7));
            }
        } catch (Exception e) {
        }
        return arc;
    }

    
}
