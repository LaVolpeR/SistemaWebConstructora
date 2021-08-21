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
public class Planilla {
    private String fecha, DNI,Proyecto;

    public Planilla() {
    }

    public Planilla(String fecha, String DNI, String Proyecto) {
        this.fecha = fecha;
        this.DNI = DNI;
        this.Proyecto = Proyecto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getProyecto() {
        return Proyecto;
    }

    public void setProyecto(String Proyecto) {
        this.Proyecto = Proyecto;
    }

    @Override
    public String toString() {
        return "Planilla{" + "fecha=" + fecha + ", DNI=" + DNI + ", Proyecto=" + Proyecto + '}';
    }
    
}
