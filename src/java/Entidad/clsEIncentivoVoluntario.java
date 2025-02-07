/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

public class clsEIncentivoVoluntario {
    public int id_incentivo_voluntario;
    public String titulo;
    public String descripcion_voluntariado;
    public String descripcion_incentivo;
    public int id_proyecto_voluntariado;

    public clsEIncentivoVoluntario() {
    }

    public clsEIncentivoVoluntario(int id_incentivo_voluntario, String titulo, String descripcion_voluntariado, String descripcion_incentivo, int id_proyecto_voluntariado) {
        this.id_incentivo_voluntario = id_incentivo_voluntario;
        this.titulo = titulo;
        this.descripcion_voluntariado = descripcion_voluntariado;
        this.descripcion_incentivo = descripcion_incentivo;
        this.id_proyecto_voluntariado = id_proyecto_voluntariado;
    }

    public int getId_incentivo_voluntario() {
        return id_incentivo_voluntario;
    }

    public void setId_incentivo_voluntario(int id_incentivo_voluntario) {
        this.id_incentivo_voluntario = id_incentivo_voluntario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion_voluntariado() {
        return descripcion_voluntariado;
    }

    public void setDescripcion_voluntariado(String descripcion_voluntariado) {
        this.descripcion_voluntariado = descripcion_voluntariado;
    }

    public String getDescripcion_incentivo() {
        return descripcion_incentivo;
    }

    public void setDescripcion_incentivo(String descripcion_incentivo) {
        this.descripcion_incentivo = descripcion_incentivo;
    }

    public int getId_proyecto_voluntariado() {
        return id_proyecto_voluntariado;
    }

    public void setId_proyecto_voluntariado(int id_proyecto_voluntariado) {
        this.id_proyecto_voluntariado = id_proyecto_voluntariado;
    }
    
    
}
