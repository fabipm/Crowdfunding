

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #003366;
            color: #ffffff;
            padding: 10px 0;
            text-align: center;
        }
        .header a {
            color: #ffffff;
            text-decoration: none;
            padding: 0 15px;
        }
        .register-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }
        .register-box {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .register-box h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }
        .register-box label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .register-box input {
            width: calc(100% - 20px);
            padding: 8px 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .register-box button {
            width: 100%;
            padding: 10px;
            background-color: #0066cc;
            border: none;
            color: #ffffff;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .register-box button:hover {
            background-color: #004080;
        }
        .footer {
            background-color: #003366;
            color: #ffffff;
            text-align: center;
            padding: 20px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="header">
        <a href="#">Conoce más</a>
        <a href="#">Explorar Proyectos</a>
        <a href="#">Crear Proyecto</a>
        <a href="#">Mi Cuenta</a>
    </div>
    <div class="register-container">
        <div class="register-box">
            <h1>REGISTRATE</h1>
            <form action="procesarRegistro.jsp" method="post">
                <label for="apellido">Apellidos:</label>
                <input type="text" id="apellido" name="apellido" required>
                
                <label for="nombre">Nombres:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="correo">Correo Electrónico:</label>
                <input type="email" id="correo" name="correo" required>
                
                <label for="clave">Contraseña:</label>
                <input type="password" id="clave" name="clave" required>
                
                <label for="verificacionClave">Verificación Contraseña:</label>
                <input type="password" id="verificacionClave" name="verificacionClave" required>
                
                <button type="submit">Registrarse</button>
             <% if (request.getAttribute("errorMessage") != null) { %>
                <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
            <% } %>
            <% if (request.getAttribute("successMessage") != null) { %>
                <p class="success-message"><%= request.getAttribute("successMessage") %></p>
                 
                
            <% } %>
            <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a>.</p>
            </form>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Yo Te Apoyo. Todos los derechos reservados.</p>
    </div>
</body>
</html>

