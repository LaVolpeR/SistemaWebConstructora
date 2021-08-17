/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

/**
 *
 * @author ramir
 */
public class Proyecto {
    private String ID,titulo, fechaInicio, fechaFin, descripcion, nombreCliente,direccion;

    public Proyecto() {
        this.ID = "NN";
        this.titulo = "NN";
        this.fechaInicio = "NN";
        this.fechaFin = "NN";
        this.descripcion = "NN";
        this.nombreCliente = "NN";
        this.direccion = "NN";
    }

    public Proyecto(String ID, String titulo, String fechaInicio, String fechaFin, String descripcion, String nombreCliente, String direccion) {
        this.ID = ID;
        this.titulo = titulo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descripcion = descripcion;
        this.nombreCliente = nombreCliente;
        this.direccion = direccion;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "Proyecto{" + "ID=" + ID + ", titulo=" + titulo + ", fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin + ", descripcion=" + descripcion + ", nombreCliente=" + nombreCliente + ", direccion=" + direccion + '}';
    }

    
}
