<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro - Sweet Ice 🍦</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css/estilo.css">
</head>
<body>
    <!-- ======= ENCABEZADO ======= -->
    <header>
        <div class="logo">
            <img src="img/logo.png" alt="Logo Sweet Ice">
            <h1>Heladería Sweet Ice</h1>
        </div>

        <nav>
            <ul>
                <li><a href="Presentación.jsp">Inicio</a></li>
                <li><a href="Productos.jsp">Productos</a></li>
                <li><a href="Historia.jsp">Historia</a></li>
                <li><a href="Login.jsp">Iniciar Sesión</a></li>
                <li><a href="Registro.jsp" class="active">Registrarse</a></li>
            </ul>
        </nav>
    </header>

    <!-- ======= FORMULARIO DE REGISTRO ======= -->
    <div class="formulario">
        <h2>Registro</h2>

        <form action="RegistroServlet" method="POST">
            <label for="id">Cédula:</label>
            <input type="text" id="id" name="id" required>

            <label for="nombre">Nombre completo:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" required>

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" required>

            <button type="submit">Registrarse</button>
        </form>

        <!-- Mostrar mensaje de error o confirmación -->
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>
            <p style="color:red; text-align:center; margin-top:10px;"><%= mensaje %></p>
        <%
            }
        %>

        <p style="margin-top:15px;">¿Ya tienes cuenta? <a href="Login.jsp">Inicia sesión aquí</a></p>
    </div>

    <!-- ======= PIE DE PÁGINA ======= -->
    <footer>
        <p>&copy; 2025 Sweet Ice 🍦 | Todos los derechos reservados</p>
    </footer>
</body>
</html>

