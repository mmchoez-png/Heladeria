<%-- 
    Document   : InicioAdmin
    Created on : 9 nov 2025, 9:11:39 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de Administración - Sweet Ice</title>
    <link rel="stylesheet" href="styles/menuAdm.css?v=<%= System.currentTimeMillis() %>">
    <header class="admin-header">
    <div class="admin-header-left">
      <img src="img/logo.png" alt="Logo Sweet Ice">
      <div>
        <h1>Panel de Administración</h1>
        <p class="sub">Sweet Ice · Gestión de heladería</p>
      </div>
    </div>

    <div class="admin-header-right">
      <span class="welcome">Bienvenido, Admin</span>
      <a class="btn-logout" href="${pageContext.request.contextPath}/LogoutServlet">Cerrar sesión</a>
    </div>
  </header>
    </body>
        <main class="admin-main">

          <section class="grid-menu">
            <a href="gestionp.jsp" class="menu-card">
              <div class="card-icon">🍨</div>
              <h3>Gestionar Productos</h3>
            </a>

            <a href="pedidos.jsp" class="menu-card">
              <div class="card-icon">🧾</div>
              <h3>Ver Pedidos</h3>
            </a>

            <a href="gestionUsuarios" class="menu-card">
              <div class="card-icon">👥</div>
              <h3>Usuarios Registrados</h3>
            </a>

            <a href="reportes.jsp" class="menu-card highlight">
              <div class="card-icon">📊</div>
              <h3>Reportes</h3>
            </a>
          </section>

          <section class="summary">
            <div class="summary-card">
              <h4>Ventas hoy</h4>
              <p id="ventas-hoy">--</p>
            </div>
            <div class="summary-card">
              <h4>Sabor más vendido</h4>
              <p id="sabor-mas-vendido">--</p>
            </div>
            <div class="summary-card">
              <h4>Ganancias del mes</h4>
              <p id="ganancias-mes">--</p>
            </div>
          </section>

        </main>

        <script src="js/admin-dashboard.js"></script>
    </body>
</html>
