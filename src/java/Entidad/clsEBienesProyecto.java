/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;


public class clsEBienesProyecto {
    
    private int id_bienes;
    private int cantidad;
    private String  fecha;
    private int id_usuario;
    private int id_proyecto;
    private String  NombreUsuario;
    private String  NombreProyecto;

    public clsEBienesProyecto() {
    }

    public clsEBienesProyecto(int id_bienes, int cantidad, String fecha, int id_usuario, int id_proyecto, String NombreUsuario, String NombreProyecto) {
        this.id_bienes = id_bienes;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.id_usuario = id_usuario;
        this.id_proyecto = id_proyecto;
        this.NombreUsuario = NombreUsuario;
        this.NombreProyecto = NombreProyecto;
    }

    
    
    public int getId_bienes() {
        return id_bienes;
    }

    public void setId_bienes(int id_bienes) {
        this.id_bienes = id_bienes;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getNombreProyecto() {
        return NombreProyecto;
    }

    public void setNombreProyecto(String NombreProyecto) {
        this.NombreProyecto = NombreProyecto;
    }

    
    
}
