/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

public class clsEProyectovoluntariado {
    public int id_proyecto_voluntariado;
    public String ubicacion;
    public int voluntario_requerido;
    public String funciones;
    public int id_proyecto;

    public clsEProyectovoluntariado() {
    }

    public clsEProyectovoluntariado(int id_proyecto_voluntariado, String ubicacion, int voluntario_requerido, String funciones, int id_proyecto) {
        this.id_proyecto_voluntariado = id_proyecto_voluntariado;
        this.ubicacion = ubicacion;
        this.voluntario_requerido = voluntario_requerido;
        this.funciones = funciones;
        this.id_proyecto = id_proyecto;
    }

    public int getId_proyecto_voluntariado() {
        return id_proyecto_voluntariado;
    }

    public void setId_proyecto_voluntariado(int id_proyecto_voluntariado) {
        this.id_proyecto_voluntariado = id_proyecto_voluntariado;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getVoluntario_requerido() {
        return voluntario_requerido;
    }

    public void setVoluntario_requerido(int voluntario_requerido) {
        this.voluntario_requerido = voluntario_requerido;
    }

    public String getFunciones() {
        return funciones;
    }

    public void setFunciones(String funciones) {
        this.funciones = funciones;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }
    
    
}
