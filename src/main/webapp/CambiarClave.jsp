 <%-- 
    Document   : CambiarClave
    Created on : 20 nov 2025, 2:31:38 p. m.
    Author     : Windows
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cambiar Contraseña</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css/estilo.css">
</head>
<body>
    <section class="formulario">
        <h2>Cambiar Contraseña</h2>

        <%-- Mostrar mensajes de error o éxito --%>
        <% if (request.getAttribute("error") != null) { %>
            <p style="color:red;"><%= request.getAttribute("error") %></p>
        <% } %>
        <% if (request.getAttribute("mensaje") != null) { %>
            <p style="color:green;"><%= request.getAttribute("mensaje") %></p>
        <% } %>

        <form action="${pageContext.request.contextPath}/CambiarClaveServlet" method="post">
            <label for="email">Correo:</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="nuevaClave">Nueva Contraseña:</label><br>
            <input type="password" id="nuevaClave" name="nuevaClave" required><br><br>

            <label for="confirmarClave">Confirmar Contraseña:</label><br>
            <input type="password" id="confirmarClave" name="confirmarClave" required><br><br>

            <button type="submit">Actualizar Contraseña</button>
        </form>

        <p style="text-align:center; margin-top:20px;">
            <a href="${pageContext.request.contextPath}/presentacion.html">← Volver al inicio</a>
        </p>
    </section>
</body>
</html>
