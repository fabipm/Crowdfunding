

<%@page import="java.util.List"%>
<%@page import="Entidad.clsEProyecto"%>
<%@page import="Negocio.clsNProyecto"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int idProyecto = Integer.parseInt(request.getParameter("idProyecto"));
    clsNProyecto negocioProyecto = new clsNProyecto();
    clsEProyecto proyecto = negocioProyecto.obtenerProyectoPorId3(idProyecto);

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String estado = request.getParameter("estado");
        negocioProyecto.actualizarEstadoProyecto(idProyecto, estado);
        response.sendRedirect("index_admin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Estado de Campaña</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        header {
            background-color: #003366;
            color: white;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header nav {
            display: flex;
            gap: 1em;
        }
        header nav a {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 5px;
        }
        .container {
            padding: 20px;
            flex: 1;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-actions {
            text-align: center;
        }
        .btn {
            padding: 10px 20px;
            background-color: #00509E;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>YO TE APOYO</h1>
        </div>
        <nav>
            <a href="#">Campañas</a>
            <a href="#">Usuarios</a>
            <a href="#">Administrador</a>
        </nav>
    </header>
    <div class="container">
        <h2>Actualizar Estado de Campaña</h2>
        <form method="post">
            <div class="form-group">
                <label>Nombre de Campaña:</label>
                <input type="text" value="<%= proyecto.getTitulo() %>" readonly>
            </div>
            <div class="form-group">
                <label>Tipo de Duracion:</label>
                <input type="text" value="<%= proyecto.getTipo_duracion()%>" readonly>
            </div>
            <div class="form-group">
                <label>Creador de la campaña:</label>
                <input type="text" value="<%= proyecto.getNombreCreador() %>" readonly>
            </div>
            <div class="form-group">
                <label>Fecha Límite de Campaña:</label>
                <input type="text" value="<%= proyecto.getFecha_limite()%>" readonly>
            </div>
            <div class="form-group">
                <label>Estado de Campaña:</label>
                <select name="estado">
                    <option value="Por Publicar" <%= "Por Publicar".equals(proyecto.getEstado()) ? "selected" : "" %>>Por Publicar</option>
                    <option value="Publicado" <%= "Publicado".equals(proyecto.getEstado()) ? "selected" : "" %>>Publicado</option>
                </select>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn">Actualizar Estado</button>
            </div>
        </form>
    </div>
    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>