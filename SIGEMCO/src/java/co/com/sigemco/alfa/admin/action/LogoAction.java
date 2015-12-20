/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.action;

import co.com.hotel.datos.session.Usuario;
import co.com.hotel.utilidades.UsuarioHabilitado;
import co.com.sigemco.alfa.admin.logica.AdministracionLogica;
import co.com.sigemco.alfa.admin.logica.LogoLogica;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author ACER
 */
public class LogoAction extends ActionSupport implements UsuarioHabilitado, SessionAware {

    private Usuario usuario;
    private Map session;
    private String acronimo;
    private File imagen;
    private String imagenFileName;
    private String imagenContentType;

    /**
     * Funcion con la cual se carga una imagen en el servidor para luego
     * visualizarla en la aplicacion
     *
     * @return
     */
    public String cargaImagen() {
        AdministracionLogica logica = new AdministracionLogica();
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            File logoServ = new File(request.getSession().getServletContext().getRealPath("/IMAGENES/logo.jpg"));
            String valida = logica.guardaAcronimo(acronimo);
            if ("Ok".equalsIgnoreCase(valida)) {
                if (imagen != null) {
                    LogoLogica logLogo = new LogoLogica();
                    valida = logLogo.guardaImagenRepositorio(imagen);
                    logLogo.guardaImagenServidor(logoServ);
                }
                if ("Ok".equalsIgnoreCase(valida)) {
                    addActionMessage("Imagen Guardada correctamente");
                } else {
                    addActionError("Error al guardar la imagen " + valida);
                }
                addActionMessage("Acronimo actualzado correctamente");
            } else {
                addActionMessage("Error al insertar o actualizar el acronimo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public String getAcronimo() {
        return acronimo;
    }

    public void setAcronimo(String acronimo) {
        this.acronimo = acronimo;
    }

    public File getImagen() {
        return imagen;
    }

    public void setImagen(File imagen) {
        this.imagen = imagen;
    }

    public String getImagenFileName() {
        return imagenFileName;
    }

    public void setImagenFileName(String imagenFileName) {
        this.imagenFileName = imagenFileName;
    }

    public String getImagenContentType() {
        return imagenContentType;
    }

    public void setImagenContentType(String imagenContentType) {
        this.imagenContentType = imagenContentType;
    }

}
