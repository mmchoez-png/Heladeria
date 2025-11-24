/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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

@WebServlet("/CambiarClaveServlet")
public class CambiarClaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String nuevaClave = request.getParameter("nuevaClave").trim();
        String confirmarClave = request.getParameter("confirmarClave").trim();

        // ---------- VALIDACIONES ----------
        if (email.isEmpty() || nuevaClave.isEmpty() || confirmarClave.isEmpty()) {
            request.setAttribute("error", "Debe llenar todos los campos.");
            request.getRequestDispatcher("/CambiarClave.jsp").forward(request, response);
            return;
        }

        if (!nuevaClave.equals(confirmarClave)) {
            request.setAttribute("error", "Las contraseñas no coinciden.");
            request.getRequestDispatcher("/CambiarClave.jsp").forward(request, response);
            return;
        }

        try (Connection con = ConexionBD.getConexion()) {

            // Verificar si el correo existe
            String sqlVerificar = "SELECT correo FROM usuarios WHERE correo = ?";
            PreparedStatement psVerificar = con.prepareStatement(sqlVerificar);
            psVerificar.setString(1, email);
            ResultSet rs = psVerificar.executeQuery();

            if (!rs.next()) {
                request.setAttribute("error", "El correo ingresado no está registrado.");
                request.getRequestDispatcher("/CambiarClave.jsp").forward(request, response);
                return;
            }

            // Actualizar contraseña
            String sqlActualizar = "UPDATE usuarios SET contrasena = ? WHERE correo = ?";
            PreparedStatement psActualizar = con.prepareStatement(sqlActualizar);
            psActualizar.setString(1, nuevaClave);
            psActualizar.setString(2, email);

            int filas = psActualizar.executeUpdate();

            if (filas > 0) {
                request.setAttribute("mensaje", "Cambio de clave exitosamente.");
            } else {
                request.setAttribute("error", "No se pudo actualizar la contraseña.");
            }

            rs.close();
            psVerificar.close();
            psActualizar.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al conectarse a la base de datos.");
        }

        // Redirige nuevamente al JSP para mostrar mensaje
        request.getRequestDispatcher("/CambiarClave.jsp").forward(request, response);
    }
}
