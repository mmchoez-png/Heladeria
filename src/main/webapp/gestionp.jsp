<%-- 
    Document   : gestionp
    Created on : 23 nov 2025, 9:35:06 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Gestión de Productos - Sweet Ice</title>
         <link rel="stylesheet" href="styles/menuAdm.css?v=<%= System.currentTimeMillis() %>">
    </head>
    <nav class="menu-admin">
        <a href="InicioAdmin.jsp" class="menu-link">🏠 Inicio</a>
        <a href="gestionp.jsp" class="menu-link actual">🍨 Productos</a>
        <a href="pedidos.jsp" class="menu-link">🧾 Pedidos</a>
        <a href="gestionUsuarios.jsp" class="menu-link">👥 Usuarios Registrados</a>
        <a href="reportes.jsp" class="menu-link">📊 Reportes</a>
        <a href="LogoutServlet" class="menu-link salir">🚪 Cerrar sesión</a>
    </nav>
    <header class="header">
    <h1>Panel de Administración<br>Sweet Ice</h1>
    <button class="btn-agregar" onclick="abrirModal()">+ Agregar nuevo producto</button>
</header>
    <body>
    <main>
        <table class="tabla-productos">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Categoría</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="producto" items="${listaProductos}">
                    <tr>
                        <td>${producto.id}</td>
                        <td><img src="${producto.imagen}" class="img-prod"></td>
                        <td>${producto.nombre}</td>
                        <td>$${producto.precio}</td>
                        <td>${producto.categoria}</td>
                        <td>${producto.estado}</td>
                        <td class="acciones">
                            <button 
                                class="btn-editar"
                                onclick="editarProducto('${producto.id}', '${producto.nombre}', '${producto.precio}', '${producto.categoria}', '${producto.estado}')">
                                ✏️
                            </button>
                            <a href="ProductoServlet?accion=eliminar&id=${producto.id}" 
                              class="btn-eliminar" onclick="return confirm('¿Eliminar producto?')">🗑️</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>

    <!-- Modal para agregar/editar -->
    <div class="modal" id="modal">
      <div class="modal-content">
        <h3>Agregar / Editar producto</h3>

        <form action="ProductoServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="accion" id="accion" value="guardar">
            <input type="hidden" name="id" id="id">

            <label>Imagen:</label>
            <input type="file" name="imagen">

            <label>Nombre:</label>
            <input type="text" name="nombre" id="nombre" required>

            <label>Categoría:</label>
            <select name="categoria" id="categoria">
                <option>Cremas</option>
                <option>Frutas</option>
                <option>Especiales</option>
            </select>

            <label>Precio:</label>
            <input type="number" step="0.01" name="precio" id="precio" required>

            <label>Estado:</label>
            <select name="estado" id="estado">
                <option>Activo</option>
                <option>Inactivo</option>
            </select>

            <div class="modal-buttons">
                <button type="submit" class="btn-guardar">Guardar</button>
                <button type="button" class="btn-cancelar" onclick="cerrarModal()">Cancelar</button>
            </div>
        </form>

      </div>
    </div>

    <script>
    function abrirModal() {
        document.getElementById('modal').style.display = 'flex';
    }
    function cerrarModal() {
        document.getElementById('modal').style.display = 'none';
    }
    </script>

    </body>
</html>
