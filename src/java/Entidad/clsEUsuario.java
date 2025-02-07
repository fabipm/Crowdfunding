
package Entidad;

/**
 *
 * @author Fabiola
 */
public class clsEUsuario {
    
    private int id_usuario;
    private String nombre;
    private String apellido;
    private String correo;
    private String clave;
    private String direccion;
    private String informacion_personal;
    private String interes;
    private String habilidad;
    private byte[] avatar;
    private int id_rol;
    private String id_estado_usuario;

    public clsEUsuario() {
    }

    public clsEUsuario(int id_usuario, String nombre, String apellido, String correo, String clave, String direccion, String informacion_personal, String interes, String habilidad, byte[] avatar, int id_rol, String id_estado_usuario) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.clave = clave;
        this.direccion = direccion;
        this.informacion_personal = informacion_personal;
        this.interes = interes;
        this.habilidad = habilidad;
        this.avatar = avatar;
        this.id_rol = id_rol;
        this.id_estado_usuario = id_estado_usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getInformacion_personal() {
        return informacion_personal;
    }

    public void setInformacion_personal(String informacion_personal) {
        this.informacion_personal = informacion_personal;
    }

    public String getInteres() {
        return interes;
    }

    public void setInteres(String interes) {
        this.interes = interes;
    }

    public String getHabilidad() {
        return habilidad;
    }

    public void setHabilidad(String habilidad) {
        this.habilidad = habilidad;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getId_estado_usuario() {
        return id_estado_usuario;
    }

    public void setId_estado_usuario(String id_estado_usuario) {
        this.id_estado_usuario = id_estado_usuario;
    }

    
   
}
