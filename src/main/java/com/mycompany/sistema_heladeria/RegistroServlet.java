package com.mycompany.sistema_heladeria;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Random;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    private static final String URL = "jdbc:postgresql://localhost:5432/sweetice";
    private static final String USER = "postgres";
    private static final String PASSWORD = "tu_contraseña";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String confirmar = request.getParameter("confirmar");

        try {
            if (!contrasena.equals(confirmar)) {
                request.setAttribute("error", "Las contraseñas no coinciden.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return;
            }

            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            // Verificar si ya existe ese correo
            PreparedStatement check = con.prepareStatement("SELECT * FROM usuarios WHERE correo = ?");
            check.setString(1, correo);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                request.setAttribute("error", "Este correo ya está registrado.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            } else {
                // Generar nombre de usuario automático
                String primerNombre = nombre.split(" ")[0].toLowerCase();
                int numero = new Random().nextInt(900) + 100; // número entre 100 y 999
                String nombreUsuario = primerNombre + numero;

                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO usuarios (nombre_completo, correo, nombre_usuario, contrasena, tipo_usuario) VALUES (?, ?, ?, ?, ?)"
                );
                ps.setString(1, nombre);
                ps.setString(2, correo);
                ps.setString(3, nombreUsuario);
                ps.setString(4, contrasena);
                ps.setString(5, "cliente");

                ps.executeUpdate();

                request.setAttribute("mensaje", "Registro exitoso. Tu nombre de usuario es: " + nombreUsuario);
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar usuario: " + e.getMessage());
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}

