package com.mycompany.sistema_heladeria;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Windows
 */

public class ConexionBD {

    private static final String URL = "jdbc:postgresql://localhost:5432/bdHeladeria"; 
    private static final String USER = "postgres";  // Tu usuario de PostgreSQL
    private static final String PASSWORD = "Admin123"; // Tu contraseña de PostgreSQL

    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver"); // Driver de PostgreSQL
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver PostgreSQL no encontrado", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

