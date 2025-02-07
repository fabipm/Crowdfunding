
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidad.clsEUsuario, Negocio.clsNUsuario, java.sql.*" %>
<%
    String apellido = request.getParameter("apellido");
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    String verificacionClave = request.getParameter("verificacionClave");

    // Crear una instancia de clsNUsuario
    clsNUsuario negocioUsuario = new clsNUsuario();

    // Verificar si el correo ya está registrado
    if (negocioUsuario.existeCorreo(correo)) {
        // Si el correo ya existe, mostrar un mensaje de error y redireccionar al formulario de registro
        request.setAttribute("errorMessage", "El correo electrónico ya está registrado. Por favor, use otro.");
        request.getRequestDispatcher("register.jsp").forward(request, response);
    } else {
        // Si el correo no está registrado, verificar si las contraseñas coinciden
        if (clave.equals(verificacionClave)) {
            clsEUsuario nuevoUsuario = new clsEUsuario();
            nuevoUsuario.setApellido(apellido);
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setCorreo(correo);
            nuevoUsuario.setClave(clave);
            
            // Intentar registrar al usuario
            boolean usuarioRegistrado = negocioUsuario.registrarUsuario(nuevoUsuario);

            // Verificar si el usuario se registró correctamente
            if (usuarioRegistrado) {
                // Si el registro fue exitoso, redireccionar a la página de inicio de sesión
                request.setAttribute("successMessage", "Registro exitoso. Ahora puede iniciar sesión.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // Si hubo un error en el registro, mostrar un mensaje de error y redireccionar al formulario de registro
                request.setAttribute("errorMessage", "Error en el registro. Por favor, inténtelo de nuevo.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            // Si las contraseñas no coinciden, mostrar un mensaje de error y redireccionar al formulario de registro
            request.setAttribute("errorMessage", "Las contraseñas no coinciden. Por favor, inténtelo de nuevo.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
%>