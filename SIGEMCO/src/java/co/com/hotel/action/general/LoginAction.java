/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.hotel.action.general;

import co.com.hotel.datos.session.Parametros;
import co.com.hotel.datos.session.RetornoLoginDto;
import co.com.hotel.datos.session.Usuario;
import co.com.hotel.logica.general.ConfirmaDatos;
import co.com.hotel.logica.general.RecuperaUsuario;
import co.com.hotel.logica.parametros.Aut_ParametrosLogica;
import co.com.sigemco.alfa.admin.logica.AdministracionLogica;
import co.com.sigemco.alfa.admin.logica.LogoLogica;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

/**
 * Action encargado de realizar el logeo de los usuarios y enrutarnos a la
 * pagina de inicio correspondiente a cada ususario
 *
 * @version 1.0.0
 * @since 1.0.0
 * @author nicolas
 */
public class LoginAction extends ActionSupport implements SessionAware {

    private String user;
    private String pass;
    private Usuario usuario;
    private Parametros parametros;
    public static final String ADMINISTRADOR = "administrador";
    public static final String CAJERO = "cajero";

    //private Map<String,Object> session;
    /**
     * Funcion por default de Struts la cual se encargara de determinar si el
     * usuario el cual intenta ingresar tiene acceso al sistema o no
     *
     * @return
     */
    public String execute() {
        ConfirmaDatos confirma = new ConfirmaDatos();
        //Confirma si el los datos que ingreso el usuario tienen acceso al sistema
        RetornoLoginDto acceso = confirma.confimaUsuario(this.user, this.pass);
        if (acceso.isAcceso()) {
            //Recuperamos el objeto con todos los datos del usuario
            RecuperaUsuario recuperaUsuario = new RecuperaUsuario();
            this.usuario = recuperaUsuario.recuperaDatosUsuario(this.user);
            this.usuario.setCambioContra(acceso.getUpdate());
            this.usuario.setUsuario(this.user);
            //Obtengo el acronimo de la aplicacion
            AdministracionLogica objLogAdm = new AdministracionLogica();
            this.usuario.setAcronimo(objLogAdm.obtieneAcronimoAplicacion());
            //Registro el ultimo ingreso del usuario
            confirma.registraUltimoIngreso(this.usuario.getIdTius());
            //Obtenemos los parametros generales de la aplicación
            Aut_ParametrosLogica logPar = new Aut_ParametrosLogica();
            this.parametros = logPar.calculaFechas(parametros);
            Map session = ActionContext.getContext().getSession();
            session.put("usuario", this.usuario);
            session.put("parametros", this.parametros);
            String tpUsua = usuario.getTipoUsuario();
            //Copia la imagen del logo al proyecto 
            HttpServletRequest request = ServletActionContext.getRequest();
            File logoServ = new File(request.getSession().getServletContext().getRealPath("/IMAGENES/logo.jpg"));
            LogoLogica logLogo = new LogoLogica();
            logLogo.guardaImagenServidor(logoServ);
            if (tpUsua.equalsIgnoreCase("AD")) {
                return ADMINISTRADOR;
            } else {
                return CAJERO;
            }
        } else {
            addActionError("Error de usuario o contraseña");
            return ERROR;
        }
    }

    public String logout() {
        try {
            Map session = ActionContext.getContext().getSession();
            session.put("usuario", null);
            if (session instanceof org.apache.struts2.dispatcher.SessionMap) {
                try {
                    ((org.apache.struts2.dispatcher.SessionMap) session).invalidate();
                } catch (IllegalStateException e) {
                }
            }
        } catch (Exception e) {
        }
        return SUCCESS;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Parametros getParametros() {
        return parametros;
    }

    public void setParametros(Parametros parametros) {
        this.parametros = parametros;
    }

    @Override
    public void setSession(Map<String, Object> map) {

    }

}
