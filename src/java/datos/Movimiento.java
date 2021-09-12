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
public class Movimiento {

    private String ID,Titulo, Descripcion;
    private String money;
    private String RUC, RazonSocial , Fecha,PDf;

    public Movimiento() {
        
    }

    public Movimiento(String ID, String Titulo, String Descripcion, String money, String RUC, String RazonSocial, String Fecha, String PDf) {
        this.ID = ID;
        this.Titulo = Titulo;
        this.Descripcion = Descripcion;
        this.money = money;
        this.RUC = RUC;
        this.RazonSocial = RazonSocial;
        this.Fecha = Fecha;
        this.PDf = PDf;
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

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getRUC() {
        return RUC;
    }

    public void setRUC(String RUC) {
        this.RUC = RUC;
    }

    public String getRazonSocial() {
        return RazonSocial;
    }

    public void setRazonSocial(String RazonSocial) {
        this.RazonSocial = RazonSocial;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getPDf() {
        return PDf;
    }

    public void setPDf(String PDf) {
        this.PDf = PDf;
    }

    @Override
    public String toString() {
        return "Movimiento{" + "ID=" + ID + ", Titulo=" + Titulo + ", Descripcion=" + Descripcion + ", money=" + money + ", RUC=" + RUC + ", RazonSocial=" + RazonSocial + ", Fecha=" + Fecha + ", PDf=" + PDf + '}';
    }

}
