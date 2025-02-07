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



public class clsNProvincia {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
    // Método para listar provincias
    public List<clsEProvincia> listarProvincias() {
        ArrayList<clsEProvincia> listaProvincias = new ArrayList<>();
        String sql = "SELECT id_provincia, nombre FROM tbprovincia";
        
        try {
            con = cn.getConnection(); // Utilizamos la conexión establecida
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                clsEProvincia provincia = new clsEProvincia();
                provincia.setId_provincia(rs.getInt("id_provincia"));
                provincia.setNombre(rs.getString("nombre"));
                listaProvincias.add(provincia);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar provincias: " + e.toString());
        } finally {
            cerrarRecursos(); // Cerramos los recursos al finalizar
        }
        
        return listaProvincias;
    }
    
    // Método para cerrar recursos
    private void cerrarRecursos() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.toString());
        }
    }
    
}
