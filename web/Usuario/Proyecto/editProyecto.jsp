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
    int idProyecto = Integer.parseInt(request.getParameter("idproyecto"));
    int idTipoProyecto = Integer.parseInt(request.getParameter("idtipoproyecto"));

    clsNProyecto objNProyecto = new clsNProyecto();
    clsEProyecto proyecto = objNProyecto.obtenerProyectoPorId(idProyecto);

    clsNProyectovoluntariado objNPV = new clsNProyectovoluntariado();
    clsEProyectovoluntariado proyectoVol = objNPV.obtenerProyectoVoluntariadoPorId(idProyecto);

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

    // Proporcionar valores predeterminados o manejar nulos
    String idDepartamentoStr = request.getParameter("departamento");
    int idDepartamento = (idDepartamentoStr != null && !idDepartamentoStr.isEmpty()) ? Integer.parseInt(idDepartamentoStr) : -1;

    String idProvinciaStr = request.getParameter("provincia");
    int idProvincia = (idProvinciaStr != null && !idProvinciaStr.isEmpty()) ? Integer.parseInt(idProvinciaStr) : -1;

    // Aquí falta definir la lógica para obtener el ID del usuario, pero se hace con el login
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
    objEProyectoDonacion.setId_tipo_Proyecto(idTipoProyecto); // Suponiendo que 1 es el valor por defecto
    objEProyectoDonacion.setId_departamento(idDepartamento);
    objEProyectoDonacion.setId_provincia(idProvincia);
    objEProyectoDonacion.setId_usuario(usuario.getId_usuario());
    objEProyectoDonacion.setId_proyecto(idProyecto); 

    // Guardar el proyecto en la base de datos
    boolean success = objNProyectoDonacion.editarProyecto(objEProyectoDonacion);

    // Redirigir o mostrar un mensaje basado en el resultado de la operación
    if (success) {
        out.print("<script type='text/javascript'>showAlert('Se editó correctamente', 'ListaProyectos.jsp');</script>");
    } else {
        out.print("<script type='text/javascript'>showAlert('No se editó');</script>");
    }
%>
