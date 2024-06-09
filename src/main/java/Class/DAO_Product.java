package Class;

//import javax.servlet.http.Part;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import Class.Produit;

public class DAO_Product {
    private static final Logger LOGGER = Logger.getLogger(DAO_Product.class.getName());

    public List<Produit> getProducts() {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        List<Produit> productList = new ArrayList<>();

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
                Produit produit = new Produit(
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

            String query = "DELETE FROM produit WHERE ID_PROD = ?";
            stmt = con.prepareStatement(query);
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
        }