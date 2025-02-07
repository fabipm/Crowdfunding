<%@page import="Entidad.clsEComentario"%>
<%@page import="Negocio.clsNComentario"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page import="Negocio.clsNUsuario"%>
<%@page import="Negocio.clsNBienesProyecto"%>
<%@page import="Entidad.clsEBienesProyecto"%>
<%@page import="Entidad.clsEProyecto"%>
<%@page import="Negocio.clsNVisualizar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        }
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <% 
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        int idProyecto = Integer.parseInt(request.getParameter("id_proyecto"));
    
        clsNVisualizar negocioProyecto = new clsNVisualizar();
        clsEProyecto proyecto = negocioProyecto.buscarPorId(idProyecto);
    %>
    <h1>Donación</h1>
    <div class="form-container">
        <form name="BusForm" action="addDonar.jsp" method="POST" onsubmit="return validateForm()">
            <input type="hidden"  id="id_usuario" name="id_usuario" value="<%=idUsuario  %>"  readonly><br><br>
            <label for="nombre_proyecto">Nombre de Proyecto: <%=proyecto.getTitulo() %></label><br><br>
            <label for="codigo_proyecto">Código De Proyecto: <%=proyecto.getId_proyecto() %></label>
            <input type="hidden" id="codigo_proyecto" name="codigo_proyecto" value="<%=proyecto.getId_proyecto() %>" readonly><br><br>
            <label for="fecha">Fecha: <%= java.time.LocalDate.now() %></label>
            <input type="hidden" id="fecha" name="fecha" value="<%= java.time.LocalDate.now() %>" readonly><br><br>
            <label for="monto">Monto:</label>
            <input type="text" id="monto" name="monto" pattern="[0-9]+" title="Por favor, ingresa solo números" required><br><br>
            <input type="submit" value="AGREGAR">
        </form>
    </div>
    <script>
        document.getElementById("fecha").valueAsDate = new Date();
    </script>
</body>
</html>

