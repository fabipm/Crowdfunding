<%@page import="Negocio.clsNComentario"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page import="Entidad.clsEComentario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Negocio.clsNVisualizar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        header, footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 1em 0;
            }
            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1em;
            }
            header nav {
                display: flex;
                gap: 1em;
                position: relative;
                flex-grow: 1;
                justify-content: flex-end;
            }
            header nav a, .dropdown > span {
                color: white;
                text-decoration: none;
                padding: 0.5em 1em;
                border-radius: 5px;
                display: flex;
                align-items: center;
            }
            header nav a:hover, .dropdown > span:hover {
                background-color: #555;
            }
            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #333;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                right: 0;
            }
            .dropdown-content a {
                color: white;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }
            .dropdown-content a:hover {
                background-color: #555;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }

    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
        <nav>

            <a href="index_usuario.jsp">Explorar Proyectos</a>
            <a href="Proyecto/ListaProyectos.jsp">Mis Proyectos</a>
            <a href="">Mis Comentarios</a>
            <a href="MisDonaciones.jsp">Mis Donaciones</a>       
            <div class="dropdown">
                <a href="">Usuario</a>
                <div class="dropdown-content">
                    <a href="Perfil.jsp">Perfil</a>
                    <a href="editarPerfil.jsp">Editar Perfil</a>
                    <a href="../index.jsp">Cerrar sesión</a>
                </div>
            </div>
        </nav>
    </header>
    
    <div class="container">
        <div class="title">Mis Comentarios</div>
        <%
            clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
        %>

        <% 
            clsNComentario negocioComentario = new clsNComentario();
            List<clsEComentario> listaComentarios = negocioComentario.buscarPorIdUsuario(usuario.getId_usuario());
            if (listaComentarios != null && !listaComentarios.isEmpty()) {
                for (clsEComentario comentario : listaComentarios) { 
        %>
        
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Proyecto: <%= comentario.getNombreProyecto() %></h5>
                <p class="card-text">Comentario: <%= comentario.getComentario() %></p>
                <p class="card-text">Calificación: <%= comentario.getCalificacion() %></p>
                <p class="card-text">Recomendación: <%= comentario.getRecomendacion() %></p>
            </div>
        </div>
        <% 
                }
            } else { 
        %>
        <p class="no-comments">No hay comentarios disponibles.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>

