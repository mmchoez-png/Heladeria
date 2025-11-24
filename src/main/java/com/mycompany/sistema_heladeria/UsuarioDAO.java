/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sistema_heladeria;

import java.sql.*;

public class UsuarioDAO {

    /**
     * Obtiene datos completos del usuario por su ID.
     */
    public Usuario obtenerUsuarioPorId(int id) {

        String sql = "SELECT id, nombre_completo, correo, contrasena, tipo_usuario FROM usuarios WHERE id = ?";
        Usuario usuario = null;

        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre_completo"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getString("tipo_usuario")
                    );
                }
            }

        } catch (SQLException e) {
            System.err.println("Error al obtener usuario por ID: " + e.getMessage());
        }

        return usuario;
    }

    /**
     * Actualiza nombre y correo del usuario.
     */
    public boolean actualizarDatos(int id, String nombreCompleto, String correo) {

        String sql = "UPDATE usuarios SET nombre_completo = ?, correo = ? WHERE id = ?";

        try (Connection conn = ConexionBD.getConexion();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nombreCompleto);
            ps.setString(2, correo);
            ps.setInt(3, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error al actualizar datos: " + e.getMessage());
            return false;
        }
    }
}
