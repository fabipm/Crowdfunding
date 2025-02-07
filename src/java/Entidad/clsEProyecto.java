/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;


public class clsEProyecto {

    public clsEProyecto(String nombreCreador, int id_proyecto, String titulo, String descripcion_corta, String fecha_limite, String video, String tipo_duracion, String descripcion_larga, String lista_donacion, int id_tipo_Proyecto, String nombre_tipo_Proyecto, int id_estado, int id_departamento, int id_provincia, int id_usuario, String nombre_usuario, String nombre_departamento) {
        this.nombreCreador = nombreCreador;
        this.id_proyecto = id_proyecto;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.fecha_limite = fecha_limite;
        this.video = video;
        this.tipo_duracion = tipo_duracion;
        this.descripcion_larga = descripcion_larga;
        this.lista_donacion = lista_donacion;
        this.id_tipo_Proyecto = id_tipo_Proyecto;
        this.nombre_tipo_Proyecto = nombre_tipo_Proyecto;
        this.id_estado = id_estado;
        this.id_departamento = id_departamento;
        this.id_provincia = id_provincia;
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.nombre_departamento = nombre_departamento;
    }

    public String getNombreCreador() {
        return nombreCreador;
    }

    public void setNombreCreador(String nombreCreador) {
        this.nombreCreador = nombreCreador;
    }
    private String nombreCreador;
    public int id_proyecto;
    public String titulo;
    public String descripcion_corta;
    public String fecha_limite;
    public String video;
    public String tipo_duracion;
    public String descripcion_larga;
    public String lista_donacion;
    public int id_tipo_Proyecto;
    public String nombre_tipo_Proyecto;
    public int id_estado;
    public int id_departamento;
    public int id_provincia;
    public int id_usuario;
    private String nombre_usuario; 
    private String nombre_departamento;

    public clsEProyecto() {
    }

    public clsEProyecto(int id_proyecto, String titulo, String descripcion_corta, String fecha_limite, String video, String tipo_duracion, String descripcion_larga, String lista_donacion, int id_tipo_Proyecto, String nombre_tipo_Proyecto, int id_estado, int id_departamento, int id_provincia, int id_usuario, String nombre_usuario, String nombre_departamento) {
        this.id_proyecto = id_proyecto;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.fecha_limite = fecha_limite;
        this.video = video;
        this.tipo_duracion = tipo_duracion;
        this.descripcion_larga = descripcion_larga;
        this.lista_donacion = lista_donacion;
        this.id_tipo_Proyecto = id_tipo_Proyecto;
        this.nombre_tipo_Proyecto = nombre_tipo_Proyecto;
        this.id_estado = id_estado;
        this.id_departamento = id_departamento;
        this.id_provincia = id_provincia;
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.nombre_departamento = nombre_departamento;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion_corta() {
        return descripcion_corta;
    }

    public void setDescripcion_corta(String descripcion_corta) {
        this.descripcion_corta = descripcion_corta;
    }

    public String getFecha_limite() {
        return fecha_limite;
    }

    public void setFecha_limite(String fecha_limite) {
        this.fecha_limite = fecha_limite;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getTipo_duracion() {
        return tipo_duracion;
    }

    public void setTipo_duracion(String tipo_duracion) {
        this.tipo_duracion = tipo_duracion;
    }

    public String getDescripcion_larga() {
        return descripcion_larga;
    }

    public void setDescripcion_larga(String descripcion_larga) {
        this.descripcion_larga = descripcion_larga;
    }

    public String getLista_donacion() {
        return lista_donacion;
    }

    public void setLista_donacion(String lista_donacion) {
        this.lista_donacion = lista_donacion;
    }

    public int getId_tipo_Proyecto() {
        return id_tipo_Proyecto;
    }

    public void setId_tipo_Proyecto(int id_tipo_Proyecto) {
        this.id_tipo_Proyecto = id_tipo_Proyecto;
    }

    public String getNombre_tipo_Proyecto() {
        return nombre_tipo_Proyecto;
    }

    public void setNombre_tipo_Proyecto(String nombre_tipo_Proyecto) {
        this.nombre_tipo_Proyecto = nombre_tipo_Proyecto;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getId_provincia() {
        return id_provincia;
    }

    public void setId_provincia(int id_provincia) {
        this.id_provincia = id_provincia;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getNombre_departamento() {
        return nombre_departamento;
    }

    public void setNombre_departamento(String nombre_departamento) {
        this.nombre_departamento = nombre_departamento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    private String estado;
}
