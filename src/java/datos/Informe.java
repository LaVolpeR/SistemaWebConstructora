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
public class Informe {
    private String ID,Titulo,Descripcion,Fecha,Fechasolucion,Solucion,EstadoID,TrabajadorDNI,ProyectoID;

    public Informe() {
    }

    public Informe(String ID, String Titulo, String Descripcion, String Fecha, String Fechasolucion, String Solucion, String EstadoID, String TrabajadorDNI, String ProyectoID) {
        this.ID = ID;
        this.Titulo = Titulo;
        this.Descripcion = Descripcion;
        this.Fecha = Fecha;
        this.Fechasolucion = Fechasolucion;
        this.Solucion = Solucion;
        this.EstadoID = EstadoID;
        this.TrabajadorDNI = TrabajadorDNI;
        this.ProyectoID = ProyectoID;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getFechasolucion() {
        return Fechasolucion;
    }

    public void setFechasolucion(String Fechasolucion) {
        this.Fechasolucion = Fechasolucion;
    }

    public String getSolucion() {
        return Solucion;
    }

    public void setSolucion(String Solucion) {
        this.Solucion = Solucion;
    }

    public String getEstadoID() {
        return EstadoID;
    }

    public void setEstadoID(String EstadoID) {
        this.EstadoID = EstadoID;
    }

    public String getTrabajadorDNI() {
        return TrabajadorDNI;
    }

    public void setTrabajadorDNI(String TrabajadorDNI) {
        this.TrabajadorDNI = TrabajadorDNI;
    }

    public String getProyectoID() {
        return ProyectoID;
    }

    public void setProyectoID(String ProyectoID) {
        this.ProyectoID = ProyectoID;
    }

    @Override
    public String toString() {
        return "Informe{" + "ID=" + ID + ", Titulo=" + Titulo + ", Descripcion=" + Descripcion + ", Fecha=" + Fecha + ", Fechasolucion=" + Fechasolucion + ", Solucion=" + Solucion + ", EstadoID=" + EstadoID + ", TrabajadorDNI=" + TrabajadorDNI + ", ProyectoID=" + ProyectoID + '}';
    }
    
}
