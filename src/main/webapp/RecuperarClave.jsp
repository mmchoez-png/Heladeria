<%-- 
    Document   : RecuperarClave
    Created on : 20 nov 2025, 1:01:37 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recuperar Contraseña</title>
    <!-- Ruta al CSS, asegúrate que el archivo exista -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css/estilo.css">
</head>
<body>
    <section class="formulario">
        <h2>Recuperar Contraseña</h2>
        <form action="${pageContext.request.contextPath}/RecuperarClaveServlet" method="post">
            <label for="email">Ingresa tu correo:</label><br>
            <input type="email" name="email" id="email" required><br><br>
            <input type="submit" value="Recuperar">
        </form>

         <%-- Mensajes --%>
            <% if(request.getAttribute("mensaje") != null) { %>
                <p style="color:green;"><%= request.getAttribute("mensaje") %></p>
            <% } %>
            <% if(request.getAttribute("error") != null) { %>
                <p style="color:red;"><%= request.getAttribute("error") %></p>
            <% } %>

            <%-- Enlace de volver al inicio --%>
            <p style="text-align:center; margin-top:20px;">
                <a href="${pageContext.request.contextPath}/Presentacion.html">← Volver al inicio</a>
            </p>
    </section>
</body>
</html>

