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
import java.sql.ResultSet;

@WebServlet("/CargarPerfilServlet")
public class CargarPerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer usuarioId = (Integer) session.getAttribute("usuarioId");

        if (usuarioId == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try (Connection conn = ConexionBD.getConexion()) {

            String sql = "SELECT * FROM usuarios WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, usuarioId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Guardar TODO en sesión
                session.setAttribute("usuarioId", rs.getInt("id"));
                session.setAttribute("usuarioNombre", rs.getString("nombre_completo"));
                session.setAttribute("usuarioCorreo", rs.getString("correo"));
                session.setAttribute("usuariocontrasena", rs.getString("contrasena"));
                session.setAttribute("usuarioTipo", rs.getString("tipo_usuario"));

                response.sendRedirect("E_Perfil.jsp");

            } else {
                response.sendRedirect("inicioUsuario.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("inicioUsuario.jsp");
        }
    }
}

