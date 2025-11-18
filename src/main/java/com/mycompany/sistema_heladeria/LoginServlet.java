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
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo").trim();
        String contrasena = request.getParameter("contrasena").trim();

        System.out.println("Correo recibido: '" + correo + "'");
        System.out.println("Contraseña recibida: '" + contrasena + "'");

        try (Connection conn = ConexionBD.getConexion()) {

            String sql = "SELECT * FROM usuarios WHERE LOWER(correo) = LOWER(?) AND contrasena = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String tipo = rs.getString("tipo_usuario");      // ahora coincide con tu columna
                String nombre = rs.getString("nombre_completo"); // nombre completo

                // Guardar datos en sesión
                HttpSession session = request.getSession();
                session.setAttribute("usuarioNombre", nombre);
                session.setAttribute("usuarioCorreo", correo);
                session.setAttribute("usuarioTipo", tipo);

                System.out.println("Login exitoso. Tipo de usuario: " + tipo);

                // Redirigir según tipo
                if ("cliente".equalsIgnoreCase(tipo)) {
                    response.sendRedirect("inicioUsuario.jsp");
                } else if ("admin".equalsIgnoreCase(tipo)) {
                    response.sendRedirect("inicioAdmin.jsp");
                } else {
                    request.setAttribute("error", "Tipo de usuario no válido");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }

            } else {
                System.out.println("Login fallido: correo o contraseña incorrectos");
                request.setAttribute("error", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("error", "Error en el servidor: " + e.getMessage());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
