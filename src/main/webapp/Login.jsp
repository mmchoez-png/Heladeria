<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión - Sweet Ice 🍦</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/estilo.css" type="text/css"/>
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
            <li><a href="Presentacion.html">Inicio</a></li>
            <li><a href="Productos.html">Productos</a></li>
            <li><a href="Historia.html">Historia</a></li>
            <li><a href="Login.jsp" class="active">Iniciar Sesión</a></li>
            <li><a href="Registro.jsp">Registrarse</a></li>
        </ul>
    </nav>
</header>

<!-- Formulario -->
<div class="formulario">
    <h2>Iniciar Sesión</h2>

    <form action="LoginServlet" method="POST">
        <label for="correo">Correo electrónico:</label>
        <input type="email" id="correo" name="correo" required>

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required>

        <button type="submit">Ingresar</button>
    </form>

    <!-- Mostrar mensaje de error dinámico -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p style="color:red; text-align:center; margin-top:10px;"><%= error %></p>
    <%
        }
    %>

    <div class="form-links">
        <p><a href="RecuperarClave.jsp">¿Olvidaste tu contraseña?</a></p>
        <p><a href="CambiarClave.jsp">Cambiar mi contraseña</a></p>
        <p>¿No tienes cuenta? <a href="Registro.jsp">Regístrate aquí</a></p>
    </div>
</div>
<!-- Pie de página -->
<footer>
    <p>&copy; 2025 Sweet Ice 🍦 | Todos los derechos reservados</p>
</footer>

</body>
</html>