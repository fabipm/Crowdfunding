<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
    function showAlert(message, redirectUrl = null) {
        alert(message);
        if (redirectUrl) {
            window.location.href = redirectUrl;
        }
    }
</script>
<%
    // Obtener el valor de idProyecto del parámetro de la solicitud
    String idProyectoStr = request.getParameter("idproyecto");
    int idProyecto = 0;

    // Convertir el valor de idProyecto a entero si no es nulo ni vacío
    if (idProyectoStr != null && !idProyectoStr.isEmpty()) {
        try {
            idProyecto = Integer.parseInt(idProyectoStr);
        } catch (NumberFormatException e) {
            // Manejar la excepción, si es necesario
        }
    }

    // Datos para la tabla de proyecto voluntario
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

    out.print("ID del Proyecto: " + idProyecto + "<br>");
    out.print("Ubicación del Voluntariado: " + ubicacionVoluntariado + "<br>");
    out.print("Voluntarios Requeridos: " + voluntariosRequeridos + "<br>");
    out.print("Funciones de los Voluntarios: " + funciones_voluntarios + "<br>");

    // Crear el objeto de negocio y el objeto de entidad
    clsEProyectovoluntariado objEPV = new clsEProyectovoluntariado();
    clsNProyectovoluntariado objNPV = new clsNProyectovoluntariado();
    // Asignar los valores obtenidos a los atributos del objeto de entidad
    objEPV.setUbicacion(ubicacionVoluntariado);
    objEPV.setVoluntario_requerido(voluntariosRequeridos);
    objEPV.setFunciones(funciones_voluntarios);
    objEPV.setId_proyecto(idProyecto);

    // Llamar al método de guardar del proyecto voluntario
    boolean success = objNPV.editarProyectoVoluntario(objEPV);

    if (success) {
        out.print("<script type='text/javascript'>showAlert('Se editó correctamente', 'ListaProyectos.jsp');</script>");
    } else {
        out.print("<script type='text/javascript'>showAlert('No se editó');</script>");
    }
%>
