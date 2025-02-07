<%@page import="Negocio.clsNComentario"%>
<%@page import="Entidad.clsEComentario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <script type="text/javascript">
        function redirectToVisualizar() {
            setTimeout(function() {
                var proyectoId = '<%= request.getParameter("id_proyecto") %>';
                var usuario = '<%= request.getParameter("id_usuario") %>';
                window.location.href = "Visualizar.jsp?id=" + proyectoId + "&id_usuario=" + usuario;
            }, 500); // Cambia el valor a la cantidad de milisegundos que desees esperar antes de redirigir (en este caso, 2 segundos)
        }
    </script>
</head>
<body>
    <% 
        clsEComentario objEB = new clsEComentario();
        clsNComentario objNB = new clsNComentario();
        
        objEB.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        objEB.setNombreUsuario(request.getParameter("nombreUsuario"));
        objEB.setComentario(request.getParameter("comentario"));    
        objEB.setRecomendacion(request.getParameter("recomendacion"));
        objEB.setId_proyecto(Integer.parseInt(request.getParameter("id_proyecto")));
        objEB.setCalificacion(Integer.parseInt(request.getParameter("calificacion")));
        
        boolean success = objNB.addComentario(objEB);
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
