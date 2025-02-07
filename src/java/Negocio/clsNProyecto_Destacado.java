/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Config.Conexion;
import Entidad.clsEProyecto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author RAUL
 */
public class clsNProyecto_Destacado {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    

    public List<clsEProyecto> listar1() {
        ArrayList<clsEProyecto> list = new ArrayList<>();
        String sql = "SELECT p.*, u.Nombre AS nombre_usuario, d.nombre AS nombre_departamento " +
                 "FROM tbproyecto p " +
                 "INNER JOIN tbusuario u ON p.id_usuario = u.id_usuario " +
                 "INNER JOIN tbdepartamento d ON p.id_departamento = d.id_departamento " +
                 "WHERE p.id_tipo_proyecto = 1";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clsEProyecto objEB = new clsEProyecto();
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
                list.add(objEB);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
        }
        return list;
    }
    public List<clsEProyecto> listar2() {
        ArrayList<clsEProyecto> list = new ArrayList<>();
        String sql = "SELECT p.*, u.Nombre AS nombre_usuario, d.nombre AS nombre_departamento " +
                 "FROM tbproyecto p " +
                 "INNER JOIN tbusuario u ON p.id_usuario = u.id_usuario " +
                 "INNER JOIN tbdepartamento d ON p.id_departamento = d.id_departamento " +
                 "WHERE p.id_tipo_proyecto = 2";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                clsEProyecto objEB = new clsEProyecto();
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
                list.add(objEB);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
        }
        return list;
    }
}
