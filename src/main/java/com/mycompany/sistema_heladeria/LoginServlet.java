package com.mycompany.sistema_heladeria;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo").trim();
        String contrasena = request.getParameter("contrasena").trim();

        try (Connection conn = ConexionBD.getConexion()) {

            String sql = "SELECT id, nombre_completo, correo, contrasena, tipo_usuario "
                       + "FROM usuarios WHERE LOWER(correo) = LOWER(?) AND contrasena = ?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Usuario usuarioAutenticado = new Usuario(
                    rs.getInt("id"),
                    rs.getString("nombre_completo"),
                    rs.getString("correo"),
                    rs.getString("contrasena"),
                    rs.getString("tipo_usuario")
                );

                HttpSession session = request.getSession();

                session.setAttribute("usuarioId", usuarioAutenticado.getId());
                session.setAttribute("usuarioNombre", usuarioAutenticado.getNombreCompleto());
                session.setAttribute("usuarioCorreo", usuarioAutenticado.getCorreo());
                session.setAttribute("usuarioTipo", usuarioAutenticado.getTipoUsuario());
                session.setAttribute("usuarioContrasena", usuarioAutenticado.getContrasena());

                if (usuarioAutenticado.getTipoUsuario().equalsIgnoreCase("cliente")) {
                    response.sendRedirect("inicioUsuario.jsp");
                } else if (usuarioAutenticado.getTipoUsuario().equalsIgnoreCase("administrador")) {
                    response.sendRedirect("InicioAdmin.jsp");
                } else {
                    request.setAttribute("error", "Tipo de usuario no válido");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("error", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            System.err.println("Error SQL en Login: " + e.getMessage());
            request.setAttribute("error", "Error interno del servidor");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
