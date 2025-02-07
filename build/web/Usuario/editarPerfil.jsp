
<%@page import="java.util.Base64"%>
<%@page import="Negocio.clsNUsuario"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
    String successMessage = (String) session.getAttribute("successMessage");
    session.removeAttribute("successMessage"); // Remove the message after displaying it

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
    <title>Editar Perfil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
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
            align-items: center; /* Asegura que los elementos se alineen verticalmente al centro */
            padding: 1em;
        }
        header nav {
            display: flex;
            gap: 1em;
            position: relative;
            flex-grow: 1; /* Hace que el nav ocupe el espacio disponible */
            justify-content: flex-end; /* Alinea los elementos del nav a la derecha */
        }
        header nav a, .dropdown > span {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 5px;
            display: flex;
            align-items: center; /* Asegura que los enlaces estén centrados verticalmente */
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
            right: 0; /* Asegura que el menú se alinee al borde derecho del dropdown */
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
        }
        footer {
            background-color: #222;
            color: #ccc;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 20px auto;
            text-align: center;
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            position: relative;
        }
        .avatar-container {
            position: relative;
        }
        .avatar {
            border-radius: 50%;
            width: 100px;
            height: 100px;
        }
        .upload-button {
            position: absolute;
            top: 0;
            right: -15px;
            background-color: #ff5722;
            border: none;
            color: white;
            border-radius: 20%;
            padding: 5px;
            cursor: pointer;
            font-size: 12px;
            transition: transform 0.3s ease-in-out;
        }
        .upload-button:hover {
            background-color: #e64a19;
            transform: scale(1.1);
        }
        .user-info {
            text-align: left;
            flex: 1;
            margin-left: 20px;
        }
        .user-info h2 {
            margin: 0;
            font-size: 24px;
        }
        .user-info p {
            margin: 5px 0 0;
            color: #888;
        }
        .profile-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input,
        .form-group textarea {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn-save {
            grid-column: span 2;
            padding: 10px;
            background-color: #ff5722;
            border: none;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 50px;
            transition: transform 0.3s ease-in-out;
        }
        .btn-save:hover {
            background-color: #e64a19;
            transform: scale(1.05);
        }
        .success-message {
            color: green;
            position: absolute; 
            bottom: 250px; 
            left: 50%; 
            transform: translateX(-50%); 
            margin-bottom: 10px;
            grid-column: span 2;
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

    <main id="content">
        <div class="container">
            <div class="profile-header">
                <div class="avatar-container">
                    <img src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(usuario.getAvatar())) %>" alt="Avatar" class="avatar">
                    <button class="upload-button" onclick="document.getElementById('avatarInput').click();">+</button>
                    <form id="avatarForm" action="../Usuario/procesarEditarImagen.jsp" method="post" enctype="multipart/form-data" style="display:none;">
                        <input type="file" id="avatarInput" name="avatar" onchange="document.getElementById('avatarForm').submit();">
                    </form>
                </div>
                <div class="user-info">
                    <h2><%= usuario.getNombre() %> <%= usuario.getApellido() %></h2>
                    <p><%= usuario.getDireccion() %></p>
                </div>
            </div>

            <form action="../Usuario/procesarEditarPerfil.jsp" method="post" class="profile-form">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombre() %>" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" value="<%= usuario.getApellido() %>" required>
                </div>
                <div class="form-group">
                    <label for="correo">Correo:</label>
                    <input type="email" id="correo" name="correo" value="<%= usuario.getCorreo() %>" required>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" value="<%= usuario.getDireccion() %>">
                </div>
                <div class="form-group">
                    <label for="informacion_personal">Información Personal:</label>
                    <textarea id="informacion_personal" name="informacion_personal"><%= usuario.getInformacion_personal() %></textarea>
                </div>
                <div class="form-group">
                    <label for="interes">Intereses:</label>
                    <textarea id="interes" name="interes"><%= usuario.getInteres() %></textarea>
                </div>
                <div class="form-group">
                    <label for="habilidad">Habilidades:</label>
                    <textarea id="habilidad" name="habilidad"><%= usuario.getHabilidad() %></textarea>
                </div>

                <% if (successMessage != null) { %>
                    <p class="success-message"><%= successMessage %></p>
                <% } %>

                <button type="submit" class="btn-save">GUARDAR CAMBIOS</button>
            </form>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>