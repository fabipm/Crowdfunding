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

public class clsNLinks {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st;  
    
    public boolean guardarLink(clsELinks links) {
        String SQL = "INSERT INTO tblinkexternoproyecto (facebook, twitter, youtube, paginaweb, id_proyecto) " +
                     "VALUES (?, ?, ?, ?, ?)"; 
        try (Connection con = cn.getConnection();
            PreparedStatement pst = con.prepareStatement(SQL)) {
            pst.setString(1, links.getFacebook());
            pst.setString(2, links.getTwitter());
            pst.setString(3, links.getYoutube());
            pst.setString(4, links.getPaginaweb());
            pst.setInt(5, links.getId_proyecto());

            pst.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
            return false;
        }
    }    
}
