/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistema_heladeria;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RecuperarClaveServlet")
public class RecuperarClaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            request.setAttribute("error", "Debe ingresar un correo válido.");
            request.getRequestDispatcher("/RecuperarClave.jsp").forward(request, response);
            return;
        }

        try (Connection con = ConexionBD.getConexion()) {

            // ✅ Ajuste a tus nombres de columna
            String sql = "SELECT contrasena FROM usuarios WHERE correo = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String contrasena = rs.getString("contrasena");
                // ⚠️ En producción: no mostrar la contraseña en texto plano
                request.setAttribute("mensaje", "Se ha enviado un correo con tu contraseña a: " + email);
            } else {
                request.setAttribute("error", "El correo ingresado no está registrado.");
            }

            rs.close();
            ps.close();

        } catch (Exception e) {
            request.setAttribute("error", "Error al conectarse a la base de datos.");
        }

        request.getRequestDispatcher("/RecuperarClave.jsp").forward(request, response);
    }
}

