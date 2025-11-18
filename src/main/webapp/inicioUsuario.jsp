<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Validar sesión
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
    <!-- Estilos generales -->
    <link rel="stylesheet" href="styles.css/estilocliente.css?v=<%= System.currentTimeMillis() %>" type="text/css">
</head>
<body>
<!-- Encabezado -->
<header>
    <div class="logo">
        <img src="img/logo.png" alt="Logo Sweet Ice">
        <h1>Heladería Sweet Ice</h1>
    </div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/LogoutServlet" class="cerrar-sesion">Cerrar sesión</a></li>
        </ul>
    </nav>
</header>

<!-- Bienvenida -->
<section class="formulario">
    <h2>Bienvenido, ${sessionScope.usuarioNombre} 🍦</h2>
    <p>Desde tu panel de usuario puedes:</p>
    <ul>
        <li><a href="#">Editar tu perfil</a></li>
        <li><a href="#">Ver productos y gestionar tu carrito</a></li>
        <li><a href="#">Revisar tu historial de pedidos</a></li>
        <li><a href="#">Dejar comentarios</a></li>
        <li><a href="#">Contactar soporte</a></li>
    </ul>
</section>

<!-- Pie de página -->
<footer>
    <p>&copy; 2025 Sweet Ice 🍦 | Todos los derechos reservados</p>
</footer>

</body>
</html>

