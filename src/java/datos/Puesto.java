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
public class Puesto {
    String ID,nombre;

    public Puesto() {
    }

    public Puesto(String ID, String nombre) {
        this.ID = ID;
        this.nombre = nombre;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Puesto{" + "ID=" + ID + ", nombre=" + nombre + '}';
    }
    
}
