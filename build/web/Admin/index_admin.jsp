
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
    <title>Administrador - Bienvenida</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f9f9f9;
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
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
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
        .footer-info {
            text-align: left;
            padding: 20px;
            color: #ccc;
        }
        .footer-info h3 {
            margin: 0 0 10px 0;
        }
        .footer-info p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Yo te Apoyo</h1>
        </div>
        <nav>
            <div class="dropdown">
                <a href="#">Campañas</a>
                <div class="dropdown-content">
                    <a href="#">Campañas Publicadas</a>
                    <a href="/YoTeApoyo/Admin/proyectoporpublicar.jsp">Campañas Por Publicar</a>
                </div>
            </div>
            <a href="#">Usuarios</a>
            <div class="dropdown">
                <a href="#">Administrador</a>
                <div class="dropdown-content">
                    <a href="Usuario/cerrarSesion.jsp">Salir</a>
                </div>
            </div>
        </nav>
    </header>
    <div class="container">
        <h2>Bienvenido Administrador de YO TE APOYO</h2>
        <p>Te Encuentras Conectado</p>
    </div>
    <footer>
       <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
