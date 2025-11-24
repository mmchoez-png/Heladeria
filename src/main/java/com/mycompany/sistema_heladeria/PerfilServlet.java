/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistema_heladeria;

import jakarta.servlet.ServletException; // si tu Usuario está en subpaquete model
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/PerfilServlet")
public class PerfilServlet extends HttpServlet {

    private final String JDBC_URL = "jdbc:mysql://localhost:3306/tuBaseDatos";
    private final String JDBC_USER = "usuarioDB";
    private final String JDBC_PASS = "passDB";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String nombreCompleto = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            int filas;
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
                String sql = "UPDATE usuarios SET nombre_completo=?, correo=?, contrasena=? WHERE id=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, nombreCompleto);
                ps.setString(2, correo);
                ps.setString(3, contrasena);
                ps.setString(4, id);
                filas = ps.executeUpdate();
                ps.close();
            }

            if (filas > 0) {
                response.sendRedirect("E_Perfil.jsp?success=1");
            } else {
                response.sendRedirect("E_Perfil.jsp?error=1");
            }

        } catch (IOException | ClassNotFoundException | SQLException e) {
            response.sendRedirect("E_Perfil.jsp?error=1");
        }
    }
}
