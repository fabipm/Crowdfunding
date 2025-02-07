package Config;
        
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private Connection con = null;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //driver conexion a mysql

            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bdrefugio","root","");
            // conexion a la BD con los parametros de la conexion 
            
            if (con != null) {
                System.out.println("Conexión establecida."); // Opcional: mensaje de confirmación
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return con;
    }
    
    public void cerrarConexion() {
        try {
            if (con != null) {
                con.close();
                System.out.println("Conexión cerrada."); // Opcional: mensaje de confirmación
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}
