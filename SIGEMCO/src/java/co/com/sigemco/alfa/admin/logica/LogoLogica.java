/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.logica;

import java.io.File;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author ACER
 */
public class LogoLogica {
    
    private String rutaBase;

    public LogoLogica() {
        //this.rutaBase = "/imagenes/";
        this.rutaBase = obtieneParametroContext();
    }
    
    /**
     * Funcion con la cual obtengo la ruta base de sigemco para las aplicaciones
     * @return 
     */
    public String obtieneParametroContext() {
        String parametro = "";
        try {
           Context initCtx = new InitialContext();
           String envCtx = (String) initCtx.lookup("java:comp/env/RutaBaseApp");
            parametro = envCtx;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return parametro;
    }
    /**
     * Funcion con la cual guardo la imagen en el repositorio de imagenes
     * @return 
     */
    public String guardaImagenRepositorio(File file){
        String rta = "Ok";
        try {
            File nuevoArchivo = new File(this.rutaBase+"logo.jpg");
            FileUtils.copyFile(file, nuevoArchivo);
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Error "+ e;
        }
        return rta;
    }
    /**
     * Funcion con la cual guardo la imagen en el repositorio de imagenes
     * @return 
     */
    public String guardaImagenFacturaRepositorio(File file){
        String rta = "Ok";
        try {
            File nuevoArchivo = new File(this.rutaBase+"logoFact.jpg");
            FileUtils.copyFile(file, nuevoArchivo);
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Error "+ e;
        }
        return rta;
    }
    
    /**
     * Funcion con la cual guardo la imagen en el repositorio de imagenes
     * @return 
     */
    public String guardaImagenServidor(File file){
        String rta = "Ok";
        try {
            File nuevoArchivo = new File(this.rutaBase+"logo.jpg");
            FileUtils.copyFile(nuevoArchivo, file);
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Error "+ e;
        }
        return rta;
    }

    public String getRutaBase() {
        return rutaBase;
    }

    public void setRutaBase(String rutaBase) {
        this.rutaBase = rutaBase;
    }
    
    
    
}
