/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

public class clsEIncentivoDonacion {
    public int id_incentivo_donacion;
    public String nombre_incentivo; 
    public String titulo;
    public String descripcion_donacion;
    public String descripcion_incentivo;
    public int id_proyecto;

    public clsEIncentivoDonacion() {
    }

    public clsEIncentivoDonacion(int id_incentivo_donacion, String nombre_incentivo, String titulo, String descripcion_donacion, String descripcion_incentivo, int id_proyecto) {
        this.id_incentivo_donacion = id_incentivo_donacion;
        this.nombre_incentivo = nombre_incentivo;
        this.titulo = titulo;
        this.descripcion_donacion = descripcion_donacion;
        this.descripcion_incentivo = descripcion_incentivo;
        this.id_proyecto = id_proyecto;
    }

    public int getId_incentivo_donacion() {
        return id_incentivo_donacion;
    }

    public void setId_incentivo_donacion(int id_incentivo_donacion) {
        this.id_incentivo_donacion = id_incentivo_donacion;
    }

    public String getNombre_incentivo() {
        return nombre_incentivo;
    }

    public void setNombre_incentivo(String nombre_incentivo) {
        this.nombre_incentivo = nombre_incentivo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion_donacion() {
        return descripcion_donacion;
    }

    public void setDescripcion_donacion(String descripcion_donacion) {
        this.descripcion_donacion = descripcion_donacion;
    }

    public String getDescripcion_incentivo() {
        return descripcion_incentivo;
    }

    public void setDescripcion_incentivo(String descripcion_incentivo) {
        this.descripcion_incentivo = descripcion_incentivo;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    

    
    
    
    
         
}   
