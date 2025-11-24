<%-- 
    Document   : productos
    Created on : 23 nov 2025, 7:47:40 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // 1. SEGURIDAD: Recuperamos el código que faltaba
    String nombre = (String) session.getAttribute("usuarioNombre");
    String tipo = (String) session.getAttribute("usuarioTipo");

    // Si no hay sesión activa, expulsar al Login
    if (nombre == null || tipo == null || !tipo.equalsIgnoreCase("cliente")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuestros Helados - Sweet Ice 🍦</title>
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

    <div class="productos-container">
        <h1>Nuestros Helados</h1>
        <p class="productos-subtitle">
            Descubre nuestros sabores más populares y déjate tentar por su dulzura 🧁
        </p>

        <div class="grid-productos">

            <div class="card-producto">
                <div class="img-circle-producto">
                    <i class="fa-solid fa-ice-cream" style="color: #fef9c3;"></i>
                </div>
                <h3>Helado de Vainilla</h3>
                <span class="producto-precio">$1.50</span>
                <button class="btn-agregar-producto">Agregar</button>
            </div>

            <div class="card-producto">
                <div class="img-circle-producto">
                    <i class="fa-solid fa-ice-cream" style="color: #5d4037;"></i>
                </div>
                <h3>Helado de Chocolate</h3>
                <span class="producto-precio">$2.00</span>
                <button class="btn-agregar-producto">Agregar</button>
            </div>

            <div class="card-producto">
                <div class="img-circle-producto">
                    <i class="fa-solid fa-ice-cream" style="color: #ff80ab;"></i>
                </div>
                <h3>Helado de Fresa</h3>
                <span class="producto-precio">$1.75</span>
                <button class="btn-agregar-producto">Agregar</button>
            </div>

            <div class="card-producto">
                <div class="img-circle-producto">
                    <i class="fa-solid fa-ice-cream" style="color: #ffd54f;"></i>
                </div>
                <h3>Helado de Maracuyá</h3>
                <span class="producto-precio">$2.25</span>
                <button class="btn-agregar-producto">Agregar</button>
            </div>

        </div>
    </div>

</body>
</html>
