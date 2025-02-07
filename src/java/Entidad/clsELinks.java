/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;


public class clsELinks {
    public int id_link;
    public String  facebook;
    public String twitter;
    public String  youtube;
    public String paginaweb;
    public int id_proyecto;

    public clsELinks() {
    }

    public clsELinks(int id_link, String facebook, String twitter, String youtube, String paginaweb, int id_proyecto) {
        this.id_link = id_link;
        this.facebook = facebook;
        this.twitter = twitter;
        this.youtube = youtube;
        this.paginaweb = paginaweb;
        this.id_proyecto = id_proyecto;
    }

    public int getId_link() {
        return id_link;
    }

    public void setId_link(int id_link) {
        this.id_link = id_link;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getYoutube() {
        return youtube;
    }

    public void setYoutube(String youtube) {
        this.youtube = youtube;
    }

    public String getPaginaweb() {
        return paginaweb;
    }

    public void setPaginaweb(String paginaweb) {
        this.paginaweb = paginaweb;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }
       
}
