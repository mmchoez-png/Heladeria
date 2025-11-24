/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistema_heladeria;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/ActualizarPerfilServlet")
public class ActualizarPerfilServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");

        if (usuarioId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        // Solo se actualiza nombre y correo
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");

        try (Connection conn = ConexionBD.getConexion()) {

            String sql = "UPDATE usuarios SET nombre_completo = ?, correo = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setInt(3, usuarioId);

            int filas = ps.executeUpdate();

            if (filas > 0) {
                // Actualizamos la sesión
                session.setAttribute("usuarioNombre", nombre);
                session.setAttribute("usuarioCorreo", correo);

                // Mensaje de éxito
                session.setAttribute("mensajePerfil", "Datos actualizados correctamente.");
            } else {
                session.setAttribute("mensajePerfil", "No se pudo actualizar la información.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("mensajePerfil", "Error interno al actualizar.");
        }

        // Volvemos al perfil
        response.sendRedirect("E_Perfil.jsp");
    }
}
