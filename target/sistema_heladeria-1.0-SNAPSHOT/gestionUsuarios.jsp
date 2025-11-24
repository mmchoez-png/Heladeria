<%-- 
    Document   : gestionUsuarios
    Created on : 23 nov 2025, 10:04:36 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Usuarios - Sweet Ice</title>
        <link rel="stylesheet" href="styles/menuAdm.css?v=<%= System.currentTimeMillis() %>">
    </head>
    <nav class="menu-admin">
        <a href="InicioAdmin.jsp" class="menu-link">🏠 Inicio</a>
        <a href="gestionp.jsp" class="menu-link">🍨 Productos</a>
        <a href="pedidos.jsp" class="menu-link">🧾 Pedidos</a>
        <a href="gestionUsuarios.jsp" class="menu-link actual">👥 Usuarios Registrados</a>
        <a href="reportes.jsp" class="menu-link">📊 Reportes</a>
        <a href="LogoutServlet" class="menu-link salir">🚪 Cerrar sesión</a>
    </nav>
    <body>
        <!-- 🔹 Título y barra de búsqueda -->
        <header class="header">
            <h1>Gestión de Usuarios Registrados</h1>
            <input type="text" id="buscarUsuario" class="input-busqueda" placeholder="🔍 Buscar usuario...">
        </header>

        <!-- 🔹 Tabla de usuarios -->
        <main>
            <table class="tabla-usuarios">
                <thead>
                    <tr>
                        <th>ID Usuario</th>
                        <th>Nombre</th>
                        <th>Correo Electrónico</th>
                        <th>Username</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="usuario" items="${listaUsuarios}">
                        <tr>
                            <td>${usuario.id}</td>
                            <td>${usuario.nombre}</td>
                            <td>${usuario.correo}</td>
                            <td>${usuario.username}</td>
                            <td class="acciones">
                                <button class="btn-editar"
                                        onclick="editarUsuario('${usuario.id}', '${usuario.nombre}', '${usuario.correo}', '${usuario.username}')">
                                    ✏️
                                </button>

                                <a href="UsuarioServlet?accion=eliminar&id=${usuario.id}" 
                                   class="btn-eliminar" onclick="return confirm('¿Eliminar este usuario?')">
                                   🗑️
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>

        <!-- 🔹 Modal para editar usuario -->
        <div class="modal" id="modalUsuario">
            <div class="modal-content">
                <h3>Editar Usuario</h3>
                <form action="UsuarioServlet" method="post">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="id" id="idUsuario">

                    <label>Nombre:</label>
                    <input type="text" name="nombre" id="nombreUsuario" required>

                    <label>Correo Electrónico:</label>
                    <input type="email" name="correo" id="correoUsuario" required>

                    <label>Nombre de Usuario:</label>
                    <input type="text" name="username" id="usernameUsuario" required>

                    <div class="modal-buttons">
                        <button type="submit" class="btn-guardar">Guardar</button>
                        <button type="button" class="btn-cancelar" onclick="cerrarModal()">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
        function editarUsuario(id, nombre, correo, username) {
            document.getElementById('idUsuario').value = id;
            document.getElementById('nombreUsuario').value = nombre;
            document.getElementById('correoUsuario').value = correo;
            document.getElementById('usernameUsuario').value = username;
            document.getElementById('modalUsuario').style.display = 'flex';
        }

        function cerrarModal() {
            document.getElementById('modalUsuario').style.display = 'none';
        }
        </script>
    </body>
</html>
