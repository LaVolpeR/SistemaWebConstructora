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
public class DatosTemporales {

    private String dato, dato1, dato2, dato3, dato4, dato5, dato6, dato7, dato8, dato9;

    public DatosTemporales() {
        this.dato = "NN";
        this.dato1 = "NN";
        this.dato2 = "NN";
        this.dato3 = "NN";
        this.dato4 = "NN";
        this.dato5 = "NN";
        this.dato6 = "NN";
        this.dato7 = "NN";
        this.dato8 = "NN";
        this.dato9 = "NN";
    }

    public DatosTemporales(String dato, String dato1, String dato2, String dato3, String dato4, String dato5, String dato6, String dato7, String dato8, String dato9) {
        this.dato = dato;
        this.dato1 = dato1;
        this.dato2 = dato2;
        this.dato3 = dato3;
        this.dato4 = dato4;
        this.dato5 = dato5;
        this.dato6 = dato6;
        this.dato7 = dato7;
        this.dato8 = dato8;
        this.dato9 = dato9;
    }

    public String getDato() {
        return dato;
    }

    public void setDato(String dato) {
        this.dato = dato;
    }

    public String getDato1() {
        return dato1;
    }

    public void setDato1(String dato1) {
        this.dato1 = dato1;
    }

    public String getDato2() {
        return dato2;
    }

    public void setDato2(String dato2) {
        this.dato2 = dato2;
    }

    public String getDato3() {
        return dato3;
    }

    public void setDato3(String dato3) {
        this.dato3 = dato3;
    }

    public String getDato4() {
        return dato4;
    }

    public void setDato4(String dato4) {
        this.dato4 = dato4;
    }

    public String getDato5() {
        return dato5;
    }

    public void setDato5(String dato5) {
        this.dato5 = dato5;
    }

    public String getDato6() {
        return dato6;
    }

    public void setDato6(String dato6) {
        this.dato6 = dato6;
    }

    public String getDato7() {
        return dato7;
    }

    public void setDato7(String dato7) {
        this.dato7 = dato7;
    }

    public String getDato8() {
        return dato8;
    }

    public void setDato8(String dato8) {
        this.dato8 = dato8;
    }

    public String getDato9() {
        return dato9;
    }

    public void setDato9(String dato9) {
        this.dato9 = dato9;
    }

    @Override
    public String toString() {
        return "DatosTemporales{" + "dato=" + dato + ", dato1=" + dato1 + ", dato2=" + dato2 + ", dato3=" + dato3 + ", dato4=" + dato4 + ", dato5=" + dato5 + ", dato6=" + dato6 + ", dato7=" + dato7 + ", dato8=" + dato8 + ", dato9=" + dato9 + '}';
    }
    
    
}
