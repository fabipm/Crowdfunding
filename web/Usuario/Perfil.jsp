
<%@page import="java.util.Base64"%>
<%@page import="Negocio.clsNUsuario"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f4;
        }
        header, footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1em 0;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em;
        }
        header nav {
            display: flex;
            gap: 1em;
            position: relative;
            flex-grow: 1;
            justify-content: flex-end;
        }
        header nav a, .dropdown > span {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        header nav a:hover, .dropdown > span:hover {
            background-color: #555;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            right: 0;
        }
        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #555;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        main {
            flex: 1;
            padding: 2em;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            text-align: center;
        }
        .profile-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-header img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
        }
        .profile-header h1 {
            margin: 10px 0;
        }
        .profile-header h2 {
            margin: 5px 0;
            color: #777;
        }
        .profile-details {
            display: flex;
            justify-content: space-around;
            text-align: left;
            margin-top: 20px;
        }
        .profile-details div {
            flex: 1;
            margin: 0 10px;
        }
        .profile-details h3 {
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        footer {
            background-color: #222;
            color: #ccc;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
        <nav>

            <a href="index_usuario.jsp">Explorar Proyectos</a>
            <a href="../Usuario/Proyecto/ListaProyectos.jsp?idUsuario=<%= usuario.getId_usuario() %>">Mis Proyectos</a>
            <a href="../Usuario/MisComentarios.jsp?idUsuario=<%= usuario.getId_usuario() %>">Mis Comentarios</a>
            <a href="../Usuario/MisDonaciones.jsp?idUsuario=<%= usuario.getId_usuario() %>">Mis Donaciones</a>
            <div class="dropdown">
                <span>Usuario</span>
                <div class="dropdown-content">
                    <a href="/YoTeApoyo/Usuario/Perfil.jsp">Perfil</a>
                    <a href="/YoTeApoyo/Usuario/editarPerfil.jsp">Editar Perfil</a>
                    <a href="/YoTeApoyo/Usuario/cerrarSesion.jsp">Cerrar sesión</a>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="container">
            <div class="profile-header">
                <img src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(usuario.getAvatar())) %>" alt="Avatar">
                <h1><%= usuario.getNombre() %> <%= usuario.getApellido() %></h1>
                <h2><%= usuario.getCorreo() %></h2>
            </div>
            <div class="profile-details">
                <div>
                    <h3>Acerca de mí</h3>
                    <p><%= usuario.getInformacion_personal() %></p>
                </div>
                <div>
                    <h3>Detalles</h3>
                    <p><strong>Nombre:</strong> <%= usuario.getNombre() %> <%= usuario.getApellido() %></p>
                    <p><strong>Correo:</strong> <%= usuario.getCorreo() %></p>
                    <p><strong>Dirección:</strong> <%= usuario.getDireccion() %></p>
                    <p><strong>Intereses:</strong> <%= usuario.getInteres() %></p>
                    <p><strong>Habilidades:</strong> <%= usuario.getHabilidad() %></p>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>