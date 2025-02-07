/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Config.Conexion;
import Entidad.clsEBienesProyecto;
import Entidad.clsEComentario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class clsNBienesProyecto {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
    public List<clsEBienesProyecto> ListarDonacionesID(int idProyecto) {
    ArrayList<clsEBienesProyecto> listaDonantes = new ArrayList<>();
    String sql = "SELECT cp.*, u.Nombre AS NombreUsuario " +
                 "FROM tbbienesproyecto cp " +
                 "INNER JOIN tbusuario u ON cp.id_usuario = u.id_usuario " +
                 "WHERE cp.id_proyecto = ?";
    
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idProyecto); // Set the project ID parameter
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEBienesProyecto objEB = new clsEBienesProyecto();
            objEB.setId_bienes(rs.getInt("id_bienes"));           
            objEB.setCantidad(rs.getInt("cantidad"));
            objEB.setFecha(rs.getString("fecha"));
            objEB.setId_usuario(rs.getInt("id_usuario"));
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            objEB.setNombreUsuario(rs.getString("NombreUsuario"));
            listaDonantes.add(objEB);
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
    return listaDonantes;
}
    public boolean egregarDonacion(clsEBienesProyecto donacion) {
        String SQL = "INSERT INTO tbbienesproyecto (cantidad, fecha, id_usuario, id_proyecto) " +
                     "VALUES (?, ?, ?, ?)"; 
        try (Connection con = cn.getConnection();
            PreparedStatement pst = con.prepareStatement(SQL)) {
            pst.setInt(1, donacion.getCantidad());
            pst.setString(2, donacion.getFecha());
            pst.setInt(3, donacion.getId_usuario());
            pst.setInt(4, donacion.getId_proyecto());

            pst.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
            return false;
        }
    }
    
public List<clsEBienesProyecto> ListarDonacionesIdUsuario(int idUsuario) {
    ArrayList<clsEBienesProyecto> listaDonantes = new ArrayList<>();
    String sql = "SELECT cp.*, u.titulo AS NombreProyecto " +
                 "FROM tbbienesproyecto cp " +
                 "INNER JOIN tbproyecto u ON cp.id_proyecto = u.id_proyecto " +
                 "WHERE cp.id_usuario = ?";
    
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idUsuario); // Cambio a idUsuario en lugar de idProyecto
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEBienesProyecto objEB = new clsEBienesProyecto();
            objEB.setId_bienes(rs.getInt("id_bienes"));           
            objEB.setCantidad(rs.getInt("cantidad"));
            objEB.setFecha(rs.getString("fecha"));
            objEB.setId_usuario(rs.getInt("id_usuario"));
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            objEB.setNombreProyecto(rs.getString("NombreProyecto"));
            listaDonantes.add(objEB);
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
    return listaDonantes;
}

public List<clsEBienesProyecto> ListarDonacionesxProyecto(int idproyecto) {
    ArrayList<clsEBienesProyecto> listaDonantes = new ArrayList<>();
    String sql = "SELECT cp.*, u.titulo AS NombreProyecto " +
                 "FROM tbbienesproyecto cp " +
                 "INNER JOIN tbproyecto u ON cp.id_proyecto = u.id_proyecto " +
                 "WHERE u.id_proyecto = ?";
    
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setInt(1, idproyecto); // Cambio a idUsuario en lugar de idProyecto
        rs = ps.executeQuery();
        while (rs.next()) {
            clsEBienesProyecto objEB = new clsEBienesProyecto();
            objEB.setId_bienes(rs.getInt("id_bienes"));           
            objEB.setCantidad(rs.getInt("cantidad"));
            objEB.setFecha(rs.getString("fecha"));
            objEB.setId_usuario(rs.getInt("id_usuario"));
            objEB.setId_proyecto(rs.getInt("id_proyecto"));
            objEB.setNombreProyecto(rs.getString("NombreProyecto"));
            listaDonantes.add(objEB);
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
    return listaDonantes;
}

}
        
