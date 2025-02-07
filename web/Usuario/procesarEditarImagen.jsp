
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException" %>
<%@page import="Entidad.clsEUsuario" %>
<%@page import="Negocio.clsNUsuario" %>
<%@page import="java.io.InputStream" %>
<%@page import="javax.servlet.http.Part" %>
<%@page import="java.util.Base64" %>

<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    try {
        Part filePart = request.getPart("avatar");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                byte[] avatar = new byte[(int) filePart.getSize()];
                inputStream.read(avatar);

                clsNUsuario negocioUsuario = new clsNUsuario();
                negocioUsuario.actualizarAvatar(usuario.getId_usuario(), avatar);

                // Actualizar la imagen en el objeto usuario en la sesión
                usuario.setAvatar(avatar);
                session.setAttribute("usuario", usuario);
                session.setAttribute("successMessage", "Imagen actualizada correctamente.");
                response.sendRedirect("editarPerfil.jsp"); // Redirigir a la página del perfil del usuario
            } catch (SQLException e) {
                request.setAttribute("errorMessage", "Error al actualizar la imagen: " + e.getMessage());
                request.getRequestDispatcher("editarPerfil.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "No se ha seleccionado ninguna imagen");
            request.getRequestDispatcher("editarPerfil.jsp").forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error al procesar la imagen: " + e.getMessage());
        request.getRequestDispatcher("editarPerfil.jsp").forward(request, response);
    }
%>