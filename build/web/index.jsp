

<%@page import="Negocio.clsNUsuario"%>
<%@page import="Entidad.clsEUsuario"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyecto Web</title>
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
        header nav a, .dropdown > a {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 5px;
            display: flex;
            align-items: center; /* Asegura que los enlaces est�n centrados verticalmente */
        }
        header nav a:hover, .dropdown > a:hover {
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
            right: 0; /* Asegura que el men� se alinee al borde derecho del dropdown */
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
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
       
        <nav>
            <div class="dropdown">
                <a href="login.jsp">Ingresar</a>
            </div>
        </nav>
    </header>
    <main id="content">
        <!-- Contenido principal va aqu� -->
        <h2>Bienvenido a Mi Proyecto Web</h2>
        <p>Este es el cuerpo principal de la p�gina. Aqu� puedes poner el contenido que desees.</p>
    </main>
    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>