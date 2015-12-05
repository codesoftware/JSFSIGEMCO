/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.admin.dao.CiudadDao;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author ACER
 */
public class CiudadLogica {

    /**
     * Funcion con la cual obtengo el mapa con las ciudades teniendo en cuenta
     * el id del departamento
     *
     * @param idDepa
     * @return
     */
    public ArrayList<CiudadDto> obtieneMapaCiudades(String idDepa) {
        ArrayList<CiudadDto> rta = null;
        try (EnvioFunction function = new EnvioFunction()) {
            CiudadDao objDao = new CiudadDao();
            ResultSet rs = function.enviarSelect(objDao.obtieneCiudades(idDepa));
            while (rs.next()) {
                if (rta == null) {
                    rta = new ArrayList<CiudadDto>();
                }
                CiudadDto aux = new CiudadDto();
                aux.setId(rs.getString("ciud_ciud"));
                aux.setNombre(rs.getString("ciud_nombre"));
                rta.add(aux);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rta;
    }

}
