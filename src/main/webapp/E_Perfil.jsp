<%-- 
    Document   : E_Perfil
    Created on : 20 nov 2025, 9:50:36 p. m.
    Author     : Windows
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.mensajePerfil}">
    <div class="alert-message success">
        ${sessionScope.mensajePerfil}
    </div>
    <c:remove var="mensajePerfil" scope="session"/>
</c:if>

<%
    String nombreSesion = (String) session.getAttribute("usuarioNombre");
    String tipoSesion = (String) session.getAttribute("usuarioTipo");

    if (nombreSesion == null || tipoSesion == null || !tipoSesion.equalsIgnoreCase("cliente")) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Editar Perfil - ${sessionScope.usuarioNombre} | Sweet Ice</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
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
    <h2><i class="fa-solid fa-user-gear"></i> Editar Mi Perfil</h2>
    <p>Visualiza y actualiza tu información personal.</p>
</section>

<div class="main-content-container">
    <div class="profile-container">

        <c:if test="${not empty param.exito}">
            <div class="alert-message success">
                <p>¡Tus datos personales han sido actualizados con éxito!</p>
            </div>
        </c:if>

        <c:if test="${not empty param.error}">
            <div class="alert-message error">
                <p>Error: ${param.error}</p>
            </div>
        </c:if>

        <hr>

        <h3>Datos Personales</h3>

        <form action="${pageContext.request.contextPath}/ActualizarPerfilServlet"
              method="POST"
              class="profile-form"
              id="datos-personales-form">

            <input type="hidden" name="action" value="actualizar_datos">

            <!-- CÉDULA -->
            <div class="data-row">
                <div class="data-label">Cédula:</div>

                <!-- Vista normal -->
                <div class="static-view">
                    <span class="data-value">${sessionScope.usuarioId}</span>
                    <i class="fa-solid fa-pen edit-icon"
                       onclick="activarEdicion('datos-personales-form')"></i>
                </div>

                <!-- Vista editable -->
                <div class="edit-form-group">
                    <input type="text" name="cedula" id="cedula"
                           value="${sessionScope.usuarioId}"
                           class="form-input"
                           readonly>
                </div>
            </div>

            <!-- NOMBRE -->
            <div class="data-row">
                <div class="data-label">Nombre:</div>

                <div class="static-view">
                    <span class="data-value">${sessionScope.usuarioNombre}</span>
                    <i class="fa-solid fa-pen edit-icon"
                       onclick="activarEdicion('datos-personales-form')"></i>
                </div>

                <div class="edit-form-group">
                    <input type="text" name="nombre" id="nombre"
                           value="${sessionScope.usuarioNombre}"
                           class="form-input" required>
                </div>
            </div>

            <!-- EMAIL -->
            <div class="data-row">
                <div class="data-label">Email:</div>

                <div class="static-view">
                    <span class="data-value">${sessionScope.usuarioCorreo}</span>
                    <i class="fa-solid fa-pen edit-icon"
                       onclick="activarEdicion('datos-personales-form')"></i>
                </div>

                <div class="edit-form-group">
                    <input type="email" name="correo" id="correo"
                           value="${sessionScope.usuarioCorreo}"
                           class="form-input" required>
                </div>
            </div>

            <!-- CONTRASEÑA (solo visible, no editable) -->
            <div class="data-row">
                <div class="data-label">Contraseña:</div>

                <div class="static-view">
                    <span class="data-value">************</span>
                    <i class="fa-solid fa-pen edit-icon"
                       onclick="activarEdicion('datos-personales-form')"></i>
                </div>

                <div class="edit-form-group">
                    <input type="text"
                           id="contrasena"
                           name="contrasena"
                           value="${sessionScope.usuarioContrasena}"
                           class="form-input"
                           readonly>
                </div>
            </div>

            <!-- Botones -->
            <div class="button-group">
                <button type="button" class="btn btn-cancelar"
                        onclick="desactivarEdicion('datos-personales-form')">
                    Cancelar
                </button>

                <button type="submit" class="btn btn-guardar">
                    Guardar Cambios
                </button>
            </div>

        </form>

    </div>
</div>

<footer>
    <p>&copy; 2025 Sweet Ice 🍦 | Todos los derechos reservados</p>
</footer>

<script>
    function activarEdicion(id) {
        document.getElementById(id).classList.add("is-editing");
    }

    function desactivarEdicion(id) {
        document.getElementById(id).classList.remove("is-editing");
    }
</script>

</body>
</html>
