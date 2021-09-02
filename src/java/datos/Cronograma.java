/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.time.LocalTime;

/**
 *
 * @author ramir
 */
public class Cronograma {
    private String ID, Titulo, FechaInico,FechaFin, HoraIncio,HoraFin,FechaMod,Descripcion , EstadoId,TrabajadorDNI,ProyectoId;

    public Cronograma() {
    }

    public Cronograma(String ID, String Titulo, String FechaInico, String FechaFin, String HoraIncio, String HoraFin, String FechaMod, String Descripcion, String EstadoId, String TrabajadorDNI, String ProyectoId) {
        this.ID = ID;
        this.Titulo = Titulo;
        this.FechaInico = FechaInico;
        this.FechaFin = FechaFin;
        this.HoraIncio = HoraIncio;
        this.HoraFin = HoraFin;
        this.FechaMod = FechaMod;
        this.Descripcion = Descripcion;
        this.EstadoId = EstadoId;
        this.TrabajadorDNI = TrabajadorDNI;
        this.ProyectoId = ProyectoId;
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

    public String getFechaInico() {
        return FechaInico;
    }

    public void setFechaInico(String FechaInico) {
        this.FechaInico = FechaInico;
    }

    public String getFechaFin() {
        return FechaFin;
    }

    public void setFechaFin(String FechaFin) {
        this.FechaFin = FechaFin;
    }

    public String getHoraIncio() {
        return HoraIncio;
    }

    public void setHoraIncio(String HoraIncio) {
        this.HoraIncio = HoraIncio;
    }

    public String getHoraFin() {
        return HoraFin;
    }

    public void setHoraFin(String HoraFin) {
        this.HoraFin = HoraFin;
    }

    public String getFechaMod() {
        return FechaMod;
    }

    public void setFechaMod(String FechaMod) {
        this.FechaMod = FechaMod;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getEstadoId() {
        return EstadoId;
    }

    public void setEstadoId(String EstadoId) {
        this.EstadoId = EstadoId;
    }

    public String getTrabajadorDNI() {
        return TrabajadorDNI;
    }

    public void setTrabajadorDNI(String TrabajadorDNI) {
        this.TrabajadorDNI = TrabajadorDNI;
    }

    public String getProyectoId() {
        return ProyectoId;
    }

    public void setProyectoId(String ProyectoId) {
        this.ProyectoId = ProyectoId;
    }

    @Override
    public String toString() {
        return "Cronograma{" + "ID=" + ID + ", Titulo=" + Titulo + ", FechaInico=" + FechaInico + ", FechaFin=" + FechaFin + ", HoraIncio=" + HoraIncio + ", HoraFin=" + HoraFin + ", FechaMod=" + FechaMod + ", Descripcion=" + Descripcion + ", EstadoId=" + EstadoId + ", TrabajadorDNI=" + TrabajadorDNI + ", ProyectoId=" + ProyectoId + '}';
    }

    
    
}
