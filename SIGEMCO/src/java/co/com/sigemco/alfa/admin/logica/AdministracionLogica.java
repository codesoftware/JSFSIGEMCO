/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.sigemco.alfa.admin.logica;

import co.com.hotel.persistencia.general.EnvioFunction;
import co.com.sigemco.alfa.admin.dao.ParametrosAplicacionDao;
import co.com.sigemco.alfa.inventario.dto.ProductoDto;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase con la cual creo la logica para la administracion de la aplicacion
 *
 * @author Nicolas
 */
public class AdministracionLogica {

    /**
     * Funcion con la cual obtengo la parametrizacion del inicio de la pantalla
     *
     * @return
     */
    public String obtieneParametrizacionInicio() {
        String rta = "";
        ParametrosAplicacionDao objDao = new ParametrosAplicacionDao();
        try (EnvioFunction function = new EnvioFunction()) {
            ResultSet rs = function.enviarSelect(objDao.buscaParametrizacionInicio());
            if (rs.next()) {
                rta = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return rta;
    }

    /**
     * Funcion encargada de buscar los productos que estan apunto de acabar sus
     * existencias en el sistema
     *
     * @return
     */
    public List<ProductoDto> buscaProdProximosTerminar() {
        List<ProductoDto> lista = null;
        try (EnvioFunction function = new EnvioFunction()) {
            ParametrosAplicacionDao objDao = new ParametrosAplicacionDao();
            ResultSet rs = function.enviarSelect(objDao.buscaProductosAlerta());
            while (rs.next()) {
                if (lista == null) {
                    lista = new ArrayList<>();
                }
                ProductoDto aux = new ProductoDto();
                aux.setDska_cod(rs.getString("dska_cod"));
                aux.setDska_nom_prod(rs.getString("dska_nom_prod"));
                aux.setCantidad(rs.getString("cepr_existencia"));
                lista.add(aux);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    /**
     * Funcion con la cual guardo el acronimo de la compañia en la base se datos
     *
     * @param acronimo
     * @return
     */
    public String guardaAcronimo(String acronimo) {
        String rta = "Ok";
        try (EnvioFunction function = new EnvioFunction()) {
            ParametrosAplicacionDao objDao = new ParametrosAplicacionDao();
            if (this.consultaExistenciaAcronimo() == 0) {
                function.enviarUpdate(objDao.insertaAcronimo(acronimo));
            } else {
                function.enviarUpdate(objDao.actualizaAcronimo(acronimo));
            }
        } catch (Exception e) {
            e.printStackTrace();
            rta = "Ok";
        }
        return rta;
    }

    /**
     * Funcion con la cual consulto si existe el acronimo de facturacion en la
     * base de datos 0 si no existe y 1 si existe
     *
     * @return
     */
    public int consultaExistenciaAcronimo() {
        int rta = 0;
        try (EnvioFunction funcion = new EnvioFunction()) {
            ParametrosAplicacionDao objDao = new ParametrosAplicacionDao();
            ResultSet rs = funcion.enviarSelect(objDao.consultaExistenciaAcronimo());
            if (rs.next()) {
                rta = rs.getInt("contador");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return rta;
    }

    /**
     * Funcion con la cual obtengo el acronimo parametrizado de la aplicacion
     *
     * @return
     */
    public String obtieneAcronimoAplicacion() {
        String rta = "";
        try (EnvioFunction funcion = new EnvioFunction()) {
            ParametrosAplicacionDao objDao = new ParametrosAplicacionDao();
            ResultSet rs = funcion.enviarSelect(objDao.consultaAcronimo());
            if (rs.next()) {
                rta = rs.getString("acronimo");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return rta;
    }

}
