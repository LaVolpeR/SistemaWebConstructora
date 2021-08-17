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
public class Trabajador {
    private String DNI,Nombre,apellido,telefono,correo,password;

    public Trabajador() {
        this.DNI = "NN";
        this.Nombre = "NN";
        this.apellido = "NN";
        this.telefono = "123456789";
        this.correo = "NN";
        this.password = "NN";
    }
    
    

    public Trabajador(String DNI, String Nombre, String apellido, String telefono, String correo, String password) {
        this.DNI = DNI;
        this.Nombre = Nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.correo = correo;
        this.password = password;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Trabajador{" + "DNI=" + DNI + ", Nombre=" + Nombre + ", apellido=" + apellido + ", telefono=" + telefono + ", correo=" + correo + ", password=" + password + '}';
    }
    
}
