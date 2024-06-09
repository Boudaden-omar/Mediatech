package com.example.data_base_project.bean;

public class ProduitAvecDemande {

    private  int id_prod;
    private  String designation;
    private  int qte_stock;

    private  String demande;
    public  ProduitAvecDemande(){
    }

    public ProduitAvecDemande(int id_prod, String designation, int qte_stock, String demande) {
        this.id_prod = id_prod;
        this.designation = designation;
        this.qte_stock = qte_stock;
        this.demande = demande;
    }

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public int getQte_stock() {
        return qte_stock;
    }

    public void setQte_stock(int qte_stock) {
        this.qte_stock = qte_stock;
    }

    public String getDemande() {
        return demande;
    }

    public void setDemande(String demande) {
        this.demande = demande;
    }
}
