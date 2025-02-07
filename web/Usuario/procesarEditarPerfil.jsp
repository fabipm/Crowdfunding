

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException" %>
<%@page import="Entidad.clsEUsuario" %>
<%@page import="Negocio.clsNUsuario" %>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // Obtener los datos del formulario
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String correo = request.getParameter("correo");
    String direccion = request.getParameter("direccion");
    String informacion_personal = request.getParameter("informacion_personal");
    String interes = request.getParameter("interes");
    String habilidad = request.getParameter("habilidad");

    // Actualizar el objeto usuario con los nuevos valores
    if (nombre != null) usuario.setNombre(nombre);
    if (apellido != null) usuario.setApellido(apellido);
    if (correo != null) usuario.setCorreo(correo);
    if (direccion != null) usuario.setDireccion(direccion);
    if (informacion_personal != null) usuario.setInformacion_personal(informacion_personal);
    if (interes != null) usuario.setInteres(interes);
    if (habilidad != null) usuario.setHabilidad(habilidad);

    clsNUsuario negocioUsuario = new clsNUsuario();
    try {
        negocioUsuario.actualizarUsuario(usuario);
        session.setAttribute("usuario", usuario);
        session.setAttribute("successMessage", "Perfil actualizado correctamente.");
        response.sendRedirect("editarPerfil.jsp"); // Redirigir a la página del perfil del usuario
    } catch (Exception e) {
        request.setAttribute("errorMessage", "Error al actualizar el perfil: " + e.getMessage());
        request.getRequestDispatcher("editarPerfil.jsp").forward(request, response);
    }
%>