<%-- 
    Document   : reportes
    Created on : 23 nov 2025, 10:07:41 p. m.
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes - Sweet Ice</title>
        <link rel="stylesheet" href="styles/menuAdm.css?v=<%= System.currentTimeMillis() %>">
    </head>
    <nav class="menu-admin">
    <a href="InicioAdmin.jsp" class="menu-link">🏠 Inicio</a>
    <a href="gestionp.jsp" class="menu-link">🍨 Productos</a>
    <a href="pedidos.jsp" class="menu-link">🧾 Pedidos</a>
    <a href="gestionUsuarios.jsp" class="menu-link">👥 Usuarios Registrados</a>
    <a href="reportes.jsp" class="menu-link actual">📊 Reportes</a>
    <a href="LogoutServlet" class="menu-link salir">🚪 Cerrar sesión</a>
</nav>
    <body>
        <header class="header">
            <h1>Panel de Reportes y Estadísticas</h1>
        </header>

        <main class="report-container">

            <!-- 🔹 Indicadores principales -->
            <section class="indicadores">
                <div class="card-indicador">
                    <h4>Total Ventas</h4>
                    <p>$${totalVentas}</p>
                </div>
                <div class="card-indicador">
                    <h4>Unidades Vendidas</h4>
                    <p>${unidadesVendidas}</p>
                </div>
                <div class="card-indicador">
                    <h4>Ticket Promedio</h4>
                    <p>$${ticketPromedio}</p>
                </div>
            </section>

            <!-- 🔹 Gráficos -->
            <section class="graficos">
                <div class="grafico">
                    <h3>Ventas por sabor 🍨</h3>
                    <img src="images/grafico_sabor.png" class="img-grafico" alt="Gráfico por sabor">
                </div>

                <div class="grafico">
                    <h3>Distribución de ingresos 💰</h3>
                    <img src="images/grafico_ingresos.png" class="img-grafico" alt="Distribución de ingresos">
                </div>
            </section>

            <!-- 🔹 Tendencia mensual -->
            <section class="grafico-full">
                <h3>Tendencia de ventas mensuales 📈</h3>
                <img src="images/grafico_mensual.png" class="img-grafico" alt="Tendencia mensual">
            </section>

            <!-- 🔹 Tabla de vendedores -->
            <section class="tabla-vendedores">
                <h3>Mejores vendedores 🏅</h3>
                <table class="tabla-productos">
                    <thead>
                        <tr>
                            <th>Vendedor</th>
                            <th>Total Ventas ($)</th>
                            <th>Pedidos Atendidos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vendedor" items="${listaVendedores}">
                            <tr>
                                <td>${vendedor.nombre}</td>
                                <td>$${vendedor.totalVentas}</td>
                                <td>${vendedor.pedidosAtendidos}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>

        </main>
    </body>
</html>
