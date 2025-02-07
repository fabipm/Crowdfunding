<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario de Incentivo de Voluntariado</title>
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
            .container {
                max-width: 600px;
                padding: 20px;
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
            String descripcion_voluntario = request.getParameter("descripcion_voluntario");
            String descripcionIncentivo = request.getParameter("descripcion_incentivo");

            clsNProyectovoluntariado objNPV = new clsNProyectovoluntariado();
            int idProyectoVol = objNPV.obtenerUltProyVol();


            clsEIncentivoVoluntario objEIV = new clsEIncentivoVoluntario();
            clsNIncentivoVoluntario objNIV = new clsNIncentivoVoluntario();

            objEIV.setTitulo(nombreIncentivo);
            objEIV.setDescripcion_voluntariado(descripcion_voluntario);
            objEIV.setDescripcion_incentivo(descripcionIncentivo);
            objEIV.setId_proyecto_voluntariado(idProyectoVol);

            boolean success = objNIV.guardarIncentivo(objEIV);

            // Redirigir o mostrar un mensaje basado en el resultado de la operación
            if (success) {
                out.print("<script type='text/javascript'>showAlert('Se guardó correctamente');</script>");
            } else {

            }

        %>
        <div class="container">
            <h1>Formulario de Incentivo de Voluntariado</h1>
            <form action="AgregarIncentivos.jsp" method="post" onsubmit="return validateForm()">
                <label for="nombre_incentivo">Título del Incentivo:</label><br>
                <input type="text" id="nombre_incentivo" name="nombre_incentivo" required><br>

                <label for="descripcion_voluntario">Descripción del voluntario:</label><br>
                <textarea id="descripcion_voluntario" name="descripcion_voluntario" rows="4" cols="50" required></textarea><br>

                <label for="descripcion_incentivo">Descripción del incentivo:</label><br>
                <textarea id="descripcion_incentivo" name="descripcion_incentivo" rows="4" cols="50" required></textarea><br>

                <input type="submit" value="Añadir">
            </form>
            <button onclick="SiguienteJSP()">Siguiente</button>     
        </div>
    </body>
</html>
