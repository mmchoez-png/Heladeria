<%-- 
    Document   : pedidos
    Created on : 23 nov 2025, 9:55:51 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Pedidos - Sweet Ice</title>
        <link rel="stylesheet" href="styles/menuAdm.css?v=<%= System.currentTimeMillis() %>">
    </head>
    <nav class="menu-admin">
        <a href="InicioAdmin.jsp" class="menu-link">🏠 Inicio</a>
        <a href="gestionp.jsp" class="menu-link">🍨 Productos</a>
        <a href="pedidos.jsp" class="menu-link actual">🧾 Pedidos</a>
        <a href="gestionUsuarios.jsp" class="menu-link">👥 Usuarios Registrados</a>
        <a href="reportes.jsp" class="menu-link">📊 Reportes</a>
        <a href="LogoutServlet" class="menu-link salir">🚪 Cerrar sesión</a>
    </nav>
    <header class="header">
    <h1>Gestión de Pedidos</h1>
</header>

<main>
    <table class="tabla-pedidos">
        <thead>
            <tr>
                <th>ID Pedido</th>
                <th>Cliente</th>
                <th>Productos</th>
                <th>Total ($)</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="pedido" items="${listaPedidos}">
                <tr>
                    <td>${pedido.id}</td>
                    <td>${pedido.cliente}</td>
                    <td>${pedido.productos}</td>
                    <td>$${pedido.total}</td>
                    <td>
                        <span class="estado ${pedido.estado}">
                            ${pedido.estado}
                        </span>
                    </td>
                    <td class="acciones">
                        <a href="PedidoServlet?accion=entregar&id=${pedido.id}" 
                           class="btn-entregar">📦 Marcar entregado</a>

                        <a href="PedidoServlet?accion=cancelar&id=${pedido.id}" 
                           class="btn-cancelar" onclick="return confirm('¿Cancelar este pedido?')">
                           ❌ Cancelar
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</main>

</body>
</html>
