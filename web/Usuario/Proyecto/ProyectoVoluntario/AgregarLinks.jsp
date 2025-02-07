<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Formulario de Redes Sociales</title>
    <script>
        // Función para validar un enlace de Facebook
        function validarFacebook() {
            var enlace = document.getElementById("facebook").value.trim();
            // Si el campo está vacío, se considera válido
            if (enlace === "") {
                return true;
            }
            // Patrón para validar un enlace de Facebook
            var facebookPattern = /^(https?:\/\/)?(www\.)?facebook.com\/.*/;
            return facebookPattern.test(enlace);
        }

        // Función para validar un enlace de Twitter
        function validarX() {
            var enlace = document.getElementById("x").value.trim();
            // Si el campo está vacío, se considera válido
            if (enlace === "") {
                return true;
            }
            // Patrón para validar un enlace de Twitter
            var xPattern = /^(https?:\/\/)?(www\.)?x\.com\/[A-Za-z0-9_]+$/;
            return xPattern.test(enlace);
        }

        // Función para validar un enlace de YouTube
        function validarYoutube() {
            var enlace = document.getElementById("youtube").value.trim();
            // Si el campo está vacío, se considera válido
            if (enlace === "") {
                return true;
            }
            // Patrón para validar un enlace de YouTube
            var youtubePattern = /^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/.*/;
            return youtubePattern.test(enlace);
        }

        // Función para validar un enlace de Página Web
        function validarPaginaWeb() {
            var enlace = document.getElementById("paginaweb").value.trim();
            // Si el campo está vacío, se considera válido
            if (enlace === "") {
                return true;
            }
            // Patrón para validar un enlace de Página Web
            var paginaWebPattern = /^(https?:\/\/)?(www\.)?[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(\/\S*)?$/;
            return paginaWebPattern.test(enlace);
        }

        // Función principal que llama a las funciones de validación y muestra una alerta si algún enlace no es válido
        function validarFormulario() {
            if (!validarFacebook()) {
                alert("El enlace proporcionado para Facebook no es válido.");
                return false;
            }
            if (!validarX()) {
                alert("El enlace proporcionado para X no es válido.");
                return false;
            }
            if (!validarYoutube()) {
                alert("El enlace proporcionado para YouTube no es válido.");
                return false;
            }
            if (!validarPaginaWeb()) {
                alert("El enlace proporcionado para la Página Web no es válido.");
                return false;
            }

            return true;
        }
    </script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }
            .container {
                display: flex;
                flex-direction: column;
                gap: 1.5em;
                max-width: 600px;
                padding: 2em;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin-bottom: 0.5em;
                color: #555;
            }
            input[type="text"] {
                width: 100%;
                padding: 0.5em;
                margin-bottom: 1em;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #333;
                color: white;
                padding: 0.75em;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                margin-top: 1em;
            }
            input[type="submit"]:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Ingresa tus Redes Sociales o Página web</h2>

            <!-- Formulario para Link -->
            <form action="GuardarLinks/GuardarLinks.jsp" method="post" onsubmit="return validarFormulario()">
                <label for="facebook">Facebook:</label>
                <input type="text" id="facebook" name="facebook">
                
                <label for="x">X</label>
                <input type="text" id="x" name="x">
                
                <label for="youtube">YouTube</label>
                <input type="text" id="youtube" name="youtube">
                
                <label for="paginaweb">Página web</label>
                <input type="text" id="paginaweb" name="paginaweb">
                
                <input type="submit" value="Registrar">
            </form>
        </div>
    </body>
</html>
