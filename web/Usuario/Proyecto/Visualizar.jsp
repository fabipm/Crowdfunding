<%@page import="Entidad.clsEIncentivoVoluntario"%>
<%@page import="Entidad.clsEBienesProyecto"%>
<%@page import="Negocio.clsNBienesProyecto"%>
<%@page import="Entidad.clsEUsuario"%>
<%@page import="Negocio.clsNUsuario"%>
<%@page import="Entidad.clsEIncentivoDonacion"%>
<%@page import="java.util.List"%>
<%@page import="Entidad.clsEComentario"%>
<%@page import="Entidad.clsEProyecto"%>
<%@page import="Negocio.clsNVisualizar"%>
<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
    
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visualización de Proyecto</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
        .aspect-video {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%;
        }
        .aspect-video > iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: white;
        }
        .play-button {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .play-button:hover {
            background-color: rgba(255, 255, 255, 0.9);
        }
        .play-button svg {
            width: 50px;
            height: 50px;
            fill: #000;
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

            <a href="../index_usuario.jsp">Explorar Proyectos</a>
            <a href="ListaProyectos.jsp">Mis Proyectos</a>
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
        
        
        <div class="container py-5">
    <% 
    int proyectoId = Integer.parseInt(request.getParameter("id"));
    clsNVisualizar negocioProyecto = new clsNVisualizar();
    clsEProyecto proyecto = negocioProyecto.buscarPorId(proyectoId);
    if (proyecto != null) { 
    %>
    <h1 class="text-center mb-5"><%= proyecto.getTitulo() %></h1>
    <div class="row">
        <div class="col-md-8">
            <div class="aspect-video rounded overflow-hidden">
                <iframe id="videoFrame" width="100%" height="100%" src="<%= proyecto.getVideo() %>" frameborder="0" allowfullscreen></iframe>
                <div class="overlay" id="videoOverlay">
                    <div class="play-button" id="playButton">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>
                    </div>
                </div>
            </div>
            <div class="mt-3">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#proyecto" data-toggle="tab">PROYECTO</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#donantes" data-toggle="tab">DONANTES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#comentarios" data-toggle="tab">COMENTARIOS</a>
                    </li>
                </ul>
                <div class="tab-content mt-3">
                    <div class="tab-pane fade show active" id="proyecto">
                        <h4><%= proyecto.getTitulo() %></h4>
                        <p><%= proyecto.getDescripcion_corta() %></p>
                        <p><%= proyecto.getDescripcion_larga() %></p>
                    </div>
                    <div class="tab-pane fade" id="donantes">
                        <h4 class="mt-3">Donantes</h4>
                        <% 
                            clsNBienesProyecto negocioDonantes = new clsNBienesProyecto();
                            List<clsEBienesProyecto> listaDonantes = negocioDonantes.ListarDonacionesID(proyectoId);
                            if (listaDonantes != null && !listaDonantes.isEmpty()) {
                            int numero_donantes = 0;
                                for (clsEBienesProyecto donantes : listaDonantes) {
                                numero_donantes = numero_donantes + donantes.getCantidad();
                            }
                            double DineroRecaudado = (double) numero_donantes;
                            %>
                        <div class="alert alert-info">
                            <strong>Dinero Recaudado de la campaña:</strong> <%= String.format("%.2f", DineroRecaudado) %> 
                        </div>
                        <%
                                for (clsEBienesProyecto donantes : listaDonantes) {
                        %>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Autor: <%= donantes.getNombreUsuario() %></h5>
                                <p class="card-text">Cantidad <%= donantes.getCantidad() %></p>
                                <p class="card-text">Fecha <%= donantes.getFecha() %></p>
 
                            </div>
                        </div>
                        <% 
                                }

                            } else { 
                        %>
                        <p>No hay Donaciones disponibles...Puedes ser el primero, DONA¡¡¡¡</p>
                        <% 
                            } 
                        %>
                        
                    </div>
                    <div class="tab-pane fade" id="comentarios">
                        <h4 class="mt-3">Comentarios</h4>
                        <% 
                            clsNVisualizar negocioComentario = new clsNVisualizar();
                            List<clsEComentario> listaComentarios = negocioComentario.buscarPorIdcomentario(proyectoId);
                            if (listaComentarios != null && !listaComentarios.isEmpty()) {
                                // Calculate the average rating
                                int sumCalificaciones = 0;
                                for (clsEComentario comentario : listaComentarios) {
                                    sumCalificaciones += comentario.getCalificacion();
                                }
                                double promedioCalificacion = (double) sumCalificaciones / listaComentarios.size();
                        %>
                        <div class="alert alert-info">
                            <strong>Promedio de la campaña:</strong> <%= String.format("%.2f", promedioCalificacion) %> / 5
                        </div>
                        <% 
                                for (clsEComentario comentario : listaComentarios) { 
                        %>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="card-title">Autor: <%= comentario.getNombreUsuario() %></h5>
                                <p class="card-text">Comentario: <%= comentario.getComentario() %></p>
                                <p class="card-text">Calificación: <%= comentario.getCalificacion() %></p>
                                <p class="card-text">Recomendación: <%= comentario.getRecomendacion() %></p>
                                <!-- Add more details here if necessary -->
                            </div>
                        </div>
                        <% 
                                }
                            } else { 
                        %>
                        <p>No hay comentarios disponibles.</p>
                        <% 
                            } 
                        %>
                        
                        <form id="commentForm" action="AddComentario.jsp" method="post">
                        <%-- Se recomienda usar el tag JSTL <c:if> para comprobar si la sesión de usuario está activa --%>
                        <c:if test="${not empty sessionScope.correo}">
                            <%-- Se obtiene el correo del usuario de la sesión --%>
                            <%
                               
                                                                // SE LE DIO UN ID MANUAL YA NO QUE NO HAY LOGIN
                                clsEUsuario usuarios = (clsEUsuario) session.getAttribute("usuario");

                                if (usuarios == null) {
                                    response.sendRedirect("../login.jsp");
                                    return;
                                }
                                
                            %>
                            <%-- Se incluye el ID del usuario en un campo oculto --%>
                            <input type="hidden" id="id_usuario" name="id_usuario" value="<%= usuarios.getId_usuario() %>">
                                    
                            <input type="hidden" id="id_proyecto" name="id_proyecto" value="<%= proyectoId %>">
                        </c:if>

                        <div class="form-group">
                            <label for="comentario">Comentario:</label>
                            <textarea class="form-control" id="comentario" name="comentario" rows="3" required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="recomendacion">Recomiendo el proyecto?:</label>
                            <select class="form-control" id="recomendacion" name="recomendacion" required>
                                <option value="SI">Sí</option>
                                <option value="NO">No</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="calificacion">Calificación:</label>
                            <select class="form-control" id="calificacion" name="calificacion" required>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar Comentario</button>
                    </form>
                        
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="bg-white rounded p-4 shadow">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="text-info font-weight-bold">CONTRIBUCIONES:</div>
                </div>
                
                <div class="mt-4">
                    <div class="text-muted">Ubicación: <%= proyecto.getNombre_departamento() %></div>
                    <div class="text-muted">Autor: <%= proyecto.getNombre_usuario() %></div>
                    <div class="text-muted">Cantidad de Donantes :<%=listaDonantes.size()%></div>
                    <div class="text-muted">Tipo de proyecto: <%= proyecto.getTipo_duracion() %>
                </div>
                <div class="mt-4">
                    <button class="btn btn-warning text-white mr-2" onclick="redireccionarADonar()">DONAR</button>

                    
                </div>

                <script>
                    function redireccionarADonar() {
                        window.location.href = "../Proyecto/Donacion.jsp?id_usuario=<%= usuario.getId_usuario() %>&id_proyecto=<%= proyectoId %>"; // Redirige a donar.jsp con el parámetro id
                    }
                </script>
                
                <div class="mt-4">
                    <h5>SELECCIONA UN INCENTIVO</h5>
                    <div class="border p-3 rounded">
                        <div class="mt-3">
                            <% 
                                clsNVisualizar tipo = new clsNVisualizar();
                                clsEProyecto proyectotipo = tipo.buscarPorId(proyectoId);
                                
                                int tipoproyecto = proyectotipo.getId_tipo_Proyecto();
                                
                                if (tipoproyecto == 1) {
                                    clsNVisualizar negociobjetos = new clsNVisualizar();
                                    List<clsEIncentivoDonacion> listaobjetos = negociobjetos.buscarPorIdUsuarioObjetos(proyectoId); // Corrected method name
                                    for (clsEIncentivoDonacion objetos : listaobjetos) {
                            %>
                                    <ul class="list-unstyled">
                                        <p class="card-title"><%= objetos.getTitulo() %></p>        
                                        <p class="text-muted"><%= objetos.getDescripcion_donacion() %></p> 
                                    </ul>
                            <% 
                                    }
                                } else if (tipoproyecto == 2){
                                    clsNVisualizar negociovoluntario = new clsNVisualizar();
                                    List<clsEIncentivoVoluntario> listvol = negociovoluntario.buscarPorIdUsuarioVoluntario(proyectoId);
                                    for (clsEIncentivoVoluntario vol : listvol) {
                            %>
                                    <ul class="list-unstyled">
                                        <p class="card-title"><%= vol.getTitulo() %></p>        
                                        <p class="text-muted"><%= vol.getDescripcion_voluntariado() %></p> 
                                    </ul>
                            <% 
                                    }
                                }
                            %>
                        </div>                  
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } else { %>
        <p class="message">No se encontró ningún proyecto con el ID <%= proyectoId %> en la base de datos.</p>
    <% } %>
</div>
    <script>
        document.getElementById('playButton').addEventListener('click', function() {
            var iframe = document.getElementById('videoFrame');
            var overlay = document.getElementById('videoOverlay');
            var videoSrc = iframe.src;

            // Modificar el src para reproducir automáticamente
            iframe.src = videoSrc + "?autoplay=1";

            // Ocultar el overlay
            overlay.style.display = 'none';
            });
    </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
