<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
    // Mensaje de alerta
    function showAlert(message, redirectUrl = null) {
        alert(message);
        if (redirectUrl) {
            window.location.href = redirectUrl;
        }
    }
</script>
<%
    // Obtener el parámetro del formulario
    String linkFacebook = request.getParameter("facebook");
    String linkTwitter = request.getParameter("twitter");
    String linkYoutube = request.getParameter("youtube");
    String linkPaginaWeb = request.getParameter("paginaweb");

  
    // Crear una instancia del negocio y obtener el ID del proyecto
    clsNProyecto objNP = new clsNProyecto();
    int idproyecto = objNP.obtenerUltProy();

    // Crear una instancia de la entidad para el enlace de Facebook
    clsELinks objEL = new clsELinks();
    objEL.setFacebook(linkFacebook);
    objEL.setTwitter(linkTwitter);
    objEL.setYoutube(linkYoutube);
    objEL.setPaginaweb(linkPaginaWeb);
    objEL.setId_proyecto(idproyecto);

    // Guardar el enlace en la base de datos
    clsNLinks objNL = new clsNLinks();


    boolean success = objNL.guardarLink(objEL);

    if (success) {
        out.print("<script type='text/javascript'>showAlert('Se registró Proyecto Correctamente.', '../../ListaProyectos.jsp');</script>");
    } else {
        out.print("<script type='text/javascript'>showAlert('Hubo un problema al guardar uno de los links.');</script>");
    }

%>
