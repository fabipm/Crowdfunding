

<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>

    function showAlert(message) {
        alert(message);
    }   


</script>
<%

        
        //Datos para labla de proyecto voluntario
        String ubicacionVoluntariado = request.getParameter("ubicacionVoluntariado");
        String voluntariosRequeridosStr = request.getParameter("Voluntarios_requeridos");
        int voluntariosRequeridos = 0; // Valor por defecto en caso de que la conversión falle o el parámetro esté vacío

        if (voluntariosRequeridosStr != null && !voluntariosRequeridosStr.isEmpty()) {
            try {
                voluntariosRequeridos = Integer.parseInt(voluntariosRequeridosStr);
            } catch (NumberFormatException e) {
            }
        }
        String funciones_voluntarios = request.getParameter("funciones_voluntarios");
        
        //obtenesmo el id del ultimo proyecto
        clsNProyecto objNPV2 = new clsNProyecto();
        int idProyecto = objNPV2.obtenerUltProy();
        // Crear el objeto de negocio y el objeto de entidad
        clsEProyectovoluntariado objEPV = new clsEProyectovoluntariado();
        clsNProyectovoluntariado objNPV = new clsNProyectovoluntariado();
        // Asignar los valores obtenidos a los atributos del objeto de entidad
        objEPV.setUbicacion(ubicacionVoluntariado);
        objEPV.setVoluntario_requerido(voluntariosRequeridos);
        objEPV.setFunciones(funciones_voluntarios);
        objEPV.setId_proyecto(idProyecto);
        // LLamaos el metodo de guardar del proyectoVoluntardio 
        boolean success = objNPV.agregarProyectoVoluntario(objEPV);
        
        // Redirigir o mostrar un mensaje basado en el resultado de la operación
        if (success) {
            out.print("<script type='text/javascript'>showAlert('Se Registro correctamente');</script>");
            response.sendRedirect("../AgregarIncentivos.jsp");
        } else {
            out.print("<script type='text/javascript'>showAlert('No se pudo registrar. Intente denuevo');</script>");
            response.sendRedirect("../CrearProyectoVoluntario.jsp");
        }

%>