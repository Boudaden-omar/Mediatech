package com.example.data_base_project.Dao;

import com.example.data_base_project.bean.ChaiffreDaffaire;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao_ChaiffreDaffaire {



    public List<ChaiffreDaffaire> getClients() {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet res = null;
        List<ChaiffreDaffaire> chaiffreDaffaire = new ArrayList<>();

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String user = "miniprojet";
            String password = "miniprojet";
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM v_chiffre_affaire";
            stmt = con.prepareStatement(query);
            res = stmt.executeQuery();
           //public ChaiffreDaffaire(int ID_FACT, int ID_CLT, String NOM, String PRENOM, String DESIGNATION, int PRIX, int QTE_ACHETEE, int CHIFFRE_AFFAIRE, String CATEGORIE_CLIENT)
            while (res.next()) {
                ChaiffreDaffaire client = new ChaiffreDaffaire(
                        res.getInt("ID_FACT"),
                        res.getInt("id_clt"),
                        res.getString("nom"),
                        res.getString("prenom"),
                        res.getString("DESIGNATION"),
                        res.getInt("PRIX"),
                        res.getInt("QTE_ACHETEE"),
                        res.getInt("CHIFFRE_AFFAIRE"),
                        res.getString("CATEGORIE_CLIENT")
                );
                chaiffreDaffaire.add(client);
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
        return chaiffreDaffaire;
    }
}
