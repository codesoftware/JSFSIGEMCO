/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.logica;

import java.io.File;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author ACER
 */
public class LogoLogica {
    
    private String rutaBase;

    public LogoLogica() {
        this.rutaBase = "/imagenes/";
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