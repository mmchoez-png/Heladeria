<%-- 
    Document   : historial
    Created on : 23 nov 2025, 8:04:51 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 🔒 SEGURIDAD: Verificar sesión
    String nombre = (String) session.getAttribute("usuarioNombre");
    String tipo = (String) session.getAttribute("usuarioTipo");

    if (nombre == null || tipo == null || !tipo.equalsIgnoreCase("cliente")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis Pedidos - Sweet Ice 🍦</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="styles/menuUsuario.css?v=<%= System.currentTimeMillis() %>">
    </head>
    <body>

    <header class="header-sweet">
        <div class="logo">
            <img src="img/logo.png" alt="Logo Sweet Ice">
            <h1>Heladería Sweet Ice</h1>
        </div>

        <nav>
            <ul>
                <li><a href="inicioUsuario.jsp">Volver al Panel</a></li>

                <!-- Botón Carrito -->
                <li>
                    <a href="carrito.jsp" class="btn-carrito">
                        <i class="fa-solid fa-cart-shopping"></i> Carrito
                    </a>
                </li>

                <!-- Cerrar Sesión -->
                <li><a href="${pageContext.request.contextPath}/LogoutServlet">Cerrar sesión</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
    <h1><i class="fa-solid fa-clock-rotate-left"></i> Historial de Pedidos</h1>

    <table>
        <thead>
            <tr>
                <th># Pedido</th>
                <th>Fecha</th>
                <th>Total</th>
                <th>Estado</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>#001</td>
                <td>20/11/2025</td>
                <td>$4.50</td>
                <td><span class="estado entregado">Entregado</span></td>
                <td><a href="#" class="btn-ver">Ver detalles</a></td>
            </tr>

            <tr>
                <td>#002</td>
                <td>21/11/2025</td>
                <td>$2.00</td>
                <td><span class="estado entregado">Entregado</span></td>
                <td><a href="#" class="btn-ver">Ver detalles</a></td>
            </tr>

            <tr>
                <td>#003</td>
                <td>Hoy</td>
                <td>$6.75</td>
                <td><span class="estado pendiente">En Preparación</span></td>
                <td><a href="#" class="btn-ver">Ver detalles</a></td>
            </tr>
        </tbody>
    </table>
</div>

</body>
</html>

</html>
