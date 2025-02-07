
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Invalida la sesión actual
    session.invalidate();
    // Redirige al usuario a la página de inicio de sesión
    response.sendRedirect("../login.jsp");
%>
