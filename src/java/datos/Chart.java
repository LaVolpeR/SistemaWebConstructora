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
public class Chart {
    int Annio,Mes,Dia;

    public Chart() {
    }

    public Chart(int Annio, int Mes, int Dia) {
        this.Annio = Annio;
        this.Mes = Mes;
        this.Dia = Dia;
    }

    public int getAnnio() {
        return Annio;
    }

    public void setAnnio(int Annio) {
        this.Annio = Annio;
    }

    public int getMes() {
        return Mes;
    }

    public void setMes(int Mes) {
        this.Mes = Mes;
    }

    public int getDia() {
        return Dia;
    }

    public void setDia(int Dia) {
        this.Dia = Dia;
    }

    @Override
    public String toString() {
        return "Chart{" + "Annio=" + Annio + ", Mes=" + Mes + ", Dia=" + Dia + '}';
    }

    
    
}
