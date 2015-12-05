/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.dao;

/**
 * Clase con la cual obtengo los Querys de parametrizacion de la aplicacion
 *
 * @author Nicolas
 */
public class ParametrosAplicacionDao {

    /**
     * Funcion con la que busco el parametro del inicio del sistema
     *
     * @return
     */
    public String buscaParametrizacionInicio() {
        StringBuilder sql = new StringBuilder();
        sql.append("select PARA_ESTADO ");
        sql.append("from ad_tpara ");
        sql.append("where para_nombre = 'INICIO_PROD' ");
        sql.append("LIMIT 1");
        return sql.toString();
    }

    /**
     * Funcion con la cual buscamos los productos que estan proximos a terminar
     * sus existencias
     *
     * @return
     */
    public String buscaProductosAlerta() {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT dska_cod, dska_nom_prod, cepr_existencia ");
        sql.append("FROM in_tcepr, in_tdska ");
        sql.append("WHERE dska_dska = cepr_dska ");
        sql.append("AND cepr_existencia < 5");
        return sql.toString();
    }

    /**
     * Funcion con la cual inserto el acronimo en la base de datos
     *
     * @return
     */
    public String insertaAcronimo(String acronimo) {
        StringBuilder sql = new StringBuilder();
        sql.append("insert into em_tpara(para_clave, para_valor) ");
        sql.append("values ('ACRONIMO','" + acronimo + "') ");
        return sql.toString();
    }
    /**
     * Funcion con la cual actualizo el acronimo parametrizado en la base de datos
     * @return 
     */
    public String actualizaAcronimo(String acronimo){
        StringBuilder sql = new StringBuilder();
        sql.append("update em_tpara ");
        sql.append("set para_valor = '");
        sql.append(acronimo);
        sql.append("' ");
        sql.append("WHERE para_clave = 'ACRONIMO' ");
        return sql.toString();
    }

    /**
     * Funcion con la cual creo el sql para verificar si el acronimo se
     * encuentra almacenado en la base de datos
     *
     * @return
     */
    public String consultaExistenciaAcronimo() {
        StringBuilder sql = new StringBuilder();
        sql.append("select count(*) contador ");
        sql.append("from em_tpara ");
        sql.append("where para_clave = 'ACRONIMO' ");
        return sql.toString(); 
    }
    
    /**
     * Funcion con la cual creo el sql para obtener el acronimo parametrizado     
     * @return
     */
    public String consultaAcronimo() {
        StringBuilder sql = new StringBuilder();
        sql.append("select para_valor acronimo ");
        sql.append("from em_tpara ");
        sql.append("where para_clave = 'ACRONIMO' ");
        return sql.toString(); 
    }

}
