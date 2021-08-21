/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logico;

import datos.Chart;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author ramir
 */
public class lChart {

    public static ArrayList lCha = new ArrayList();

    conexion con = new conexion();

    public String SumaMesMovimiento(String Tipo, String Proyecto, int Mes) {
        String moneyTotal = "0";
        try {
            con.consulta("exec sp_SumMesMovimiento '" + Tipo + "','" + Proyecto + "','" + Mes + "'");
            con.getRs().next();
            if (con.getRs().getString(1) != null) {
                moneyTotal = con.getRs().getString(1);
            }
            System.out.print("try/SumaMesMovimiento :" + Tipo + "/" + Proyecto + "/" + Mes + "/" + moneyTotal);
        } catch (Exception e) {
            System.out.print("catch/SumaMesMovimiento" + e);
        }
        return moneyTotal;
    }

    public int DiasTotalMes(int mes, int annio) {
        int i = 0;
        int mes2 = 0;
        int annio2 = 0;
        mes2 = mes + 1;
        try {
            if (mes == 12) {
                annio2 = annio++;
                con.consulta("select DATEDIFF(day,'" + annio + "/" + mes + "/01','" + annio + "/1/01')");
            } else {
                con.consulta("select DATEDIFF(day,'" + annio + "/" + mes + "/01','" + annio + "/" + mes2 + "/01')");
            }
            con.getRs().next();
            i = con.getRs().getInt(1);
            System.out.print("try/DiasTotalMes " + annio + "/" + mes + "/" + mes2 + " : " + i);
        } catch (Exception e) {
            System.out.print("catch/DiasTotalMes :" + e);
        }
        return i;
    }

    public String SumaDiaMesMovimiento(String Tipo, String Proyecto, int Mes, int Dia) {
        String Moneytotal = "0";
        try {
            con.consulta("exec sp_SumDiaMesMovimiento '" + Tipo + "','" + Proyecto + "'," + Mes + "," + Dia);
            con.getRs().next();
            if (con.getRs().getString(1) != null) {
                Moneytotal = con.getRs().getString(1);
            }
        } catch (Exception e) {
        }
        return Moneytotal;
    }

    public void ListarGastoSemana( int Annio, int Mes, int Dia) {
        lCha.clear();
        try {
            con.consulta("select DATENAME(weekday,'" + Annio + "/" + Mes + "/" + Dia + "');");
            con.getRs().next();
            Chart cha = new Chart();
            switch (con.getRs().getString(1)) {
                case "Monday":
                    cha = new Chart(Annio, Mes, Dia);
                    lCha.add(cha);
                    System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                    break;
                case "Tuesday":
                    for (int i = 1; i >= 0; i--) {
                        if (Dia == 0) {
                            Mes--;
                            if (Mes == 0) {
                                Mes = 12;
                                Annio--;
                                Dia = 31;
                            } else {
                                Dia = DiasTotalMes(Mes, Annio);
                            }
                        }
                        cha = new Chart(Annio, Mes, Dia);
                        lCha.add(cha);
                        System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                        Dia--;
                    }
                    break;
                case "Wednesday":
                    for (int i = 2; i >= 0; i--) {

                        if (Dia == 0) {
                            Mes--;
                            if (Mes == 0) {
                                Mes = 12;
                                Annio--;
                                Dia = 31;
                            } else {
                                Dia = DiasTotalMes(Mes, Annio);
                            }
                        }
                        cha = new Chart(Annio, Mes, Dia);
                        lCha.add(cha);
                        System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                        Dia--;
                    }
                    break;
                case "Thursday":
                    for (int i = 3; i >= 0; i--) {
                        if (Dia == 0) {
                            Mes--;
                            if (Mes == 0) {
                                Mes = 12;
                                Annio--;
                                Dia = 31;
                            } else {
                                Dia = DiasTotalMes(Mes, Annio);
                            }
                        }
                        cha = new Chart(Annio, Mes, Dia);
                        lCha.add(cha);
                        System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                        Dia--;
                    }
                    break;
                case "Friday":
                    for (int i = 4; i >= 0; i--) {
                        if (Dia == 0) {
                            Mes--;
                            if (Mes == 0) {
                                Mes = 12;
                                Annio--;
                                Dia = 31;
                            } else {
                                Dia = DiasTotalMes(Mes, Annio);
                            }
                        }
                        cha = new Chart(Annio, Mes, Dia);
                        lCha.add(cha);
                        System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                        Dia--;
                    }
                    break;
                case "Saturday":
                    for (int i = 5; i > 0; i--) {
                        if (Dia == 0) {
                            Mes--;
                            if (Mes == 0) {
                                Mes = 12;
                                Annio--;
                                Dia = 31;
                            } else {
                                Dia = DiasTotalMes(Mes, Annio);
                            }
                        }
                        cha = new Chart(Annio, Mes, Dia);
                        
                        lCha.add(cha);
                        System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                        Dia--;
                    }
                    break;
                case "Sunday":
                    for (int i = 6; i >= 0; i--) {

                        if (Dia == 0) {
                            Mes--;
                            if (Mes == 0) {
                                Mes = 12;
                                Annio--;
                                Dia = 31;
                            } else {
                                Dia = DiasTotalMes(Mes, Annio);
                            }
                        }
                        cha = new Chart(Annio, Mes, Dia);
                        lCha.add(cha);
                        System.out.println("ListarGastoSemana :" + Annio + "/" + Mes + "/" + Dia);
                        Dia--;
                    }
                    break;
                default:
            }
        } catch (Exception e) {
        }
    }

    public String SumDiaSemanaMovimiento(int Dia,int Mes,int Annio,int Tipo,int Proyecto){
        String MoneyTotal = "0";
        try {
            con.consulta("exec sp_sumDia "+Dia+","+Mes+","+Annio+","+Tipo+","+Proyecto);
            con.getRs().next();
            if (con.getRs().getString(1) != null) {
                MoneyTotal = con.getRs().getString(1);
            }
            System.out.print("try/SumDiaSemanaMovimiento"+Annio+"/"+Mes+"/"+Dia+" :"+ MoneyTotal);
        } catch (Exception e) {
            System.out.print("catch/SumDiaSemanaMovimiento :"+ e);
        }
        return MoneyTotal;
    }
}
