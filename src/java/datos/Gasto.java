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

    private String ID, Descripcion;
    private float money;
    private String RUC, RazonSocial;

    public Gasto() {
    }

    public Gasto(String ID, String Descripcion, float money, String RUC, String RazonSocial) {
        this.ID = ID;
        this.Descripcion = Descripcion;
        this.money = money;
        this.RUC = RUC;
        this.RazonSocial = RazonSocial;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
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

    @Override
    public String toString() {
        return "Gasto{" + "ID=" + ID + ", Descripcion=" + Descripcion + ", money=" + money + ", RUC=" + RUC + ", RazonSocial=" + RazonSocial + '}';
    }
    
    
}
