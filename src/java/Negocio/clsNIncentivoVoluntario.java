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

public class clsNIncentivoVoluntario {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
    public boolean guardarIncentivo(clsEIncentivoVoluntario incentivo) {
        String SQL = "INSERT INTO tbincentivovoluntario (titulo, descripcion_voluntariado, descripcion_incentivo, id_proyecto_voluntariado) " +
                     "VALUES (?, ?, ?, ?)"; 
        try (Connection con = cn.getConnection();
            PreparedStatement pst = con.prepareStatement(SQL)) {
            pst.setString(1, incentivo.getTitulo());
            pst.setString(2, incentivo.getDescripcion_voluntariado());
            pst.setString(3, incentivo.getDescripcion_incentivo());
            pst.setInt(4, incentivo.getId_proyecto_voluntariado());
            pst.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
            return false;
        }
    }
    
}
