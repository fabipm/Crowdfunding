

<%@page import="java.util.List"%>
<%@page import="Entidad.*"%>
<%@page import="Negocio.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Proyectos</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                height: 100vh;
                background-color: #f4f4f4;
                justify-content: space-between;
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
            main {
                flex: 1;
                padding: 2em;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                width: 100%;
                margin-bottom: 20px;
                text-align: center;
            }
            .container h2 {
                margin-bottom: 20px;
            }
            .container .boton {
                display: inline-block;
                margin: 10px 0;
                padding: 10px 20px;
                background-color: #333;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .container .boton:hover {
                background-color: #555;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table th, table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            table th {
                background-color: #f2f2f2;
                color: #333;
            }
            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            table tr:hover {
                background-color: #f1f1f1;
            }
            table a {
                color: #333;
                text-decoration: none;
                padding: 5px 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
                margin-right: 5px; /* Ajusta el margen entre enlaces según tu preferencia */
                display: inline-block; /* Asegura que el margen se aplique correctamente */
            }
            table a:hover {
                background-color: #4CAF50; /* Color verde para resaltar */
            }
            footer {
                background-color: #222;
                color: #ccc;
                text-align: center;
                padding: 1em 0;
            }
            
            .enlace-editar,
            .enlace-visualizar,
            .enlace-seguimiento {
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                transition: background-color 0.3s;
                margin-right: 5px; /* Ajusta el margen entre enlaces según tu preferencia */
            }

            .enlace-editar:hover,
            .enlace-visualizar:hover,
            .enlace-seguimiento:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <header>

        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
        <nav>

            <a href="../index_usuario.jsp">Explorar Proyectos</a>
            <a href="">Mis Proyectos</a>
            <a href="../MisComentarios.jsp">Mis Comentarios</a>
            <a href="../MisDonaciones.jsp">Mis Donaciones</a>       
            <div class="dropdown">
                <a href="">Usuario</a>
                <div class="dropdown-content">
                    <a href="../Perfil.jsp">Perfil</a>
                    <a href="../editarPerfil.jsp">Editar Perfil</a>
                    <a href="/YoTeApoyo/index.jsp">Cerrar sesión</a>
                </div>
            </div>
        </nav>
        </header>

        <main>
            <div class="container" style="text-align: center;">
                <a href="ProyectoDonacion/CrearProyectoDonacion.jsp" class="boton">Nueva Proyecto Donación</a>
                <a href="ProyectoVoluntario/CrearProyectoVoluntario.jsp" class="boton">Nueva Proyecto Voluntario</a>
            </div>
            <div class="container">
                <h2>Listado de Proyectos</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID Proyecto</th>
                            <th>Nombre Proyecto</th>
                            <th>Duración de proyecto</th>               
                            <th>Tipo de proyecto</th>
                            <th>Descripción de Proyecto</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 

                            clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");

                            if (usuario == null) {
                                response.sendRedirect("../login.jsp");
                                return;
                            }

                            //int id_Usuario = Integer.parseInt(request.getParameter("idUsuario"));
                            clsNProyecto objNP = new clsNProyecto();
                            List<clsEProyecto> listaProyecto = objNP.listarProyectos(usuario.getId_usuario());
                            for (clsEProyecto proyectos : listaProyecto) { 
                        %>
                        <tr>
                            <td><%= proyectos.getId_proyecto()%></td>
                            <td><%= proyectos.getTitulo()%></td>
                            <td><%= proyectos.getTipo_duracion()%></td>
                            <td><%= proyectos.getNombre_tipo_Proyecto()%></td>
                            <td><%= proyectos.getDescripcion_corta()%></td>
                            <td>
                                <a href="EditarProyectoDonacion.jsp?id=<%= proyectos.getId_proyecto() %>&idtipoproyecto=<%= proyectos.getId_tipo_Proyecto() %>">Editar</a>
                                <a href="Visualizar.jsp?id=<%= proyectos.getId_proyecto() %>">Ver Proyecto</a>
                                <a href="Seguimienti.jsp?id=<%= proyectos.getId_proyecto() %>">Seguimiento</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main>

        <footer>
            <!-- Añade tu contenido del footer aquí -->
        </footer>
    </body>
</html>
