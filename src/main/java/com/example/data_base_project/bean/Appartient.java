package com.example.data_base_project.bean;

public class Appartient {
    private  int  id_fact ;
    private  int id_prod ;
    private  int qte_achetee;

    public int getId_fact() {
        return id_fact;
    }

    public void setId_fact(int id_fact) {
        this.id_fact = id_fact;
    }

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public int getQte_achetee() {
        return qte_achetee;
    }

    public void setQte_achetee(int qte_achetee) {
        this.qte_achetee = qte_achetee;
    }

    public  Appartient(){}
    public Appartient(int id_fact, int id_prod, int qte_achetee) {
        this.id_fact = id_fact;
        this.id_prod = id_prod;
        this.qte_achetee = qte_achetee;
    }
}
