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
public class Gasto {

    private String ID,Titulo, Descripcion;
    private float money;
    private String RUC, RazonSocial , Fecha;

    public Gasto() {
        this.ID = "NN";
        this.Titulo = "NN";
        this.Descripcion = "NN";
        this.money = 0;
        this.RUC = "NN";
        this.RazonSocial = "NN";
        this.Fecha = "NN";
    }

    public Gasto(String ID, String Titulo, String Descripcion, float money, String RUC, String RazonSocial, String Fecha) {
        this.ID = ID;
        this.Titulo = Titulo;
        this.Descripcion = Descripcion;
        this.money = money;
        this.RUC = RUC;
        this.RazonSocial = RazonSocial;
        this.Fecha = Fecha;
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

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
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

    @Override
    public String toString() {
        return "Gasto{" + "ID=" + ID + ", Titulo=" + Titulo + ", Descripcion=" + Descripcion + ", money=" + money + ", RUC=" + RUC + ", RazonSocial=" + RazonSocial + ", Fecha=" + Fecha + '}';
    }

    
}
