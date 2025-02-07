<%-- 
    Document   : Seguimienti
    Created on : 10 jun 2024, 22:34:13
    Author     : Fabiola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidad.clsEBienesProyecto"%>
<%@page import="Negocio.clsNBienesProyecto"%>
<%@page import="Negocio.clsNComentario"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page import="Entidad.clsEComentario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Negocio.clsNVisualizar"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .card {
            background-color: #fff;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #007bff;
        }
        .card-text {
            margin-bottom: 10px;
        }
        .no-comments {
            font-size: 16px;
            color: #6c757d;
        }
        .title {
            font-size: 36px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">Donaciones al Proyecto</div>
        <%
            String idProyectoParam = request.getParameter("id");
            int idProyecto = 0;

            try {
                if (idProyectoParam != null && !idProyectoParam.isEmpty()) {
                    idProyecto = Integer.parseInt(idProyectoParam);
                } else {
                    throw new NumberFormatException("El parámetro 'id' está vacío o es nulo");
                }
            } catch (NumberFormatException e) {
                out.println("Error: " + e.getMessage() + "<br>");
                return;
            }
    
        %>

        <% 
            clsNBienesProyecto Donaciones = new clsNBienesProyecto();
            List<clsEBienesProyecto> listaDonaciones = Donaciones.ListarDonacionesxProyecto(idProyecto);
            if (listaDonaciones != null && !listaDonaciones.isEmpty()) {
                for (clsEBienesProyecto donaciones : listaDonaciones) { 
        %>
        
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Proyecto: <%= donaciones.getNombreProyecto() %></h5>
                <p class="card-text">Donacion: <%= donaciones.getCantidad() %></p>
                <p class="card-text">Fecha <%= donaciones.getFecha() %></p>
            </div>
        </div>
        <% 
                }
            } else { 
        %>
        <p class="no-comments">No hay donaciones disponibles.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>