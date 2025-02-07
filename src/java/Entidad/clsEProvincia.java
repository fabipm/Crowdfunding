/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;


public class clsEProvincia {
    public int  id_provincia;
    public String nombre;
    public int  id_departamento;

    public clsEProvincia() {
    }

    public clsEProvincia(int id_provincia, String nombre, int id_departamento) {
        this.id_provincia = id_provincia;
        this.nombre = nombre;
        this.id_departamento = id_departamento;
    }

    public int getId_provincia() {
        return id_provincia;
    }

    public void setId_provincia(int id_provincia) {
        this.id_provincia = id_provincia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }
    
    
}
