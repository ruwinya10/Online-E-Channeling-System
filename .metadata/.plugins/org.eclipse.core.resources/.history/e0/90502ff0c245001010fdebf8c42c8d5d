package com.echannelling.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Utility class for establishing a database connection.
 * Demonstrates abstraction by hiding DB connection logic from other classes.
 */
public class DBConnection {

    // Database connection details
    private static String url = "jdbc:mysql://localhost:3306/echannelling"; // DB URL
    private static String user = "root"; // DB username
    private static String pass = "12345"; // DB password

    private static Connection con;

    /**
     * Static method to get a connection object to the database.
     * Uses JDBC API for connecting to MySQL database.
     * 
     * @return Connection object or null if connection fails
     */
    public static Connection getConnection() {
        try {
            // Load MySQL JDBC Driver (Abstraction of driver loading)
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection using DriverManager (Factory pattern)
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Database not connected !");
        }

        return con;
    }
}
