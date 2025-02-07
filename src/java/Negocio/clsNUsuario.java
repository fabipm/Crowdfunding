package Negocio;

import Entidad.clsEUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Config.Conexion;
import java.sql.*;

public class clsNUsuario {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public clsEUsuario login(String correo, String clave) {
        clsEUsuario usuario = null;
        String sql = "SELECT u.*, r.nombre_rol FROM tbusuario u JOIN tbrol r ON u.id_rol = r.id_rol WHERE u.correo = ? AND u.clave = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new clsEUsuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setClave(rs.getString("clave"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setInformacion_personal(rs.getString("informacion_personal"));
                usuario.setInteres(rs.getString("interes"));
                usuario.setHabilidad(rs.getString("habilidad"));
                usuario.setId_rol(rs.getInt("id_rol"));
                usuario.setAvatar(rs.getBytes("avatar"));
       
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return usuario;
    }



    public boolean registrarUsuario(clsEUsuario usuario) {
        String sql = "INSERT INTO tbusuario (apellido, nombre, correo, clave) VALUES (?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getApellido());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getClave());
            int rowsInserted = ps.executeUpdate();
            ps.close();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean existeCorreo(String correo) {
        String sql = "SELECT COUNT(*) FROM tbusuario WHERE Correo = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Si count es mayor que 0, significa que el correo existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return false; // Si hay algún error o no se encuentra el correo, retornamos false
    }
    
    public clsEUsuario obtenerUsuarioPorCorreo(String correo) {
        clsEUsuario usuario = null;
        String sql = "SELECT * FROM tbusuario WHERE correo = ?";

        try {
            Connection con = cn.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, correo);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                usuario = new clsEUsuario();
                usuario.setCorreo(result.getString("correo"));
                usuario.setId_usuario(result.getInt("id_usuario"));
                usuario.setNombre(result.getString("nombre"));
                usuario.setApellido(result.getString("apellido"));
                usuario.setDireccion(result.getString("direccion"));
                usuario.setInformacion_personal(result.getString("informacion_personal"));
                usuario.setInteres(result.getString("interes"));
                usuario.setHabilidad(result.getString("habilidad"));
                usuario.setAvatar(result.getBytes("avatar")); 
            }

            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }
    
    public byte[] obtenerAvatar(int idUsuario) {
        byte[] imagenBytes = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement("SELECT avatar FROM tbusuario WHERE id_usuario = ?");
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next()) {
                imagenBytes = rs.getBytes("avatar");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        return imagenBytes;
    }
    
    public boolean modificarUsuario(String correo, String nuevoNombre, String nuevoApellido, String nuevoDireccion, String nuevoInformacion,String nuevoInteres, String nuevoHabilidad ) {
        String SQL = "UPDATE tbusuario SET nombre = ?, apellido = ?, direccion = ?, informacion_personal = ?, interes = ? , habilidad = ? WHERE correo = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(SQL);
            ps.setString(1, nuevoNombre);
            ps.setString(2, nuevoApellido);
            ps.setString(3, nuevoDireccion);
            ps.setString(4, nuevoInformacion);
            ps.setString(5, nuevoInteres);
            ps.setString(6, nuevoHabilidad);
            ps.setString(7, correo); 

            int resultado = ps.executeUpdate();

            if (resultado > 0) {
                return true; // La actualización se realizó con éxito
            } else {
                return false; // No se pudo actualizar el usuario
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.toString());
            }
        }
    }
     public void actualizarUsuario(clsEUsuario usuario) {
        String sql = "UPDATE tbusuario SET nombre = ?, apellido = ?, correo = ?, direccion = ?, informacion_personal = ?, interes = ?, habilidad = ? WHERE id_usuario = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getDireccion());
            ps.setString(5, usuario.getInformacion_personal());
            ps.setString(6, usuario.getInteres());
            ps.setString(7, usuario.getHabilidad());
            ps.setInt(8, usuario.getId_usuario());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
     public void actualizarAvatar(int idUsuario, byte[] avatar) throws SQLException {
        String sql = "UPDATE tbusuario SET avatar = ? WHERE id_usuario = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setBytes(1, avatar);
            ps.setInt(2, idUsuario);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error al actualizar el avatar: " + e.getMessage(), e);
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
}
