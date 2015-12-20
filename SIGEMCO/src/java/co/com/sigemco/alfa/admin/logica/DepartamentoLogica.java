/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.admin.dao.DepartamentoDao;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 *
 * @author ACER
 */
public class DepartamentoLogica {

    /**
     * Funcion con la cual se obtiene un mapa con el id y el nombre de todos los
     * departamentos de un pais por default sera colombia
     *
     * @param idPais
     * @return
     */
    public Map<String, String> obtieneListaDepartamentos(int idPais) {
        Map<String, String> rta = null;
        try (EnvioFunction function = new EnvioFunction()) {
            DepartamentoDao objDao = new DepartamentoDao();
            ResultSet rs = function.enviarSelect(objDao.obtieneListaDepartamentos());
            while (rs.next()) {
                if (rta == null) {
                    rta = new LinkedHashMap<String, String>();
                }
                rta.put(rs.getString("depa_depa"), rs.getString("depa_nombre"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rta;
    }

}
