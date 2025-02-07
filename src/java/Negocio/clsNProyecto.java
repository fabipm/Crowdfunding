/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Config.Conexion;
import Entidad.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class clsNProyecto {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
    public List<clsEProyecto> listarProyectos(int idUsuario) {
        ArrayList<clsEProyecto> listaProyectos = new ArrayList<>();
        String sql = "SELECT p.id_proyecto, p.titulo, p.tipo_duracion, t.nombre_tipo_proyecto, p.descripcion_corta, p.id_tipo_proyecto " +
                     "FROM tbproyecto p " +
                     "INNER JOIN tbtipoproyecto t ON p.id_tipo_proyecto = t.id_tipo_proyecto " +
                     "WHERE p.id_usuario = ?"; // Agregamos la cláusula WHERE

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario); // Seteamos el valor del parámetro idUsuario
            rs = ps.executeQuery();
            while (rs.next()) {
                clsEProyecto proyecto = new clsEProyecto();
                proyecto.setId_proyecto(rs.getInt("id_proyecto")); // Obtener el ID del proyecto
                proyecto.setTitulo(rs.getString("titulo"));
                proyecto.setTipo_duracion(rs.getString("tipo_duracion"));
                proyecto.setNombre_tipo_Proyecto(rs.getString("nombre_tipo_proyecto"));
                proyecto.setDescripcion_corta(rs.getString("descripcion_corta"));
                proyecto.setId_tipo_Proyecto(rs.getInt("id_tipo_proyecto")); // Obtener el ID del tipo de proyecto
                listaProyectos.add(proyecto);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener los proyectos: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
        return listaProyectos;
    }
    public List<clsEProyecto> obtenerProyectos() {
        List<clsEProyecto> proyectos = new ArrayList<>();
        String sql = "SELECT p.*, u.nombre AS nombreCreador, u.apellido AS apellidoCreador " +
                     "FROM tbproyecto p " +
                     "JOIN tbusuario u ON p.id_usuario = u.id_usuario " +
                     "WHERE p.id_estado = 2"; // Solo proyectos por publicar

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clsEProyecto proyecto = new clsEProyecto();
                proyecto.setId_proyecto(rs.getInt("id_proyecto"));
                proyecto.setTitulo(rs.getString("titulo"));
                proyecto.setDescripcion_corta(rs.getString("descripcion_corta"));
                proyecto.setFecha_limite(rs.getString("fecha_limite"));
                proyecto.setTipo_duracion(rs.getString("tipo_duracion"));
                proyecto.setDescripcion_larga(rs.getString("descripcion_larga"));
                proyecto.setNombreCreador(rs.getString("nombreCreador") + " " + rs.getString("apellidoCreador"));
                proyectos.add(proyecto);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return proyectos;
    }
    public boolean agregarProyecto(clsEProyecto proyecto) {
        String SQL = "INSERT INTO tbproyecto (titulo, descripcion_corta, fecha_limite, video, tipo_duracion, descripcion_larga, lista_donacion,id_tipo_proyecto, id_departamento, id_provincia, id_usuario) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
        try (Connection con = cn.getConnection();
             PreparedStatement pst = con.prepareStatement(SQL)) {
            pst.setString(1, proyecto.getTitulo());
            pst.setString(2, proyecto.getDescripcion_corta());
            pst.setString(3, proyecto.getFecha_limite());// Manejo de fecha
            pst.setString(4, proyecto.getVideo());
            pst.setString(5, proyecto.getTipo_duracion());
            pst.setString(6, proyecto.getDescripcion_larga());
            pst.setString(7, proyecto.getLista_donacion());
            pst.setInt(8, proyecto.getId_tipo_Proyecto());
            pst.setInt(9, proyecto.getId_departamento());
            pst.setInt(10, proyecto.getId_provincia());
            pst.setInt(11, proyecto.getId_usuario());

            pst.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
            return false;
        }
    }

    public int obtenerUltProy() {
        String sql = "SELECT MAX(id_proyecto) as last_id FROM tbproyecto;";
        try {
            con = cn.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getInt("last_id");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el último ID de proyecto: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
        return -1; // En caso de error o si no se encontró ningún ID
    }



    public boolean editarProyecto(clsEProyecto proyecto) {
        String SQL = "UPDATE tbproyecto SET titulo = ?, descripcion_corta = ?, fecha_limite = ?, video = ?, tipo_duracion = ?, descripcion_larga = ?, lista_donacion = ?, id_tipo_proyecto = ?, id_departamento = ?, id_provincia = ? WHERE id_proyecto = ?";
        try (Connection con = cn.getConnection();
             PreparedStatement pst = con.prepareStatement(SQL)) {

            pst.setString(1, proyecto.getTitulo());
            pst.setString(2, proyecto.getDescripcion_corta());
            pst.setString(3,proyecto.getFecha_limite()); // Suponiendo que getFecha_limite() retorna un String en formato 'yyyy-MM-dd'
            pst.setString(4, proyecto.getVideo());
            pst.setString(5, proyecto.getTipo_duracion());
            pst.setString(6, proyecto.getDescripcion_larga());
            pst.setString(7, proyecto.getLista_donacion());
            pst.setInt(8, proyecto.getId_tipo_Proyecto());
            pst.setInt(9, proyecto.getId_departamento());
            pst.setInt(10, proyecto.getId_provincia());
            pst.setInt(11, proyecto.getId_proyecto());

            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {

            return false;
        }
    }

    public clsEProyecto obtenerProyectoPorId(int idProyecto) {
        clsEProyecto proyecto = null;
        String sql = "SELECT p.id_proyecto, p.titulo, p.tipo_duracion, t.nombre_tipo_proyecto, p.descripcion_corta, "
                   + "p.fecha_limite, p.video, p.descripcion_larga, p.lista_donacion, p.id_departamento, p.id_provincia, p.id_usuario "
                   + "FROM tbproyecto p "
                   + "INNER JOIN tbtipoproyecto t ON p.id_tipo_proyecto = t.id_tipo_proyecto "
                   + "WHERE p.id_proyecto = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProyecto);
            rs = ps.executeQuery();

            if (rs.next()) {
                proyecto = new clsEProyecto();
                proyecto.setId_proyecto(rs.getInt("id_proyecto"));
                proyecto.setTitulo(rs.getString("titulo"));
                proyecto.setTipo_duracion(rs.getString("tipo_duracion"));
                proyecto.setNombre_tipo_Proyecto(rs.getString("nombre_tipo_proyecto"));
                proyecto.setDescripcion_corta(rs.getString("descripcion_corta"));
                proyecto.setFecha_limite(rs.getString("fecha_limite"));
                proyecto.setVideo(rs.getString("video"));
                proyecto.setDescripcion_larga(rs.getString("descripcion_larga"));
                proyecto.setLista_donacion(rs.getString("lista_donacion"));
                proyecto.setId_departamento(rs.getInt("id_departamento"));
                proyecto.setId_provincia(rs.getInt("id_provincia"));
                proyecto.setId_usuario(rs.getInt("id_usuario"));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el proyecto: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
        return proyecto;
    }    
    public void actualizarEstadoProyecto(int idProyecto, String estado) {
        String sql = "UPDATE tbproyecto SET id_estado = (SELECT id_estado FROM tbestadoproyecto WHERE nombre = ?) WHERE id_proyecto = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            ps.setInt(2, idProyecto);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public clsEProyecto obtenerProyectoPorId2(int idProyecto) {
    clsEProyecto proyecto = null;
    String sql = "SELECT p.*, u.nombre AS nombreCreador FROM tbproyecto p JOIN tbusuario u ON p.id_usuario = u.id_usuario WHERE p.id_proyecto = ?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idProyecto);
        rs = ps.executeQuery();
        if (rs.next()) {
            proyecto = new clsEProyecto();
            proyecto.setId_proyecto(rs.getInt("id_proyecto"));
            proyecto.setTitulo(rs.getString("titulo"));
            proyecto.setDescripcion_corta(rs.getString("descripcion_corta"));
            proyecto.setFecha_limite(rs.getString("fecha_limite"));
            proyecto.setTipo_duracion(rs.getString("tipo_duracion"));
            proyecto.setDescripcion_larga(rs.getString("descripcion_larga"));
            proyecto.setNombreCreador(rs.getString("nombreCreador"));
            proyecto.setLista_donacion(rs.getString("lista_donacion"));
            proyecto.setVideo(rs.getString("video"));
            // Agrega más campos según sea necesario
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return proyecto;
}
public clsEProyecto obtenerProyectoPorId3(int idProyecto) {
        clsEProyecto proyecto = null;
        String sql = "SELECT p.*, u.nombre AS nombreCreador FROM tbproyecto p JOIN tbusuario u ON p.id_usuario = u.id_usuario WHERE p.id_proyecto = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProyecto);
            rs = ps.executeQuery();
            if (rs.next()) {
                proyecto = new clsEProyecto();
                proyecto.setId_proyecto(rs.getInt("id_proyecto"));
                proyecto.setTitulo(rs.getString("titulo"));
                proyecto.setDescripcion_corta(rs.getString("descripcion_corta"));
                proyecto.setFecha_limite(rs.getString("fecha_limite"));
                proyecto.setTipo_duracion(rs.getString("tipo_duracion"));
                proyecto.setDescripcion_larga(rs.getString("descripcion_larga"));
                proyecto.setNombreCreador(rs.getString("nombreCreador"));
                proyecto.setEstado(rs.getString("id_estado"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return proyecto;
    }
    
}
