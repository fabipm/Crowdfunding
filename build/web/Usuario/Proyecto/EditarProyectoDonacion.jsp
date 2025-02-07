

<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@page import="java.util.List"%>
<%@page import="Negocio.clsNDepartamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idProyectoParam = request.getParameter("id");
    String idTipoProyectoParam = request.getParameter("idtipoproyecto");
    int idProyecto = 0;
    int idTipoProyecto = 0;
    
    try {
        if (idProyectoParam != null && !idProyectoParam.isEmpty()) {
            idProyecto = Integer.parseInt(idProyectoParam);
        } else {
            throw new NumberFormatException("El parámetro 'id' está vacío o es nulo");
        }
        
        if (idTipoProyectoParam != null && !idTipoProyectoParam.isEmpty()) {
            idTipoProyecto = Integer.parseInt(idTipoProyectoParam);
        } else {
            throw new NumberFormatException("El parámetro 'idtipoproyecto' está vacío o es nulo");
        }
    } catch (NumberFormatException e) {
        out.println("Error: " + e.getMessage() + "<br>");
        return;
    }
    
    clsNProyecto objNProyecto = new clsNProyecto();
    clsEProyecto proyecto = objNProyecto.obtenerProyectoPorId(idProyecto);
    
    clsNProyectovoluntariado objNPV = new clsNProyectovoluntariado();
    clsEProyectovoluntariado proyectoVol = objNPV.obtenerProyectoVoluntariadoPorId(idProyecto);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                width: 100%;
            }
            h1, h2 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin-top: 10px;
                color: #555;
            }
            input[type="text"], input[type="date"], textarea, select {
                width: calc(100% - 20px);
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            textarea {
                resize: vertical;
            }
            input[type="submit"], button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                margin-top: 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                display: block;
                width: 100%;
                box-sizing: border-box;
            }
            input[type="submit"]:hover, button:hover {
                background-color: #45a049;
            }
            .hidden {
                display: none;
            }
            .alert {
                color: red;
                font-weight: bold;
            }
        </style>
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
                // Mostrar botón y div adicional si idTipoProyecto es 2
                var idTipoProyecto = <%= idTipoProyecto %>;
                if (idTipoProyecto === 2) {
                    document.getElementById('showAdditionalFormButton').style.display = 'block';
                }
            };
            
            function showAdditionalForm() {
                document.getElementById('additionalFormContainer').style.display = 'block';
            }
            
            function showAlert(message) {
                alert(message);
            }
            
            
            
        </script>
    </head>
    <body>
        
        <div class="container">
        <h1>Editar Proyecto Tipo Donación</h1>

            <p>Id del Proyecto: <%= idProyecto %></p>
            <p>Id del Tipo de Proyecto: <%= idTipoProyecto %></p>
            <form action="editProyecto.jsp" method="post">
                <input type="hidden" name="idproyecto" value="<%= idProyecto %>">
                <input type="hidden" name="idtipoproyecto" value="<%= idTipoProyecto %>">

                <label for="titulo">Título de Proyecto:</label>
                <input type="text" id="titulo" name="titulo" value="<%= proyecto.getTitulo() %>"><br>

                <label for="descripcion_corta">Descripción corta:</label><br>
                <textarea id="descripcion_corta" name="descripcion_corta" rows="4" cols="50"><%= proyecto.getDescripcion_corta() %></textarea><br>

                <label for="departamento">Departamento:</label>
                <select id="departamento" name="departamento">
                    <% 
                        clsNDepartamento objDepartamento = new clsNDepartamento(); // Suponiendo que tienes una clase clsNDepartamento similar a clsNProvincia
                        List<clsEDepartamento> departamentos = objDepartamento.listarDepartamentos(); // Método para obtener la lista de departamentos desde la base de datos
                        for (clsEDepartamento departamento : departamentos) {
                    %>
                    <option value="<%= departamento.getId_departamento() %>" <%= (departamento.getId_departamento() == proyecto.getId_departamento()) ? "selected" : "" %>><%= departamento.getNombre() %></option>
                    <% } %>
                </select><br>

                <label for="provincia">Provincia:</label>
                <select id="provincia" name="provincia">
                    <% 
                        clsNProvincia objProvincia = new clsNProvincia();
                        List<clsEProvincia> provincias = objProvincia.listarProvincias();
                        for (clsEProvincia provincia : provincias) {
                    %>
                    <option value="<%= provincia.getId_provincia() %>" <%= (provincia.getId_provincia() == proyecto.getId_provincia()) ? "selected" : "" %>><%= provincia.getNombre() %></option>
                    <% } %>
                </select><br>

                <label for="lista_donaciones">Lista de Donaciones que se aceptan:</label>
                <input type="text" id="lista_donaciones" name="lista_donaciones" value="<%= proyecto.getLista_donacion() %>"><br>

                <label for="tipo_proyecto">Tipo de proyecto:</label>
                <select id="tipo_proyecto" name="tipo_proyecto">
                    <option value="permanente" <%= ("permanente".equals(proyecto.getTipo_duracion())) ? "selected" : "" %>>Permanente</option>
                    <option value="temporal" <%= ("temporal".equals(proyecto.getTipo_duracion())) ? "selected" : "" %>>Temporal</option>
                </select><br>

                <div id="fecha_limite_container" style="display: none;">
                    <label for="fecha_limite">Fecha límite:</label>
                    <input type="date" id="fecha_limite" name="fecha_limite" value="<%= (proyecto.getFecha_limite() != null) ? proyecto.getFecha_limite() : "" %>"><br>
                </div>

                <label for="video_youtube">Video YouTube:</label>
                <input type="text" id="video_youtube" name="video_youtube" value="<%= proyecto.getVideo() %>"><br>

                <label for="descripcion_larga">Descripción larga:</label><br>
                <textarea id="descripcion_larga" name="descripcion_larga" rows="4" cols="50"><%= proyecto.getDescripcion_larga() %></textarea><br>

                <input type="submit" value="Editar">
            </form>
                
                
                

                <button id="showAdditionalFormButton" style="display: none;" onclick="showAdditionalForm()">Mostrar formulario adicional</button>       
                
                <div id="additionalFormContainer" style="display: none;">
                    <h2>Editar Proyecto Voluntario</h2>
                    
                    <form action="editProyecVol.jsp" method="post">
                        <!-- Campos del formulario ProyectoVoluntario -->
                        <input type="hidden" name="idproyecto" value="<%= idProyecto %>">
                        <label for="ubicacionVoluntariado">Escriba ubicacion donde se realizara el voluntariado:</label>
                        <input type="text" id="ubicacionVoluntariado" name="ubicacionVoluntariado" value="<%= (proyectoVol != null) ? proyectoVol.getUbicacion() : "" %>"><br>

                        <label for="Voluntarios_requeridos">Escriba la cantidad de voluntarios requeridos:</label>
                        <input type="text" id="Voluntarios_requeridos" name="Voluntarios_requeridos" value="<%= (proyectoVol != null) ? proyectoVol.getVoluntario_requerido() : "" %>"><br>

                        <label for="funciones_voluntarios">Escriba una descripción de funciones de los voluntarios:</label><br>
                        <textarea id="funciones_voluntarios" name="funciones_voluntarios" rows="4" cols="50"><%= (proyectoVol != null) ? proyectoVol.getFunciones() : "" %></textarea><br>

                        <input type="submit" value="Editar">
                    </form>
                </div> 
                
        </div>
    </body>
</html>
