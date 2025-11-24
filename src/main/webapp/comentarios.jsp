<%-- 
    Document   : comentarios
    Created on : 23 nov 2025, 8:13:41 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Opiniones - Sweet Ice 🍦</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="styles/menuUsuario.css?v=<%= System.currentTimeMillis() %>">

    </head>
    <body>
        <body class="comentarios-page">

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
        
        <div class="form-box">
            <h2><i class="fa-solid fa-comment-dots"></i> ¡Cuéntanos tu experiencia!</h2>
            <form action="#" method="POST">
                <div class="form-group">
                    <label>Calificación:</label>
                    <select>
                        <option value="5">⭐⭐⭐⭐⭐ - ¡Excelente!</option>
                        <option value="4">⭐⭐⭐⭐ - Muy bueno</option>
                        <option value="3">⭐⭐⭐ - Regular</option>
                        <option value="2">⭐⭐ - No me gustó</option>
                        <option value="1">⭐ - Malo</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Tu opinión:</label>
                    <textarea placeholder="El helado de vainilla estaba delicioso..."></textarea>
                </div>
                <button type="submit" class="btn-publicar">Publicar Comentario</button>
            </form>
        </div>

        <h3 style="color: #880e4f; text-align: center;">Lo que dicen nuestros clientes</h3>

        <div class="review-card">
            <div class="user-info">
                <span class="username">María López</span>
                <span class="stars">
                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </span>
            </div>
            <p class="comment-text">"¡Me encanta el de chocolate! Es súper cremoso."</p>
        </div>

        <div class="review-card">
            <div class="user-info">
                <span class="username">Carlos Pérez</span>
                <span class="stars">
                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </span>
            </div>
            <p class="comment-text">"Muy ricos, pero me gustaría que tuvieran sabor a chicle."</p>
        </div>

    </div>

</body>
</html>

</html>
