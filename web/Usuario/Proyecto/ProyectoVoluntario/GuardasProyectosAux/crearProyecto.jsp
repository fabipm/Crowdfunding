
<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>

    function showAlert(message) {
        alert(message);
    }   


</script>
<%
        // Obtener valores de los campos del formulario
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
        clsNProyecto objNP = new clsNProyecto();
        clsEProyecto objEP = new clsEProyecto();
        
        // Asignar los valores obtenidos a los atributos del objeto de entidad
        objEP.setTitulo(titulo);
        objEP.setDescripcion_corta(descripcionCorta);
        objEP.setFecha_limite(fechaLimite);
        objEP.setVideo(videoYoutube);
        objEP.setTipo_duracion(tipoDuracionProyecto);
        objEP.setDescripcion_larga(descripcionLarga);
        objEP.setId_tipo_Proyecto(2); // Asignamos 2 ya que es ProyectoVoluntario siempre es 1
        objEP.setId_departamento(idDepartamento);
        objEP.setId_provincia(idProvincia);
        objEP.setId_usuario(usuario.getId_usuario());
        
        // LLamaos el metodo de guardar del proyecto
        boolean success = objNP.agregarProyecto(objEP);

        if (success) {
            out.print("<script type='text/javascript'>showAlert('Se Registro correctamente rellene el siguiente formulario para continuar...');</script>");
            response.sendRedirect("../CrearProyectoVoluntario.jsp");
        } else {
            out.print("<script type='text/javascript'>showAlert('No se pudo registrar. Intente denuevo');</script>");
            response.sendRedirect("../CrearProyectoVoluntario.jsp");
        }
%>
