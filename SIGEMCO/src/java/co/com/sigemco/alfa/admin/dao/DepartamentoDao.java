/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.dao;

/**
 *
 * @author ACER
 */
public class DepartamentoDao {

    /**
     * Funcion con la cual obtengo la lista de departamentos parametrizados en
     * el sistema
     *
     * @return
     */
    public String obtieneListaDepartamentos() {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT depa_depa, depa_pais, depa_nombre, depa_descripcion, depa_default,  "); 
        sql.append("depa_codigo ");
        sql.append(" FROM ub_tdepa ");
        sql.append(" ORDER BY depa_nombre");
        return sql.toString();
    }

}
