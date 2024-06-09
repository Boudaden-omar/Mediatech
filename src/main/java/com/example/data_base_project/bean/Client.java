package com.example.data_base_project.bean;


public class Client {
    private int id_clt;
    private String nom;
    private String prenom;
    private int tel;

    public Client(int id_clt, String nom, String prenom, int tel) {
        this.id_clt = id_clt;
        this.nom = nom;
        this.prenom = prenom;
        this.tel = tel;
    }

    public Client() {

    }

    public Client(String nom, String prenom, int telephone) {
        this.nom = nom;
        this.prenom = prenom;
        this.tel = telephone;
    }

    public int getId_clt() {
        return id_clt;
    }

    public void setId_clt(int id_clt) {
        this.id_clt = id_clt;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }


}
