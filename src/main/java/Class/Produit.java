package Class;

public class Produit {
   private int  ID_PROD ;
   private String  DESIGNATION ;
    private Float PRIX ;
    private int QTE_STOCK;

    public int getID_PROD() {
        return ID_PROD;
    }

    public void setID_PROD(int ID_PROD) {
        this.ID_PROD = ID_PROD;
    }

    public String getDESIGNATION() {
        return DESIGNATION;
    }

    public void setDESIGNATION(String DESIGNATION) {
        this.DESIGNATION = DESIGNATION;
    }

    public Float getPRIX() {
        return PRIX;
    }

    public void setPRIX(Float PRIX) {
        this.PRIX = PRIX;
    }

    public int getQTE_STOCK() {
        return QTE_STOCK;
    }

    public void setQTE_STOCK(int QTE_STOCK) {
        this.QTE_STOCK = QTE_STOCK;
    }

    public Produit(int ID_PROD, String DESIGNATION, Float PRIX, int QTE_STOCK) {
        this.ID_PROD = ID_PROD;
        this.DESIGNATION = DESIGNATION;
        this.PRIX = PRIX;
        this.QTE_STOCK = QTE_STOCK;
    }
    public Produit(){}
}
