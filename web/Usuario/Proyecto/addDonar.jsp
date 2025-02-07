

<%@page import="Negocio.clsNBienesProyecto"%>
<%@page import="Entidad.clsEBienesProyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donacion</title>
        <script type="text/javascript">
        // Función para redirigir a visualizar.jsp después de 2 segundos
        function redirectToVisualizar() {
            setTimeout(function() {
                var proyectoId = '<%= request.getParameter("codigo_proyecto") %>';
                window.location.href = "Visualizar.jsp?id=" + proyectoId;
            }, 500); // Cambia el valor a la cantidad de milisegundos que desees esperar antes de redirigir (en este caso, 2 segundos)
        }
    </script>
    </head>
    <body>
         <% 
        clsEBienesProyecto objEB = new clsEBienesProyecto();
        clsNBienesProyecto objNB = new clsNBienesProyecto();
        
        objEB.setCantidad(Integer.parseInt(request.getParameter("monto")));
        objEB.setFecha(request.getParameter("fecha")); 
        objEB.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));          
        objEB.setId_proyecto(Integer.parseInt(request.getParameter("codigo_proyecto")));
        
        
        
        
        boolean success = objNB.egregarDonacion(objEB);
        if (success) {
    %>
    <script type='text/javascript'>
        // Utiliza alert() para mostrar un mensaje
        alert('Se guardó correctamente');
        redirectToVisualizar();
        
    </script>
    <%
        } else {
    %>
    <script type='text/javascript'>
        // Utiliza alert() para mostrar un mensaje
        alert('No se guardó');
    </script>
    <%
        }
    %>
    </body>
</html>
