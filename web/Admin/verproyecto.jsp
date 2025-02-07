
<%@page import="java.util.List"%>
<%@page import="Entidad.clsEProyecto"%>
<%@page import="Negocio.clsNProyecto"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int idProyecto = Integer.parseInt(request.getParameter("idProyecto"));
    clsNProyecto negocioProyecto = new clsNProyecto();
    clsEProyecto proyecto = negocioProyecto.obtenerProyectoPorId2(idProyecto);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Proyecto</title>
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
        header nav a, .dropdown > a {
            color: white;
            text-decoration: none;
            padding: 0.0em 1em;
            border-radius: 5px;
        }
        header nav a:hover, .dropdown > a:hover {
            background-color: #00509E;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #003366;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #00509E;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .container {
            padding: 20px;
            flex: 1;
        }
        .video-container {
            text-align: center;
        }
        .video-container iframe {
            width: 100%;
            max-width: 800px;
            height: 450px;
        }
        .project-details {
            margin-top: 20px;
        }
        .project-details h2 {
            color: #00509E;
        }
        .project-details p {
            margin: 5px 0;
        }
        footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: auto;
        }
        footer .social-icons a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        footer .social-icons a:hover {
            color: #ddd;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
        <nav>
            <div class="dropdown">
                <a href="#">Campañas</a>
                <div class="dropdown-content">
                    <a href="#">Campañas Publicadas</a>
                    <a href="#">Campañas Por Publicar</a>
                </div>
            </div>
            <a href="#">Usuarios</a>
            <div class="dropdown">
                <a href="#">Administrador</a>
                <div class="dropdown-content">
                    <a href="cerrarSesion.jsp">Salir</a>
                </div>
            </div>
        </nav>
    </header>
    <div class="container">
        <h2><%= proyecto.getTitulo() %></h2>
        <div class="video-container">
            <iframe src="<%= proyecto.getVideo() %>" frameborder="0" allowfullscreen></iframe>
        </div>
        <div class="project-details">
            <h2>Descripción</h2>
            <p><%= proyecto.getDescripcion_larga()%></p>
            <h2>Contribuciones</h2>
            <p><%= proyecto.getLista_donacion()%></p>
            <h2>Autor</h2>
            <p><%= proyecto.getNombreCreador() %></p>
            <h2>Días Restantes</h2>
            <p><%= proyecto.getFecha_limite()%></p>
            <br><br
        </div>
        <a href="index_admin.jsp" class="btn-back">Atras</a>
    </div>
    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>