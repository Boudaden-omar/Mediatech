package com.example.data_base_project.Dao;

import com.example.data_base_project.bean.Client;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DAO_Client {
    private static final Logger LOGGER = Logger.getLogger(DAO_Client.class.getName());

    public List<Client> getClients() {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        List<Client> clientList = new ArrayList<>();

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM client";
            stmt = con.prepareStatement(query);
            res = stmt.executeQuery();

            while (res.next()) {
                Client client = new Client(
                        res.getInt("id_clt"),
                        res.getString("nom"),
                        res.getString("prenom"),
                        res.getInt("tel")
                );
                clientList.add(client);
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
        return clientList;
    }

    public Client getClientById(int id) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        Client client = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM client WHERE id_clt = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            res = stmt.executeQuery();

            if (res.next()) {
                client = new Client(
                        res.getInt("id_clt"),
                        res.getString("nom"),
                        res.getString("prenom"),
                        res.getInt("tel")
                );
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
        return client;
    }

    public void addClient(Client client) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);
            Statement stmtt = con.createStatement();
            ResultSet seqRs = stmtt.executeQuery("SELECT idclient.nextval FROM dual");

            int idclient;
            if (seqRs.next()) {
                idclient = seqRs.getInt(1);
            } else {
                throw new SQLException("Impossible d'obtenir le prochain numéro de séquence.");
            }
            String query = "INSERT INTO client (id_clt, nom, prenom, tel) VALUES (?, ?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idclient);
            stmt.setString(2, client.getNom());
            stmt.setString(3, client.getPrenom());
            stmt.setInt(4, client.getTel());


            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("client ajouté avec succès !");
            } else {
                System.out.println("client de l'ajout du produit !");
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


    // Méthode pour supprimer un client
    public boolean removeClient(int idClient) {
        boolean clientRemoved = false;
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);
            String query = "DELETE FROM client WHERE id_clt = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idClient);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                clientRemoved = true;
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
        return clientRemoved;
    }

   /* public boolean removeClient(int idClient) {
        boolean clientRemoved = false;
        Connection con = null;
        PreparedStatement stmt = null;
        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            // Alter foreign key constraint to cascade deletes
            String alterConstraintQuery = "ALTER TABLE facture DROP CONSTRAINT FK_FACT";
            stmt = con.prepareStatement(alterConstraintQuery);
            stmt.executeUpdate();
            stmt.close();

            alterConstraintQuery = "ALTER TABLE facture ADD CONSTRAINT FK_FACT FOREIGN KEY (ID_CLT) REFERENCES client(id_clt) ON DELETE CASCADE";
            stmt = con.prepareStatement(alterConstraintQuery);
            stmt.executeUpdate();
            stmt.close();

            // Now deleting the client will also delete associated records in facture table
            String query = "DELETE FROM client WHERE id_clt = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, idClient);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                clientRemoved = true;
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
        return clientRemoved;
    }*/

    public void deletclt(int cltid) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            // Supprimer les enregistrements enfants correspondants dans la table details_commande
            String deleteDetailsQuery = "DELETE FROM facture WHERE ID_CLT = ?";
            PreparedStatement deleteDetailsStmt = con.prepareStatement(deleteDetailsQuery);
            deleteDetailsStmt.setInt(1, cltid);
            int rowsAffected = deleteDetailsStmt.executeUpdate();
            deleteDetailsStmt.close();

            // Vérifier si des enregistrements enfants ont été supprimés avec succès
            if (rowsAffected > 0) {
                LOGGER.info(rowsAffected + " records deleted from facture for client ID " + cltid);
            } else {
                LOGGER.info("No records found in facture for client ID " + cltid);
            }

            // Supprimer le client
            String deleteClientQuery = "DELETE FROM client WHERE ID_CLT = ?";
            stmt = con.prepareStatement(deleteClientQuery);
            stmt.setInt(1, cltid);

            rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Client with ID " + cltid + " deleted successfully.");
            } else {
                LOGGER.info("No client found with ID " + cltid + ".");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


    public List<Client> searchClient(String keyword) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        List<Client> clientsList = new ArrayList<>();

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM client WHERE UPPER(NOM) LIKE UPPER(?) OR UPPER(PRENOM) LIKE UPPER(?)";
            stmt = con.prepareStatement(query);
            stmt.setString(1, "%" + keyword + "%");
            stmt.setString(2, "%" + keyword + "%");
            res = stmt.executeQuery();

            while (res.next()) {
                Client client = new Client(
                        res.getInt("id_clt"),
                        res.getString("NOM"),
                        res.getString("PRENOM"),
                        res.getInt("tel")
                );

                clientsList.add(client);
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
        return clientsList;
    }


    /*public void deleteClient(int cltId) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            // Supprimer les enregistrements enfants correspondants dans la table details_commande
            String deleteDetailsQuery = "DELETE FROM Facture WHERE  ID_CLT  = ?";
            PreparedStatement deleteDetailsStmt = con.prepareStatement(deleteDetailsQuery);
            deleteDetailsStmt.setInt(1, cltId);
            deleteDetailsStmt.executeUpdate();
            deleteDetailsStmt.close();

            // Supprimer le client
            String deleteClientQuery = "DELETE FROM client WHERE ID_CLT = ?";
            stmt = con.prepareStatement(deleteClientQuery);
            stmt.setInt(1, cltId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Client with ID " + cltId + " deleted successfully.");
            } else {
                LOGGER.info("No client found with ID " + cltId + ".");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            // Fermer les ressources
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }*/



    public void updateClient(Client client) {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            String query = "UPDATE client SET nom = ?,prenom=?, tel = ? WHERE id_clt = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, client.getNom());
            stmt.setString(2, client.getPrenom());
            stmt.setInt(3, client.getTel());
            stmt.setInt(4, client.getId_clt());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Client mis à jour avec succès !");
            } else {
                System.out.println("Échec de la mise à jour du Client !");
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



}