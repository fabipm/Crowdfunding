
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, Entidad.clsEUsuario, Negocio.clsNUsuario, Config.Conexion" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        header, footer {
            background-color: #333232;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
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
        header nav a {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        header nav a:hover {
            background-color: #555;
        }
        main {
            flex: 1;
            padding: 2em;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        footer {
            background-color: #333232;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: relative;
            width: 100%;
        }
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        .login-box {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .login-box h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .login-box label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-box input {
            width: calc(100% - 20px);
            padding: 8px 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .login-box button {
            width: 100%;
            padding: 10px;
            background-color: #0066cc;
            border: none;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .login-box button:hover {
            background-color: #004080;
        }
        .login-box .register-link {
            margin-top: 10px;
        }
        .login-box .register-link a {
            color: #0066cc;
            text-decoration: none;
        }
        .login-box .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
        <nav>

            <a href="#">Ingresar</a>
        </nav>
    </header>
    <main>
        <div class="login-container">
            <div class="login-box">
                <h1>Ingresar</h1>
                <form action="procesarLogin.jsp" method="post">
                    <label for="correo">Correo:</label>
                    <input type="text" id="correo" name="correo" required>
                    <label for="clave">Contraseña:</label>
                    <input type="password" id="clave" name="clave" required>
                    <button type="submit">Ingresar</button>
                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
                    <% } %>
                </form>
                <div class="register-link">
                    ¿Todavía no tienes una cuenta? <a href="register.jsp">Registrarse</a>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </footer>
</body>
</html>