/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import java.io.InputStream;

/**
 *
 * @author ramir
 */
public class Archivo {

    private int ID;
    private String titulo, fecha;
    private InputStream data;
    private byte[] data2;
    private String descripcion, proyecto, propietario;

    public Archivo() {
    }

    public Archivo(int ID, String titulo, String fecha, byte[] data2, String descripcion, String proyecto, String propietario) {
        this.ID = ID;
        this.titulo = titulo;
        this.fecha = fecha;
        this.data2 = data2;
        this.descripcion = descripcion;
        this.proyecto = proyecto;
        this.propietario = propietario;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public InputStream getData() {
        return data;
    }

    public void setData(InputStream data) {
        this.data = data;
    }

    public byte[] getData2() {
        return data2;
    }

    public void setData2(byte[] data2) {
        this.data2 = data2;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    @Override
    public String toString() {
        return "Archivo{" + "ID=" + ID + ", titulo=" + titulo + ", fecha=" + fecha + ", data=" + data + ", data2=" + data2 + ", descripcion=" + descripcion + ", proyecto= " + proyecto + ", propietario=" + propietario + '}';
    }

}
