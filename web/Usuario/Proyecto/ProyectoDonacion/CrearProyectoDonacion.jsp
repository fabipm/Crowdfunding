<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Proyecto Donacion</title>
        <script>
            // Función que se ejecuta cuando la página esté completamente cargada
            window.onload = function() {
                // JavaScript para mostrar/ocultar la fecha de límite según el tipo de proyecto
                document.getElementById('tipo_proyecto').addEventListener('change', function() {
                    var tipoProyecto = this.value;
                    if (tipoProyecto === 'temporal') {
                        document.getElementById('fecha_limite_container').style.display = 'block';
                    } else {
                        document.getElementById('fecha_limite_container').style.display = 'none';
                    }
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
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
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
            header nav a, .dropdown > a {
                color: white;
                text-decoration: none;
                padding: 0.5em 1em;
                border-radius: 5px;
                display: flex;
                align-items: center;
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
                background-color: #fff;
                margin: 2em auto;
                max-width: 800px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 8px;
            }
            footer {
                background-color: #222;
                color: #ccc;
            }
            .container {
                display: flex;
                flex-direction: column;
                gap: 1.5em;
                max-width: 600px;
                margin: auto;
                padding: 2em;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin-bottom: 0.5em;
                color: #555;
            }
            input[type="text"],
            input[type="date"],
            textarea,
            select {
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
            }
            input[type="submit"]:hover {
                background-color: #555;
            }
            #fecha_limite_container {
                display: none;
            }
        </style>        
    </head>
    <body>
    <%
        String titulo = request.getParameter("titulo");
        String descripcionCorta = request.getParameter("descripcion_corta");
        String fechaLimite = request.getParameter("fecha_limite");
        // Si fechaLimite es una cadena vacía, asignamos null
        if (fechaLimite != null && fechaLimite.trim().isEmpty()) {
            fechaLimite = null;
        }
        String videoYoutube = request.getParameter("video_youtube");
        String tipoDuracionProyecto = request.getParameter("tipo_proyecto");
        String descripcionLarga = request.getParameter("descripcion_larga");
        String lista_donaciones = request.getParameter("lista_donaciones");
        
        // Proporcionar valores predeterminados o manejar nulos en caso de DEPARTAMENTO Y PROVINCIA
        String idDepartamentoStr = request.getParameter("departamento");
        int idDepartamento = (idDepartamentoStr != null && !idDepartamentoStr.isEmpty()) ? Integer.parseInt(idDepartamentoStr) : -1;

        String idProvinciaStr = request.getParameter("provincia");
        int idProvincia = (idProvinciaStr != null && !idProvinciaStr.isEmpty()) ? Integer.parseInt(idProvinciaStr) : -1;

        // SE LE DIO UN ID MANUAL YA NO QUE NO HAY LOGIN
        clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("../login.jsp");
            return;
        }
        
        
        
        // Crear el objeto de negocio y el objeto de entidad
        clsNProyecto objNProyectoDonacion = new clsNProyecto();
        clsEProyecto objEProyectoDonacion = new clsEProyecto();

        // Asignar los valores obtenidos a los atributos del objeto de entidad

        objEProyectoDonacion.setTitulo(titulo);
        objEProyectoDonacion.setDescripcion_corta(descripcionCorta);
        objEProyectoDonacion.setFecha_limite(fechaLimite);
        objEProyectoDonacion.setVideo(videoYoutube);
        objEProyectoDonacion.setTipo_duracion(tipoDuracionProyecto);
        objEProyectoDonacion.setDescripcion_larga(descripcionLarga);
        objEProyectoDonacion.setLista_donacion(lista_donaciones);
        objEProyectoDonacion.setId_tipo_Proyecto(1); // Asignamos 1 ya que es ProyectoDonacion siempre es 1
        objEProyectoDonacion.setId_departamento(idDepartamento);
        objEProyectoDonacion.setId_provincia(idProvincia);
        objEProyectoDonacion.setId_usuario(usuario.getId_usuario());
        
        // Guardar el proyecto en la base de datos
        boolean success = objNProyectoDonacion.agregarProyecto(objEProyectoDonacion);

        // Redirigir o mostrar un mensaje basado en el resultado de la operación
        if (success) {
            response.sendRedirect("AgregarIncentivos.jsp");
        } else {
            //out.print("<script type='text/javascript'>showAlert('Hubo un problema al guardar el proyecto.');</script>");
        }
    %>  
        <div class="container">
            <h1>Crear Proyecto Tipo Donación</h1>
            
            <form action="CrearProyectoDonacion.jsp" method="post" onsubmit="return validateForm()">
                
                    <label for="titulo">Título de Proyecto</label>
                    <input type="text" id="titulo" name="titulo"><br>
                    <%----------------------------------------------------------------------------------------%>
                    <label for="descripcion_corta">Escriba una escripción corta:</label><br>
                    <textarea id="descripcion_corta" name="descripcion_corta" rows="4" cols="50"></textarea><br>
                    <%----------------------------------------------------------------------------------------%>
                    <label for="departamento">Departamento:</label>
                    <select id="departamento" name="departamento">
                        <% 
                            clsNDepartamento objDepartamento = new clsNDepartamento(); 
                            List<clsEDepartamento> departamentos = objDepartamento.listarDepartamentos(); 
                            for (clsEDepartamento departamento : departamentos) {
                        %>
                            <option value="<%= departamento.getId_departamento()%>"><%= departamento.getNombre()%></option>
                        <% } %>
                    </select><br>
                    <%----------------------------------------------------------------------------------------%>
                    <label for="provincia">Provincia:</label>
                    <select id="provincia" name="provincia">
                        <% 
                            clsNProvincia objProvincia = new clsNProvincia();
                            List<clsEProvincia> provincias = objProvincia.listarProvincias();
                            for (clsEProvincia provincia : provincias) {
                        %>
                            <option value="<%= provincia.getId_provincia()%>"><%= provincia.getNombre()%></option>
                        <% } %>
                    </select><br>
                    <%----------------------------------------------------------------------------------------%>
                    <label for="lista_donaciones">Lista de Donaciones que se aceptan:</label>
                    <input type="text" id="lista_donaciones" name="lista_donaciones"><br>
                    <%----------------------------------------------------------------------------------------%>

                    <label for="tipo_proyecto">Tipo de proyecto:</label>
                    <select id="tipo_proyecto" name="tipo_proyecto">
                        <option value="permanente">Permanente</option>
                        <option value="temporal">Temporal</option>

                    </select><br>
                    <%----------------------------------------------------------------------------------------%>
                    <div id="fecha_limite_container" style="display: none;">
                        <label for="fecha_limite">Fecha límite:</label>
                        <input type="date" id="fecha_limite" name="fecha_limite"><br>
                    </div>
                    <%----------------------------------------------------------------------------------------%>
                    <label for="video_youtube">Video de YouTube:</label>
                    <input type="text" id="video_youtube" name="video_youtube"><br>
                    <%----------------------------------------------------------------------------------------%>
                    <label for="descripcion_larga">Escriba una descripción larga:</label><br>
                    <textarea id="descripcion_larga" name="descripcion_larga" rows="4" cols="50"></textarea><br>
                    <%----------------------------------------------------------------------------------------%>
                    <input type="submit" value="Registrar" >
            </form>   
        </div>
    </body>
</html>
