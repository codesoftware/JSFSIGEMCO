<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/ADMINISTRACION/EMPRESA/Adm_ParametrosEmpresariales.js"></script>
        <s:head/>
    </head>
    <body>
        <s:div cssClass="header">
            <s:include value="/WEB-INF/NEWTEMPLATE/FrameTop.jsp" > 
                <s:param name="nombre"><s:text name="usuario.apellido"/> <s:text name="usuario.nombre"/></s:param>
                <s:param name="perfil"><s:text name="usuario.NomPerfil"/></s:param>
                <s:param name="ultimoIngreso"><s:text name="usuario.ultimoIngreso"/></s:param>
                <s:param name="acronimo"><s:text name="usuario.acronimo"/></s:param>
            </s:include>
        </s:div>
        <s:div cssClass="navigator">
            <s:include value="/WEB-INF/NEWTEMPLATE/menu.jsp">
                <s:param name="title"><s:property value="usuario.usuario" /></s:param>
            </s:include> 
        </s:div>
        <div class="Mensajes" style="display: none;">
            <s:if test="hasActionErrors()">
                <div class="alert alert-danger" id="info" role="alert" ><h4><s:actionerror /></h4></div>
                <script>
                    mostrarMsn();
                </script>
            </s:if>
        </div>
        <div class="row">
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
            <div class="col-md-6 col-xs-12 col-sm-12">
                <div class="MensajesOk" style="display: none;">
                    <s:if test="hasActionMessages()">
                        <div class="alert alert-success" id="info" role="alert" ><h4><s:actionmessage/></h4></div>
                        <script>
                            mostrarMsnOk();
                        </script>
                    </s:if>
                </div>
                <div class="errorMensajes" style="display: none;">
                    <s:if test="hasActionErrors()">
                        <div class="errors">
                            <s:actionerror/>                                               
                            <script>
                                mostrarMsnErr();
                            </script>
                        </div>
                    </s:if>
                </div>       
                <br/>
                <s:form theme="simple" action="adm_updtParaEmp" id="adm_updtParaEmp" >
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th colspan="2" align="center" class="alert alert-info text-center"><h3>PARAMETROS GENERALES EMPRESARIALES</h3></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td >Nombre: </td>
                                <td ><s:textfield cssClass="form-control" name="empresa.nombre"/></td>
                            </tr>
                            <tr>
                                <td>Nit:</td>
                                <td><s:textfield cssClass="form-control" name="empresa.nit" /></td>
                            </tr>
                            <tr>
                                <td>Resolución Factura No: </td>
                                <td><s:textfield cssClass="form-control" name="empresa.resolucion" /></td>
                            </tr>
                            <tr>
                                <td>Direcci&oacute;n: </td>
                                <td><s:textfield cssClass="form-control" name="empresa.direccion" /></td>
                            </tr>
                            <tr>
                                <td>Telefono: </td>
                                <td><s:textfield cssClass="form-control" name="empresa.telefono" /></td>
                            </tr>
                            <tr>
                                <td>Departamento:</td>
                                <td>
                                    <s:select list="departamentos" cssClass="form-control" headerValue="SELECCIONE UN DEPARTAMENTO" headerKey="-1" onchange="cambioDepartamento(this.value)" name="empresa.departamento" ></s:select>
                                </td>
                            </tr>
                            <tr>
                                <td>Ciudad:</td>
                                <td>
                                    <select id="selectCiudad" name="empresa.ciudad" class="form-control" >
                                        <option value="-1">SELECCIONE UNA DEPARTAMENTO</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/add.jsp" > 
                                        <s:param name="function">ingresarParametros</s:param>
                                        <s:param name="title">Actualizar parametros</s:param>
                                    </s:include>
                                    <s:include value="/WEB-INF/TEMPLATE/botones/clean.jsp" />
                                </td>
                            </tr>
                        </tfoot>                  
                    </table>
                </s:form>
            </div>     
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
            <s:if test="%{empresa.ciudad != null}">
                <script>
                    cambioDepartamento(document.getElementById('adm_updtParaEmp_empresa_departamento').value);
                    var ciudad = '<s:text name="empresa.ciudad"/>';
                    document.getElementById('selectCiudad').value = ciudad;
                </script>
            </s:if>
        </div> 
    </body>
</html>
