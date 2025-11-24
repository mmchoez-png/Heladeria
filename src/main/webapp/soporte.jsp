<%-- 
    Document   : soporte
    Created on : 23 nov 2025, 8:45:33 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = (String) session.getAttribute("usuarioNombre");
    String tipo = (String) session.getAttribute("usuarioTipo");

    if (nombre == null || tipo == null || !tipo.equalsIgnoreCase("cliente")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Soporte Técnico - Sweet Ice 🍦</title>

    <!-- Íconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <!-- LLAMAR MENÚ NARANJA -->
    <link rel="stylesheet" href="styles/menuUsuario.css?v=<%=System.currentTimeMillis()%>">

    <!-- HOJA DE ESTILOS DEL SOPORTE -->
    <link rel="stylesheet" href="styles/soporte.css?v=<%=System.currentTimeMillis()%>">
</head>
<body class="soporte-page">

    <!-- MENÚ ORIGINAL NARANJA -->
    <header class="header-sweet">
        <div class="logo">
            <img src="img/logo.png" alt="Logo Sweet Ice">
            <h1>Heladería Sweet Ice</h1>
        </div>

        <nav>
            <ul>
                <li><a href="inicioUsuario.jsp">Volver al Panel</a></li>
                <li><a href="carrito.jsp"><i class="fa-solid fa-cart-shopping"></i> Carrito</a></li>
                <li><a href="${pageContext.request.contextPath}/LogoutServlet">Cerrar sesión</a></li>
            </ul>
        </nav>
    </header>

    <div class="container-soporte">
        <h1><i class="fa-solid fa-headset"></i> Centro de Ayuda</h1>
        <p class="intro">¿Tuviste un problema con tu pedido o tienes alguna duda? Escríbenos.</p>

        <form action="#" method="POST">
            
            <div class="form-group">
                <label>Tipo de consulta:</label>
                <select>
                    <option>Problema con un pedido</option>
                    <option>Pregunta sobre productos</option>
                    <option>Sugerencia</option>
                    <option>Otro</option>
                </select>
            </div>

            <div class="form-group">
                <label>Asunto:</label>
                <input type="text" placeholder="Ej: No llegó mi helado..." required>
            </div>

            <div class="form-group">
                <label>Mensaje:</label>
                <textarea placeholder="Cuéntanos qué sucedió..." required></textarea>
            </div>

            <button type="submit" class="btn-enviar">Enviar Mensaje</button>
        </form>

        <div class="info-contacto">
            <div class="info-item">
                <i class="fa-brands fa-whatsapp"></i>
                <span>+593 99 123 4567</span>
            </div>
            <div class="info-item">
                <i class="fa-solid fa-envelope"></i>
                <span>ayuda@sweetice.com</span>
            </div>
            <div class="info-item">
                <i class="fa-solid fa-location-dot"></i>
                <span>Guayaquil, Ecuador</span>
            </div>
        </div>
    </div>

</body>
</html>


