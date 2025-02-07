/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;


public class clsEComentario {
    private int id_calificacion_proyecto;
    private String comentario;
    private int calificacion;
    private String recomendacion;
    private int id_proyecto;
    private int id_usuario;
    private String NombreUsuario; 
    private String NombreProyecto; 

    public clsEComentario() {
    }

    public clsEComentario(int id_calificacion_proyecto, String comentario, int calificacion, String recomendacion, int id_proyecto, int id_usuario, String NombreUsuario, String NombreProyecto) {
        this.id_calificacion_proyecto = id_calificacion_proyecto;
        this.comentario = comentario;
        this.calificacion = calificacion;
        this.recomendacion = recomendacion;
        this.id_proyecto = id_proyecto;
        this.id_usuario = id_usuario;
        this.NombreUsuario = NombreUsuario;
        this.NombreProyecto = NombreProyecto;
    }

    public int getId_calificacion_proyecto() {
        return id_calificacion_proyecto;
    }

    public void setId_calificacion_proyecto(int id_calificacion_proyecto) {
        this.id_calificacion_proyecto = id_calificacion_proyecto;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public String getRecomendacion() {
        return recomendacion;
    }

    public void setRecomendacion(String recomendacion) {
        this.recomendacion = recomendacion;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
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
