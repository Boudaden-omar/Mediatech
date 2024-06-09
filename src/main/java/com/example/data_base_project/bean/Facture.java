package com.example.data_base_project.bean;

public class Facture {

 private  int   id_fact;
 private String date_fact ;
 private int id_clt;

 public  Facture(){}

    public Facture( String date_fact, int id_clt) {
        this.date_fact = date_fact;
        this.id_clt = id_clt;
    }

    public int getId_fact() {
        return id_fact;
    }

    public void setId_fact(int id_fact) {
        this.id_fact = id_fact;
    }

    public String getDate_fact() {
        return date_fact;
    }

    public void setDate_fact(String date_fact) {
        this.date_fact = date_fact;
    }

    public int getId_clt() {
        return id_clt;
    }

    public void setId_clt(int id_clt) {
        this.id_clt = id_clt;
    }
}
