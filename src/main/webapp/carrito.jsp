<%-- 
    Document   : carrito
    Created on : 23 nov 2025, 7:40:10 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // VALIDACIÓN DE SESIÓN (SEGURIDAD)
    String nombre = (String) session.getAttribute("usuarioNombre");
    String tipo = (String) session.getAttribute("usuarioTipo");

    // Si no hay usuario o no es cliente, lo manda al Login
    if (nombre == null || tipo == null || !tipo.equalsIgnoreCase("cliente")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Carrito - Heladería Sweet Ice</title>
        <!-- CSS externo -->
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
            <h1>🍦 Tu Carrito de Helados</h1>

            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Helado de Fresa (Cono)</td>
                        <td>$1.50</td>
                        <td>2</td>
                        <td>$3.00</td>
                        <td><button class="btn btn-danger">Eliminar</button></td>
                    </tr>
                    <tr>
                        <td>Copa Chocolate Supreme</td>
                        <td>$3.00</td>
                        <td>1</td>
                        <td>$3.00</td>
                        <td><button class="btn btn-danger">Eliminar</button></td>
                    </tr>
                </tbody>
            </table>

            <div class="total-section">
                <strong>Total a Pagar: $6.00</strong>
            </div>

            <div class="acciones">
                <a href="productos.jsp" class="btn btn-secondary">⬅ Seguir comprando</a>
                <a href="#" class="btn btn-success">✅ Finalizar Compra</a>
            </div>
        </div>

    </body>
</html>
