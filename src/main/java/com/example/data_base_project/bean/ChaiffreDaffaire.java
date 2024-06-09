package com.example.data_base_project.bean;

public class ChaiffreDaffaire {
  private  int ID_FACT;
    private  int ID_CLT;
    private  String NOM;
    private String  PRENOM;
    private String DESIGNATION;
    private int PRIX;
    private  int QTE_ACHETEE;
    private int CHIFFRE_AFFAIRE;
    private String CATEGORIE_CLIENT;

    public ChaiffreDaffaire(){}
    public ChaiffreDaffaire(int ID_FACT, int ID_CLT, String NOM, String PRENOM, String DESIGNATION, int PRIX, int QTE_ACHETEE, int CHIFFRE_AFFAIRE, String CATEGORIE_CLIENT) {
        this.ID_FACT = ID_FACT;
        this.ID_CLT = ID_CLT;
        this.NOM = NOM;
        this.PRENOM = PRENOM;
        this.DESIGNATION = DESIGNATION;
        this.PRIX = PRIX;
        this.QTE_ACHETEE = QTE_ACHETEE;
        this.CHIFFRE_AFFAIRE = CHIFFRE_AFFAIRE;
        this.CATEGORIE_CLIENT = CATEGORIE_CLIENT;
    }

    public int getID_FACT() {
        return ID_FACT;
    }

    public void setID_FACT(int ID_FACT) {
        this.ID_FACT = ID_FACT;
    }

    public int getID_CLT() {
        return ID_CLT;
    }

    public void setID_CLT(int ID_CLT) {
        this.ID_CLT = ID_CLT;
    }

    public String getNOM() {
        return NOM;
    }

    public void setNOM(String NOM) {
        this.NOM = NOM;
    }

    public String getPRENOM() {
        return PRENOM;
    }

    public void setPRENOM(String PRENOM) {
        this.PRENOM = PRENOM;
    }

    public String getDESIGNATION() {
        return DESIGNATION;
    }

    public void setDESIGNATION(String DESIGNATION) {
        this.DESIGNATION = DESIGNATION;
    }

    public int getPRIX() {
        return PRIX;
    }

    public void setPRIX(int PRIX) {
        this.PRIX = PRIX;
    }

    public int getQTE_ACHETEE() {
        return QTE_ACHETEE;
    }

    public void setQTE_ACHETEE(int QTE_ACHETEE) {
        this.QTE_ACHETEE = QTE_ACHETEE;
    }

    public int getCHIFFRE_AFFAIRE() {
        return CHIFFRE_AFFAIRE;
    }

    public void setCHIFFRE_AFFAIRE(int CHIFFRE_AFFAIRE) {
        this.CHIFFRE_AFFAIRE = CHIFFRE_AFFAIRE;
    }

    public String getCATEGORIE_CLIENT() {
        return CATEGORIE_CLIENT;
    }

    public void setCATEGORIE_CLIENT(String CATEGORIE_CLIENT) {
        this.CATEGORIE_CLIENT = CATEGORIE_CLIENT;
    }
}
