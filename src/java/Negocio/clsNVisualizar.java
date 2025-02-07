/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Config.Conexion;
import Entidad.clsEComentario;
import Entidad.clsEIncentivoDonacion;
import Entidad.clsEIncentivoVoluntario;
import Entidad.clsEProyecto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class clsNVisualizar {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; 
    Statement st; 
    
    
public clsEProyecto buscarPorId(int idProyecto) {
    clsEProyecto objEB = null;
    String sql = "SELECT p.*, u.Nombre AS nombre_usuario, d.nombre AS nombre_departamento " +
                 "FROM tbproyecto p " +
                 "INNER JOIN tbusuario u ON p.id_usuario = u.id_usuario " +
                 "INNER JOIN tbdepartamento d ON p.id_departamento = d.id_departamento " +
                 "WHERE p.id_proyecto = ?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idProyecto); // Set the ID parameter
        rs = ps.executeQuery();
        if (rs.next()) {
            objEB = new clsEProyecto();
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            objEB.setTitulo(rs.getString("titulo"));
            objEB.setDescripcion_corta(rs.getString("descripcion_corta"));
            objEB.setFecha_limite(rs.getString("fecha_limite"));
            objEB.setVideo(rs.getString("video"));
            objEB.setTipo_duracion(rs.getString("tipo_duracion"));
            objEB.setId_tipo_Proyecto(rs.getInt("id_tipo_proyecto"));
            objEB.setDescripcion_larga(rs.getString("descripcion_larga"));            
            objEB.setLista_donacion(rs.getString("lista_donacion"));
            objEB.setId_estado(rs.getInt("id_estado"));
            objEB.setId_departamento(rs.getInt("id_departamento"));
            objEB.setId_provincia(rs.getInt("id_provincia"));
            objEB.setId_usuario(rs.getInt("id_usuario"));
            objEB.setNombre_usuario(rs.getString("nombre_usuario")); // Set the user's name
            objEB.setNombre_departamento(rs.getString("nombre_departamento")); // Set the department's name
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.toString());
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.toString());
        }
    }
    return objEB;
}

public List<clsEComentario> buscarPorIdcomentario(int idProyecto) {
    ArrayList<clsEComentario> listaComentarios = new ArrayList<>();
    String sql = "SELECT cp.*, u.Nombre AS NombreUsuario " +
                 "FROM tbcalificacionproyecto cp " +
                 "INNER JOIN tbusuario u ON cp.id_usuario = u.id_usuario " +
                 "WHERE cp.id_proyecto = ?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idProyecto); // Set the project ID parameter
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEComentario objEB = new clsEComentario();
            objEB.setId_calificacion_proyecto(rs.getInt("id_calificacion_proyecto"));
            
            objEB.setCalificacion(rs.getInt("calificacion"));
            objEB.setComentario(rs.getString("comentario"));
            objEB.setRecomendacion(rs.getString("recomendacion"));
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            objEB.setId_usuario(rs.getInt("id_usuario"));
            objEB.setNombreUsuario(rs.getString("NombreUsuario"));
            listaComentarios.add(objEB);
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.toString());
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.toString());
        }
    }
    return listaComentarios;
}

public List<clsEIncentivoDonacion> buscarPorIdUsuarioObjetos(int idProyecto) {
    ArrayList<clsEIncentivoDonacion> listaIncentivos = new ArrayList<>();
    String sql = "SELECT * FROM tbincentivodonacion WHERE id_proyecto = ?";
    try {   
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idProyecto); // Set the user ID parameter
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEIncentivoDonacion objEB = new clsEIncentivoDonacion();
            objEB.setId_incentivo_donacion(rs.getInt("id_incentivo_donacion"));
            objEB.setTitulo(rs.getString("titulo"));
            objEB.setDescripcion_donacion(rs.getString("descripcion_donacion"));
            objEB.setDescripcion_incentivo(rs.getString("descripcion_incentivo"));
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            listaIncentivos.add(objEB);
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.toString());
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.toString());
        }
    }
    return listaIncentivos;
}

    
public List<clsEIncentivoVoluntario> buscarPorIdUsuarioVoluntario(int idProyecto) {
    ArrayList<clsEIncentivoVoluntario> listaIncentivos = new ArrayList<>();
    String sql = "SELECT * FROM tbincentivovoluntario iv " +
                     "INNER JOIN tbproyectovoluntariado pv ON pv.id_proyecto_voluntariado = iv.id_proyecto_voluntariado " +
                     "INNER JOIN tbproyecto p ON p.id_proyecto = pv.id_proyecto " +
                     "WHERE p.id_proyecto = ?";
    try {   
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idProyecto); // Set the user ID parameter
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEIncentivoVoluntario objEB = new clsEIncentivoVoluntario();
            objEB.setId_incentivo_voluntario(rs.getInt("id_incentivo_voluntario"));
            objEB.setTitulo(rs.getString("titulo"));
            objEB.setDescripcion_voluntariado(rs.getString("descripcion_voluntariado"));
            objEB.setDescripcion_incentivo(rs.getString("descripcion_incentivo"));
            objEB.setId_proyecto_voluntariado(rs.getInt("id_proyecto_voluntariado"));
            listaIncentivos.add(objEB);
        }
    } catch (SQLException e) {
        System.out.println("Error: " + e.toString());
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.toString());
        }
    }
    return listaIncentivos;
}
}
