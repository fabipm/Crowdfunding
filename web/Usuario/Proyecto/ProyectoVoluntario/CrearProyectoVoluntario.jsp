<%@page import="Entidad.clsEDepartamento"%>
<%@page import="Entidad.clsEProvincia"%>
<%@page import="Negocio.clsNDepartamento"%>
<%@page import="Negocio.clsNProvincia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Proyecto Voluntariado</title>
        <script>
            window.onload = function() {
                // Mostrar/ocultar la fecha límite según el tipo de proyecto
                document.getElementById('tipo_proyecto').addEventListener('change', function() {
                    var tipoProyecto = this.value;
                    if (tipoProyecto === 'temporal') {
                        document.getElementById('fecha_limite_container').style.display = 'block';
                    } else {
                        document.getElementById('fecha_limite_container').style.display = 'none';
                    }
                });

                // Ocultar y deshabilitar el formulario de Voluntariado cuando se interactúa con el formulario de Proyecto
                var formProyectoInputs = document.querySelectorAll('#formularioProyecto input, #formularioProyecto textarea, #formularioProyecto select');
                formProyectoInputs.forEach(function(input) {
                    input.addEventListener('input', function() {
                        document.getElementById('formularioVoluntariado').style.display = 'none';
                        document.getElementById('formularioVoluntariado').querySelectorAll('input, textarea, select').forEach(function(input) {
                            input.disabled = true;
                        });
                    });
                });

                // Ocultar y deshabilitar el formulario de Proyecto cuando se interactúa con el formulario de Voluntariado
                var formVoluntariadoInputs = document.querySelectorAll('#formularioVoluntariado input, #formularioVoluntariado textarea, #formularioVoluntariado select');
                formVoluntariadoInputs.forEach(function(input) {
                    input.addEventListener('input', function() {
                        document.getElementById('formularioProyecto').style.display = 'none';
                        document.getElementById('formularioProyecto').querySelectorAll('input, textarea, select').forEach(function(input) {
                            input.disabled = true;
                        });
                    });
                });
            };

    
            //Mensaje de alerta
            function showAlert(message) {
                alert(message);
            }
            //validaciones
            function validateForm() {
                var titulo = document.getElementById('titulo').value.trim();
                var descripcionCorta = document.getElementById('descripcion_corta').value.trim();
                var listaDonaciones = document.getElementById('lista_donaciones').value.trim();
                var videoYoutube = document.getElementById('video_youtube').value.trim();
                var descripcionLarga = document.getElementById('descripcion_larga').value.trim();

                if (titulo === "") {
                    alert("El título de la Proyecto no puede estar vacío.");
                    return false;
                }
                if (descripcionCorta === "") {
                    alert("La descripción corta no puede estar vacía.");
                    return false;
                }
                if (listaDonaciones === "") {
                    alert("La lista de donaciones no puede estar vacía.");
                    return false;
                }
                if (!isValidYoutubeLink(videoYoutube)) {
                    alert("El enlace de YouTube no es válido.");
                    return false;
                }
                if (descripcionLarga === "") {
                    alert("La descripción larga no puede estar vacía.");
                    return false;
                }

                return true;
            }

            function isValidYoutubeLink(url) {
                var youtubePattern = /^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$/;
                return youtubePattern.test(url);
            }    
            
        </script>
                <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                width: 100%;
                margin: 20px;
            }

            h1 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #555;
            }

            input[type="text"], input[type="date"], textarea, select {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                width: 100%;
                background-color: #28a745;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #218838;
            }

            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Crear Proyecto Tipo Voluntario</h1>
            <form id="formularioProyecto" action="GuardasProyectosAux/crearProyecto.jsp" method="post" onsubmit="return validateForm()">
                <label for="titulo">Título de Proyecto</label>
                <input type="text" id="titulo" name="titulo"><br>
                <label for="descripcion_corta">Escriba una descripción corta:</label><br>
                <textarea id="descripcion_corta" name="descripcion_corta" rows="4" cols="50"></textarea><br>
                <label for="departamento">Departamento:</label>
                <select id="departamento" name="departamento">
                    <% 
                        clsNDepartamento objDepartamento = new clsNDepartamento();
                        List<clsEDepartamento> departamentos = objDepartamento.listarDepartamentos();
                        for (clsEDepartamento departamento : departamentos) {
                    %>
                        <option value="<%= departamento.getId_departamento() %>"><%= departamento.getNombre() %></option>
                    <% } %>
                </select><br>
                <label for="provincia">Provincia:</label>
                <select id="provincia" name="provincia">
                    <% 
                        clsNProvincia objProvincia = new clsNProvincia();
                        List<clsEProvincia> provincias = objProvincia.listarProvincias();
                        for (clsEProvincia provincia : provincias) {
                    %>
                        <option value="<%= provincia.getId_provincia() %>"><%= provincia.getNombre() %></option>
                    <% } %>
                </select><br>
                <label for="tipo_proyecto">Tipo de proyecto:</label>
                <select id="tipo_proyecto" name="tipo_proyecto">
                    <option value="permanente">Permanente</option>
                    <option value="temporal">Temporal</option>
                </select><br>
                <div id="fecha_limite_container" style="display: none;">
                    <label for="fecha_limite">Fecha límite:</label>
                    <input type="date" id="fecha_limite" name="fecha_limite"><br>
                </div>
                <label for="video_youtube">Video de YouTube:</label>
                <input type="text" id="video_youtube" name="video_youtube"><br>
                <label for="descripcion_larga">Escriba una descripción larga:</label><br>
                <textarea id="descripcion_larga" name="descripcion_larga" rows="4" cols="50"></textarea><br>
                <input type="submit" value="Registrar">
            </form>
        </div>
        <div class="container">
            <form id="formularioVoluntariado" action="GuardasProyectosAux/crearProyectoVolun.jsp" method="post">
                <label for="ubicacionVoluntariado">Escriba ubicación donde se realizará el voluntariado:</label>
                <input type="text" id="ubicacionVoluntariado" name="ubicacionVoluntariado"><br>
                <label for="Voluntarios_requeridos">Escriba la cantidad de voluntarios requeridos:</label>
                <input type="text" id="Voluntarios_requeridos" name="Voluntarios_requeridos"><br>
                <label for="funciones_voluntarios">Escriba una descripción de funciones de los voluntarios:</label><br>
                <textarea id="funciones_voluntarios" name="funciones_voluntarios" rows="4" cols="50"></textarea><br>
                <input type="submit" value="Registrar">
            </form>
        </div>
    </body>
</html>
