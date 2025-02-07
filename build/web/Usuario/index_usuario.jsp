<%@page import="Entidad.clsEUsuario"%>
<%@page import="Entidad.clsEProyecto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Negocio.clsNProyecto_Destacado"%>
<%
    clsEUsuario usuario = (clsEUsuario) session.getAttribute("usuario");
    %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyecto Web</title>
      <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
            align-items: center; /* Asegura que los elementos se alineen verticalmente al centro */
            padding: 1em;
        }
        header nav {
            display: flex;
            gap: 1em;
            position: relative;
            flex-grow: 1; /* Hace que el nav ocupe el espacio disponible */
            justify-content: flex-end; /* Alinea los elementos del nav a la derecha */
        }
        header nav a, .dropdown > a {
            color: white;
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 5px;
            display: flex;
            align-items: center; /* Asegura que los enlaces estén centrados verticalmente */
        }
        header nav a:hover, .dropdown > a:hover {
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
            right: 0; /* Asegura que el menú se alinee al borde derecho del dropdown */
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
        }
        footer {
            background-color: #222;
            color: #ccc;
        }
        
        
        .custom-button {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.375rem;
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
            font-weight: 500;
            border: 1px solid #d1d5db;
            background-color: #f9fafb;
            transition: background-color 0.3s, color 0.3s;
          }
          .custom-button:hover {
            background-color: #005bac;
            color: #ffffff;
          }
          .custom-button svg {
            margin-right: 0.5rem;
          }
    </style>
</head>
<body  class="bg-gray-100" >
    <header>
        <div class="logo">
            <h1>Yo Te Apoyo</h1>
        </div>
        <nav>

            <a href="">Explorar Proyectos</a>
            <a href="Proyecto/ListaProyectos.jsp">Mis Proyectos</a>
            <a href="MisComentarios.jsp">Mis Comentarios</a>
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
   
    
    <main id="content">
        <h2 class="text-3xl font-bold uppercase text-blue-700 mb-6">Proyectos mas relevantes</h2>
            <h2 class="text-3xl font-bold uppercase text-blue-700 mb-6">Proyectos de Donacion</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              <%
              clsNProyecto_Destacado negociobjetos = new clsNProyecto_Destacado();
              List<clsEProyecto> listaobjetos = negociobjetos.listar1(); // Corrected method name
              for (clsEProyecto objetos : listaobjetos) {  
              %>
              <div class="rounded-lg border text-card-foreground shadow-md bg-white">
              <iframe src="<%= objetos.getVideo() %>" frameborder="0" allowfullscreen class="w-full rounded-t-lg" style="height: 200px; object-fit: cover; pointer-events: none;"></iframe>

              <div class="p-4">
                  <h3 class="text-xl font-semibold"><%= objetos.getTitulo() %></h3>
                  <p class="text-sm mt-2"><%= objetos.getDescripcion_corta() %></p>
                  <p class="text-sm text-gray-600 mt-2">Duración: <%= objetos.getTipo_duracion() %></p>
                  <p class="text-sm text-gray-600 mt-2">Autor: <%= objetos.getNombre_usuario() %></p>
                  <div class="flex items-center justify-between mt-4">
                      <a href="../Usuario/Proyecto/Visualizar.jsp?id=<%= objetos.getId_proyecto() %>&id_usuario=<%= usuario.getId_usuario()%>" class="custom-button">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-red-600">
                              <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path>
                          </svg>
                          <span>Ver Proyecto</span>
                      </a>
                  </div>
              </div>
          </div>
              <% } %>
            </div>
            
            <!-- aqui la segunda parte  -->
      
    <h2 class="text-3xl font-bold uppercase text-blue-700 mb-6">Proyectos de Voluntariado</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <%
      clsNProyecto_Destacado negociobjetos2 = new clsNProyecto_Destacado();
      List<clsEProyecto> listaobjetos2 = negociobjetos2.listar2(); // Corrected method name
      for (clsEProyecto objetos : listaobjetos2) {  
      %>
      <div class="rounded-lg border text-card-foreground shadow-md bg-white">
            <iframe src="<%= objetos.getVideo() %>" frameborder="0" allowfullscreen class="w-full rounded-t-lg" style="height: 200px; object-fit: cover; pointer-events: none;"></iframe>
        <div class="p-4">
          <h3 class="text-xl font-semibold"><%= objetos.getTitulo() %></h3>
          <p class="text-sm mt-2"><%= objetos.getDescripcion_corta() %></p>
          <p class="text-sm text-gray-600 mt-2">Duración: <%= objetos.getTipo_duracion() %></p>
          <p class="text-sm text-gray-600 mt-2">Autor: <%= objetos.getNombre_usuario() %></p>
          <div class="flex items-center justify-between mt-4">
           <a href="../Usuario/Proyecto/Visualizar.jsp?id=<%= objetos.getId_proyecto() %>&id_usuario=<%= usuario.getId_usuario()%>" class="custom-button">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-red-600">
                <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path>
              </svg>
              <span>Ver Proyecto</span>
            </a>
          </div>
        </div>
      </div>
      <% } %>
    </div>
            
    </main>
    
    
    <footer>
        <p>&copy; 2024 Mi Proyecto. Todos los derechos reservados. Información de contacto: email@ejemplo.com</p>
    </footer>
</body>
</html>