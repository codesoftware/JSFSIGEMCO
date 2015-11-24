/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.dao;

/**
 * Clase en la cual realizo
 * @author ACER
 */
public class CiudadDao {

    /**
     * Funcion con la cual obtengo las ciudades basandose en el id del
     * departamento
     *
     * @param idDepa
     * @return
     */
    public String obtieneCiudades(String idDepa) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT ciud_ciud, ciud_depa, ciud_nombre, ciud_descripcion, ciud_default, ");
        sql.append(" ciud_codigo ");
        sql.append("FROM ub_tciud ");
        sql.append("WHERE ciud_depa =");
        sql.append(idDepa);
        return sql.toString();
    }
}
