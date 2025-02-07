

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, Entidad.clsEUsuario, Negocio.clsNUsuario, Config.Conexion" %>

<%
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");

    if (correo != null && clave != null) {
        clsNUsuario negocioUsuario = new clsNUsuario();
        clsEUsuario usuario = null;
        try {
            usuario = negocioUsuario.login(correo, clave);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error de conexión: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (usuario != null) {
            request.getSession().setAttribute("usuario", usuario);

            int idRol = usuario.getId_rol();
            if (idRol == 1) {
                // Usuario admin
                request.getRequestDispatcher("Admin/index_admin.jsp").forward(request, response);
            } else if (idRol == 2) {
                // Usuario colaborador
                 response.sendRedirect("Usuario/Perfil.jsp");
            } else {
                request.setAttribute("errorMessage", "Rol desconocido");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Correo o clave incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
%>