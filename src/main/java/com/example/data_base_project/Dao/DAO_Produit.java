package com.example.data_base_project.Dao;

//import javax.servlet.http.Part;

import com.example.data_base_project.bean.Prodct;
import com.example.data_base_project.bean.ProduitAvecDemande;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DAO_Produit {
    private static final Logger LOGGER = Logger.getLogger(DAO_Produit.class.getName());
    private static final String url = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String username = "miniprojet";
    private static final String password = "miniprojet";
    public List<Prodct> getProducts() {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        List<Prodct> productList = new ArrayList<>();

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM produit";
            stmt = con.prepareStatement(query);
            res = stmt.executeQuery();

            while (res.next()) {
                Prodct produit = new Prodct(
                        res.getInt("ID_PROD"),
                        res.getString("DESIGNATION"),
                        res.getFloat("PRIX"),
                        res.getInt("QTE_STOCK")
                );
                productList.add(produit);
            }
            System.out.println("Dazt");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Ma Dazt");
        } finally {
            try {
                if (res != null) res.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }



    public void deleteProduct(int productId) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            // Supprimer les enregistrements enfants correspondants dans la table details_commande
            String deleteDetailsQuery = "DELETE FROM  Appartient WHERE ID_PROD = ?";
            PreparedStatement deleteDetailsStmt = con.prepareStatement(deleteDetailsQuery);
            deleteDetailsStmt.setInt(1, productId);
            deleteDetailsStmt.executeUpdate();
            deleteDetailsStmt.close();

            // Supprimer le produit
            String deleteProductQuery = "DELETE FROM produit WHERE ID_PROD = ?";
            stmt = con.prepareStatement(deleteProductQuery);
            stmt.setInt(1, productId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Product with ID " + productId + " deleted successfully.");
            } else {
                LOGGER.info("No product found with ID " + productId + ".");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }



    public List<Prodct> searchProduct(String keyword) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
       List<Prodct> productList=new ArrayList<>();

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM produit WHERE UPPER(DESIGNATION) LIKE UPPER(?)";
            stmt = con.prepareStatement(query);
            stmt.setString(1, "%" + keyword + "%");
            res = stmt.executeQuery();

            while (res.next()) {
                Prodct produit = new Prodct(
                        res.getInt("ID_PROD"),
                        res.getString("DESIGNATION"),
                        res.getFloat("PRIX"),
                        res.getInt("QTE_STOCK")
                );
                productList.add(produit);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (res != null) res.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }




    public void addProduct(Prodct produit) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);
            Statement stmtt = con.createStatement();
            ResultSet seqRs = stmtt.executeQuery("SELECT idProduit.nextval FROM dual");

            int idProd;
            if (seqRs.next()) {
                idProd = seqRs.getInt(1);
            } else {
                throw new SQLException("Impossible d'obtenir le prochain numéro de séquence.");
            }

            String query = "INSERT INTO produit (ID_PROD,DESIGNATION, PRIX, QTE_STOCK) VALUES (?,?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idProd);
            stmt.setString(2, produit.getDESIGNATION());
            stmt.setFloat(3, produit.getPRIX());
            stmt.setInt(4, produit.getQTE_STOCK());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Produit ajouté avec succès !");
            } else {
                System.out.println("Échec de l'ajout du produit !");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



    public void updateProduct(Prodct produit) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            String query = "UPDATE produit SET DESIGNATION = ?, PRIX = ?, QTE_STOCK = ? WHERE ID_PROD = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, produit.getDESIGNATION());
            stmt.setFloat(2, produit.getPRIX());
            stmt.setInt(3, produit.getQTE_STOCK());
            stmt.setInt(4, produit.getID_PROD());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Produit mis à jour avec succès !");
            } else {
                System.out.println("Échec de la mise à jour du produit !");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public Prodct getProductById(int productId) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Prodct product = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM produit WHERE ID_PROD = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, productId);

            rs = stmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("ID_PROD");
                String designation = rs.getString("DESIGNATION");
                float prix = rs.getFloat("PRIX");
                int qteStock = rs.getInt("QTE_STOCK");
                product = new Prodct(id, designation, prix, qteStock);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return product;
    }




    /*public Produit getProductById(int Id_Produit) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        Produit produit = null;

        try {
            String url = "jdbc:mysql://localhost:3306/db_project";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", null);

            String query = "SELECT * FROM produit WHERE Id_Produit = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, Id_Produit);
            res = stmt.executeQuery();

            if (res.next()) {
                produit = new Produit(
                        res.getDouble("Prix"),
                        res.getInt("Quantite_en_stock"),
                        res.getString("Designation")
                );
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                // Close resources in reverse order of creation
                if (res != null) res.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return produit;
    }
    public boolean addProduct(double Prix, int Quantite_en_stock, String Designation) {
        boolean productAdded = false;
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            String url = "jdbc:mysql://localhost:3306/db_project";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", null);
            String query = "INSERT INTO produit (Prix, Quantite_en_stock, Designation) VALUES (?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setDouble(1, Prix);
            stmt.setInt(2, Quantite_en_stock);
            stmt.setString(3, Designation);
            stmt.executeUpdate();
            productAdded = true;
        }catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Consider logging the exception instead
        } finally {
            // Close database resources in finally block
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Consider logging the exception instead
            }
        }
        return productAdded;
    }
    public boolean removeProduct(int Id) {
        boolean productRemoved = false;
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            String url = "jdbc:mysql://localhost:3306/db_project";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", null);
            String query = "DELETE FROM produit WHERE Id = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, Id);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                productRemoved = true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Consider logging the exception instead
        } finally {
            // Close database resources in finally block
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Consider logging the exception instead
            }
        }
        return productRemoved;
    }
    public boolean updateProduct(int productId, double Prix, int Quantite_en_stock, String Designation) {
        boolean productUpdated = false;
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            String url = "jdbc:mysql://localhost:3306/db_project";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", null);
            String query = "UPDATE produit SET Prix = ?, Quantite_en_stock = ?, Designation = ? WHERE Id_Produit = ?";
            stmt = con.prepareStatement(query);
            stmt.setDouble(1, Prix);
            stmt.setInt(2, Quantite_en_stock);
            stmt.setString(3, Designation);
            stmt.setInt(4, productId);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                productUpdated = true;
            }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(); // Consider logging the exception instead
            } finally {
                // Close database resources in finally block
                try {
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace(); // Consider logging the exception instead
                }
            }
            return productUpdated;
    }*/



    public void updateQte(int qtedemande, int idprod) {
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            // Charger le driver JDBC
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Établir la connexion à la base de données
            connection = DriverManager.getConnection(url, username, password);

            // Préparer la requête SQL paramétrée
            String sql = "UPDATE produit SET QTE_STOCK = QTE_STOCK - ? WHERE ID_PROD = ?";
            ps = connection.prepareStatement(sql);

            // Définir les paramètres de la requête
            ps.setInt(1, qtedemande);
            ps.setInt(2, idprod);

            // Exécuter la mise à jour
            ps.executeUpdate();

            System.out.println("Quantité mise à jour avec succès pour le produit avec ID " + idprod);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Fermer les ressources JDBC dans le bloc finally pour libérer les ressources
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }






    // Méthode pour récupérer les produits avec la demande correspondante
    public List<ProduitAvecDemande> getProduitsWithDemande() {
        List<ProduitAvecDemande> produits = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Établir la connexion à la base de données
            connection = DriverManager.getConnection(url, username, password);
            String query = "SELECT id_prod, designation, qte_stock, ment_dem(id_prod) AS demande FROM Produit";
            stmt = connection.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                // Charger le driver JDBC
                int id_prod = rs.getInt("id_prod");
                String designation = rs.getString("designation");
                int qte_stock = rs.getInt("qte_stock");
                String demande = rs.getString("demande");

                ProduitAvecDemande produit = new ProduitAvecDemande(id_prod, designation, qte_stock,demande);
                produits.add(produit);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return produits;
    }
}