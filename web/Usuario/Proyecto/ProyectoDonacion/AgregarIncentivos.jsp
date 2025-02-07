<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Incentivo</title>
        <script>
            function showAlert(message) {
                alert(message);
            }

            function SiguienteJSP() {
                window.location.href = "AgregarLinks.jsp";
            }

            function validateForm() {
                var nombreIncentivo = document.getElementById('nombre_incentivo').value.trim();
                var descripcionDonacion = document.getElementById('descripcion_donacion').value.trim();
                var descripcionIncentivo = document.getElementById('descripcion_incentivo').value.trim();

                if (nombreIncentivo === "") {
                    alert("El título del incentivo no puede estar vacío.");
                    return false;
                }
                if (descripcionDonacion === "") {
                    alert("La descripción de donación no puede estar vacía.");
                    return false;
                }
                if (descripcionIncentivo === "") {
                    alert("La descripción del incentivo no puede estar vacía.");
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
            textarea {
                width: 100%;
                padding: 0.5em;
                margin-bottom: 1em;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"],
            button {
                background-color: #333;
                color: white;
                padding: 0.75em;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                margin-top: 1em;
            }
            input[type="submit"]:hover,
            button:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <%
            String nombreIncentivo = request.getParameter("nombre_incentivo");
            String descripcionDonacion = request.getParameter("descripcion_donacion");
            String descripcionIncentivo = request.getParameter("descripcion_incentivo");
            clsNProyecto objNP = new clsNProyecto();
            int idProyecto = objNP.obtenerUltProy();

            clsEIncentivoDonacion objEID = new clsEIncentivoDonacion();
            clsNIncentivoDonacion objNID = new clsNIncentivoDonacion();

            objEID.setNombre_incentivo(nombreIncentivo);
            objEID.setDescripcion_donacion(descripcionDonacion);
            objEID.setDescripcion_incentivo(descripcionIncentivo);
            objEID.setId_proyecto(idProyecto);

            boolean success = objNID.guardarIncentivo(objEID);

            // Redirigir o mostrar un mensaje basado en el resultado de la operación
            if (success) {
                out.print("<script type='text/javascript'>showAlert('Se guardó correctamente');</script>");
            }
        %>
        <div class="container">
            <h1>Formulario de Incentivo</h1>
            <form action="AgregarIncentivos.jsp" method="post" onsubmit="return validateForm()">
                <label for="nombre_incentivo">Título del Incentivo:</label>
                <input type="text" id="nombre_incentivo" name="nombre_incentivo" required>
                
                <label for="descripcion_donacion">Descripción de donación:</label>
                <textarea id="descripcion_donacion" name="descripcion_donacion" rows="4" required></textarea>
                
                <label for="descripcion_incentivo">Descripción de incentivo:</label>
                <textarea id="descripcion_incentivo" name="descripcion_incentivo" rows="4" required></textarea>
                
                <input type="submit" value="Añadir">
            </form>
            <button onclick="SiguienteJSP()">Siguiente</button>
        </div>
    </body>
</html>
