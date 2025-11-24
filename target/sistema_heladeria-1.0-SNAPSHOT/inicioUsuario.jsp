<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
    <title>Panel de Usuario - Sweet Ice 🍦</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Font Awesome para iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
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


<section class="welcome">
    <h2>¡Bienvenido, ${sessionScope.usuarioNombre} 🍦!</h2>
    <p>Desde tu panel de usuario puedes:</p>
</section>

<div class="cards-container">
    <div class="card" onclick="location.href='E_Perfil.jsp'">
        <i class="fa-solid fa-user"></i>
        <h3>Mi Perfil</h3>
        <p>Editar tus datos personales</p>
    </div>

    <div class="card" onclick="location.href='carrito.jsp'">
        <i class="fa-solid fa-cart-shopping"></i>
        <h3>Carrito</h3>
        <p>Ver y gestionar tu carrito</p>
    </div>

    <div class="card" onclick="location.href='productos.jsp'">
        <i class="fa-solid fa-ice-cream"></i>
        <h3>Productos</h3>
        <p>Explorar nuestros sabores</p>
    </div>

    <div class="card" onclick="location.href='historial.jsp'">
        <i class="fa-solid fa-clock-rotate-left"></i>
        <h3>Historial</h3>
        <p>Revisar tus pedidos anteriores</p>
    </div>

    <div class="card" onclick="location.href='comentarios.jsp'">
        <i class="fa-solid fa-comment-dots"></i>
        <h3>Comentarios</h3>
        <p>Dejar tus opiniones</p>
    </div>

    <div class="card" onclick="location.href='soporte.jsp'">
        <i class="fa-solid fa-headset"></i>
        <h3>Soporte</h3>
        <p>Contactar al equipo de ayuda</p>
    </div>
</div>

<footer>
    <p>&copy; 2025 Sweet Ice 🍦 | Todos los derechos reservados</p>
</footer>

</body>
</html>

