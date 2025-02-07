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


public class clsNProyectovoluntariado {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
    public boolean agregarProyectoVoluntario(clsEProyectovoluntariado proyecto) {
        String SQL = "INSERT INTO tbproyectovoluntariado (ubicacion, voluntario_requerido, funciones, id_proyecto) " +
                     "VALUES (?, ?, ?, ?)"; 
        try (Connection con = cn.getConnection();
             PreparedStatement pst = con.prepareStatement(SQL)) {
            pst.setString(1, proyecto.getUbicacion());
            pst.setInt(2, proyecto.getVoluntario_requerido());
            pst.setString(3, proyecto.getFunciones());
            pst.setInt(4, proyecto.getId_proyecto());

            pst.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
            return false;
        }
    }
    
    public int obtenerUltProyVol() {
        String sql = "SELECT MAX(id_proyecto_voluntariado) as last_id FROM tbproyectovoluntariado;";
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
    
    public clsEProyectovoluntariado obtenerProyectoVoluntariadoPorId(int idProyecto) {
        clsEProyectovoluntariado proyectoVoluntariado = null;
        String sql = "SELECT * FROM tbproyectovoluntariado WHERE id_proyecto = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idProyecto);
            rs = ps.executeQuery();

            if (rs.next()) {
                proyectoVoluntariado = new clsEProyectovoluntariado();
                proyectoVoluntariado.setId_proyecto_voluntariado(rs.getInt("id_proyecto_voluntariado"));
                proyectoVoluntariado.setUbicacion(rs.getString("ubicacion"));
                proyectoVoluntariado.setVoluntario_requerido(rs.getInt("voluntario_requerido"));
                proyectoVoluntariado.setFunciones(rs.getString("funciones"));
                proyectoVoluntariado.setId_proyecto(rs.getInt("id_proyecto"));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el proyecto de voluntariado: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
        return proyectoVoluntariado;
    }
        
    public boolean editarProyectoVoluntario(clsEProyectovoluntariado proyecto) {
        String SQL = "UPDATE tbproyectovoluntariado SET ubicacion = ?, voluntario_requerido = ?, funciones = ? WHERE id_proyecto = ?";
        try (Connection con = cn.getConnection();
             PreparedStatement pst = con.prepareStatement(SQL)) {

            pst.setString(1, proyecto.getUbicacion());
            pst.setInt(2, proyecto.getVoluntario_requerido());
            pst.setString(3, proyecto.getFunciones());
            pst.setInt(4, proyecto.getId_proyecto());

            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {

            return false;
        }
    }

    
}    
    

