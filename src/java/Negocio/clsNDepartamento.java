/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Config.Conexion;
import Entidad.clsEDepartamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class clsNDepartamento {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs; //almacena datos en la consulta
    Statement st; 
    
    // Método para listar departamentos
    public List<clsEDepartamento> listarDepartamentos() {
        ArrayList<clsEDepartamento> listaDepartamentos = new ArrayList<>();
        String sql = "SELECT id_departamento, nombre FROM tbdepartamento";
        
        try {
            con = cn.getConnection(); // Utilizamos la conexión establecida
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                clsEDepartamento departamento = new clsEDepartamento();
                departamento.setId_departamento(rs.getInt("id_departamento"));
                departamento.setNombre(rs.getString("nombre"));
                listaDepartamentos.add(departamento);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar departamentos: " + e.toString());
        } finally {
            cerrarRecursos(); // Cerramos los recursos al finalizar
        }
        
        return listaDepartamentos;
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
