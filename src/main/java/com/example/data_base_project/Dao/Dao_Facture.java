package com.example.data_base_project.Dao;

import com.example.data_base_project.bean.Facture;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao_Facture {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USER = "miniprojet";
    private static final String PASSWORD = "miniprojet";
    private static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
    // Méthode pour insérer une nouvelle facture et retourner son ID généré
    /*public int store(Facture facture) {
        Connection con = null;
        int factureId = -1;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            // Requête SQL avec utilisation de la séquence Oracle pour l'ID facture
            String sql = "INSERT INTO facture (id_fact, date_fact, id_clt) VALUES (id_factSeq.nextval, ?, ?)";

            // Utilisation de PreparedStatement avec RETURN_GENERATED_KEYS pour récupérer l'ID généré
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            // Conversion de la chaîne de date en java.sql.Date
            java.sql.Date sqlDate = java.sql.Date.valueOf(facture.getDate_fact());

            ps.setDate(1, sqlDate);
            ps.setInt(2, facture.getId_clt());

            // Exécution de la requête
            ps.executeUpdate();

            // Récupération de l'ID généré
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                factureId = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return factureId;
    }*/

        //---------------------------------------------
        public int store(Facture facture) {
            Connection connection = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            int factureId = -1;

            try {
                // Établir la connexion
                connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "miniprojet", "miniprojet");

                // Obtenir le prochain numéro de séquence
                Statement stmt = connection.createStatement();
                ResultSet seqRs = stmt.executeQuery("SELECT id_factSeq.nextval FROM dual");

                if (seqRs.next()) {
                    factureId = seqRs.getInt(1);
                } else {
                    throw new SQLException("Impossible d'obtenir le prochain numéro de séquence.");
                }

                // Insérer la facture avec l'ID obtenu
                String sql = "INSERT INTO facture (id_fact, date_fact, id_clt) VALUES (?, ?, ?)";
                ps = connection.prepareStatement(sql);
                ps.setInt(1, factureId);
                ps.setDate(2, java.sql.Date.valueOf(facture.getDate_fact())); // Supposons que facture.getDate_fact() retourne un LocalDate
                ps.setInt(3, facture.getId_clt());

                // Exécuter la mise à jour
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected != 1) {
                    throw new SQLException("Insertion de la facture a échoué.");
                }

            } catch (SQLException e) {
                e.printStackTrace(); // Mieux vaut journaliser cette erreur
            } finally {
                try {
                    // Fermer les ressources dans l'ordre inverse de leur création
                    if (rs != null) {
                        rs.close();
                    }
                    if (ps != null) {
                        ps.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace(); // Mieux vaut journaliser cette erreur
                }
            }
            return factureId;
        }


    //---------------------------------------------



    public List<Facture> getFacture() {
        List<Facture> factures = new ArrayList<>();
        Connection con = null;

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);

            // Requête SQL pour récupérer toutes les factures
            String sql = "SELECT id_fact, date_fact, id_clt FROM facture";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Parcourir les résultats et créer des objets Facture
            while (rs.next()) {
                int id_fact = rs.getInt("id_fact");
                String date_fact = rs.getString("date_fact");
                int id_clt = rs.getInt("id_clt");

                Facture facture = new Facture();
                facture.setId_fact(id_fact);
                facture.setDate_fact(date_fact);
                facture.setId_clt(id_clt);

                factures.add(facture);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return factures;
    }




    // Méthode pour supprimer une facture par son ID
    public boolean deleteFactureById(int idfact) {
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            // Établir la connexion
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "miniprojet", "miniprojet");

            // Préparer la requête SQL
            String sql = "DELETE FROM facture WHERE id_fact = ?";
            ps = connection.prepareStatement(sql);

            // Définir le paramètre ID
            ps.setInt(1, idfact);

            // Exécuter la mise à jour
            int rowsDeleted = ps.executeUpdate();

            // Vérifier si une ligne a été supprimée
            if (rowsDeleted > 0) {
                System.out.println("La facture avec ID " + idfact + " a été supprimée.");
                return true;
            } else {
                System.out.println("Aucune facture trouvée avec ID " + idfact + ". Aucune suppression effectuée.");
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Mieux vaut journaliser cette erreur
            return false;
        } finally {
            try {
                // Fermer les ressources dans l'ordre inverse de leur création
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Mieux vaut journaliser cette erreur
            }
        }
    }
}



