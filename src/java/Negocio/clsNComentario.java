/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Config.Conexion;
import Entidad.clsEComentario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class clsNComentario {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
public boolean addComentario(clsEComentario comentario) {
    String SQL = "INSERT INTO tbcalificacionproyecto(calificacion, comentario, recomendacion, id_proyecto, id_usuario) VALUES (?, ?, ?, ?, ?)";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(SQL);
        ps.setInt(1, comentario.getCalificacion());
        ps.setString(2, comentario.getComentario());
        ps.setString(3, comentario.getRecomendacion());
        ps.setInt(4, comentario.getId_proyecto());
        ps.setInt(5, comentario.getId_usuario());
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException e) {
        System.out.println("Error SQL al agregar comentario: " + e.toString());
        return false;
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión o el PreparedStatement: " + e.toString());
        }
    }
}
public List<clsEComentario> buscarPorIdUsuario(int idUsuario) {
    ArrayList<clsEComentario> listaComentarios = new ArrayList<>();
    String sql = "SELECT cp.*, p.titulo AS NombreProyecto " +
                 "FROM tbcalificacionproyecto cp " +
                 "INNER JOIN tbproyecto p ON cp.id_proyecto = p.id_proyecto " +
                 "WHERE cp.id_usuario = ?";
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idUsuario); // Establecer el parámetro del ID de usuario
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEComentario objEB = new clsEComentario();
            objEB.setId_calificacion_proyecto(rs.getInt("id_calificacion_proyecto"));
            
            objEB.setCalificacion(rs.getInt("calificacion"));
            objEB.setComentario(rs.getString("comentario"));
            objEB.setRecomendacion(rs.getString("recomendacion"));
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            objEB.setId_usuario(rs.getInt("id_usuario"));
            objEB.setNombreProyecto(rs.getString("NombreProyecto")); // Cambio en el nombre del campo
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

}
