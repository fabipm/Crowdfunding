
<%@page import="java.util.List"%>
<%@page import="Entidad.clsEProyecto"%>
<%@page import="Negocio.clsNProyecto"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    clsNProyecto negocioProyecto = new clsNProyecto();
    List<clsEProyecto> proyectos = negocioProyecto.obtenerProyectos();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrador - Campañas Por Publicar</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #003366;
            color: white;
        }
        .actions i {
            cursor: pointer;
            margin-right: 10px;
            color: #00509E;
        }
        .actions i:hover {
            color: #003366;
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
        <h2>Campañas Por Publicar</h2>
        <table>
            <thead>
                <tr>
                    <th>Nombre Campaña</th>
                    <th>Fecha límite de campaña</th>
                    <th>Tipo Campaña</th>
                    <th>Creador de Campaña</th>
                    <th>Descripción Campaña</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (clsEProyecto proyecto : proyectos) { %>
                <tr>
                    <td><%= proyecto.getTitulo() %></td>
                    <td><%= proyecto.getFechaLimite() %></td>
                    <td><%= proyecto.gett %></td>
                    <td><%= proyecto.getNombreCreador() %></td>
                    <td><%= proyecto.getDescripcionCorta() %></td>
                    <td class="actions">
                        <a class='bx bx-edit' href="actualizarestadoproyecto.jsp?idProyecto=<%= proyecto.getIdProyecto() %>">Editar</a>
                        <a class='bx bx-edit' href="verproyecto.jsp?idProyecto=<%= proyecto.getIdProyecto() %>">Ver</a>
                        <i class='bx bx-envelope'></i>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
