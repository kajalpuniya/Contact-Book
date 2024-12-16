package com.registration.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestDBConnection {
    // Database connection details
    private static final String URL = "jdbc:postgresql://localhost:5432/registration_db";
    private static final String USER = "postgres";
    private static final String PASSWORD = "KajalPuniya";

    public static void main(String[] args) {
        Connection connection = null;

        try {
            // Register JDBC Driver
            Class.forName("org.postgresql.Driver");

            // Establish connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            
            // Check if connection is successful
            if (connection != null) {
                System.out.println("Connected to the database successfully!");
            } else {
                System.out.println("Failed to connect to the database.");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failed. Check output console.");
            e.printStackTrace();
        } finally {
            // Close the connection if it's open
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Database connection closed.");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
