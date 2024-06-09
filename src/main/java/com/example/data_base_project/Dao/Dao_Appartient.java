package com.example.data_base_project.Dao;

import com.example.data_base_project.bean.Appartient;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Dao_Appartient {

    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USER = "miniprojet";
    private static final String PASSWORD = "miniprojet";
    private static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";

    public void store(Appartient appartient) {
        Connection connection = null;
        PreparedStatement ps = null;

        try {
            // Load Oracle JDBC Driver
            Class.forName(DRIVER_CLASS);

            // Establish connection to the database
            connection = DriverManager.getConnection(URL, USER, PASSWORD);

            // SQL Insert statement
            String sql = "INSERT INTO appartient (id_fact, id_prod, qte_achetee) VALUES (?, ?, ?)";

            // Prepare the statement
            ps = connection.prepareStatement(sql);
            ps.setInt(1, appartient.getId_fact());
            ps.setInt(2, appartient.getId_prod());
            ps.setInt(3, appartient.getQte_achetee());

            // Execute the statement
            ps.executeUpdate();
        } catch (SQLException e) {
            // Print SQL exception details
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // Print Class not found exception details
            throw new RuntimeException(e);
        } finally {
            // Close the PreparedStatement and Connection
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Print SQL exception details on close
                e.printStackTrace();
            }
        }
    }
}
