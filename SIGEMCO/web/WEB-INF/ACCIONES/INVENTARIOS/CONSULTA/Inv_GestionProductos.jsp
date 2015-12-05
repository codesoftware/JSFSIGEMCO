<%@page import="co.com.hotel.datos.session.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String permisos = usuario.getPermisos();
%>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
        <script type="text/javascript" src="<%=RutaSitio%>/JS/INVENTARIOS/PRODUCTO/Inv_GestionProductos.js"></script>
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
        <br/>
        <div class="row">
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
            <div class="col-md-6 col-xs-12 col-sm-12">
                <div class="Mensajes" style="display: none;">
                    <s:if test="hasActionErrors()">
                        <div class="alert alert-danger" id="info" role="alert" ><h4><s:actionerror /></h4></div>
                        <script>
                            mostrarMsn();
                        </script>
                    </s:if>
                </div>
                <div class="MensajesOk" style="display: none;">
                    <s:if test="hasActionMessages()">
                        <div class="alert alert-success" id="info" role="alert" ><h4><s:actionmessage/></h4></div>
                        <script>
                            mostrarMsnOk();
                        </script>
                    </s:if>
                </div>
            </div>
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
        </div>
        <br/>
        <div class="row">
            <div class="col-md-2 col-xs-0 col-sm-0"></div>
            <div class="col-md-8 col-xs-12 col-sm-12">
                <div class="row thumbnail">
                    <div class="row">
                        <div class="form-group col-md-12 col-sm-12 col-xs-12 ">
                            <div class="alert alert-success text-center"  role="alert" ><h3>GESTIÓN DE PRODUCTOS</h3></div>
                        </div>
                    </div>
                    <div class="row">
                        <%if (permisos.indexOf(".InPr1.") >= 0) {%>
                        <div class="form-group col-md-4 col-sm-6 col-xs-6 ">
                            <a class="btn btn-primary" href="reenvioGeneral.action?accion=214">CONSULTA GENERAL</a>
                        </div>
                        <%}%>
                        <%if (permisos.indexOf(".InPr2.") >= 0) {%>
                        <div class="form-group col-md-4 col-sm-6 col-xs-6 ">
                            <a class="btn btn-danger" href="reenvioGeneral.action?accion=211">ADICIONAR NUEVO</a>
                        </div>
                        <%}%>
                        <%if (permisos.indexOf(".InPr3.") >= 0) {%>
                        <div class="form-group col-md-4 col-sm-6 col-xs-6 ">
                            <a class="btn btn-success" onclick="adicionaProductoExistente()" >ADICIONAR EXISTENTE</a>
                        </div>
                        <%}%>
                        <%if (permisos.indexOf(".InPr4.") >= 0) {%>
                        <div class="form-group col-md-4 col-sm-6 col-xs-6 ">
                            <a class="btn btn-danger" href="reenvioGeneral.action?accion=215">ACTIVAR E INACTIVAR</a>
                        </div>
                        <%}%>
                        <%if (permisos.indexOf(".InPr9.") >= 0) {%>
                        <div class="form-group col-md-4 col-sm-6 col-xs-6 ">
                            <a class="btn btn-primary" onclick="cambioSedeProducto()" >CAMBIO DE SEDE</a>
                        </div>                        
                        <%}%>
                        <%if (permisos.indexOf(".InPr10.") >= 0) {%>
                        <div class="form-group col-md-4 col-sm-6 col-xs-6 ">
                            <a class="btn btn-primary" onclick="correccionIngresos()" >CORRECCION DE INGRESOS</a>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-xs-0 col-sm-0"></div>
        </div>
        <!-- Html con el cual se muestra un dialogo-->
        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="mensaje">
            <div class="modal-dialog">                
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">INFORMACION</h4>
                    </div>
                    <div class="modal-body">
                        <span id="textoMsn"></span>
                    </div>
                    <div class="modal-footer">                        
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="botonAceptar">
                            ACEPTAR
                        </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" >
                            CANCELAR
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div style="display:none;">
        <s:form action="inv_consProdForAddEx" id="inv_consProdForAddEx" method="post">
            <s:textfield name="accion" value="consultaForAddEx" cssStyle="display:none"/>
            <s:textfield name="producto.dska_cod" id="codAddProdExist" />
        </s:form>
        <s:form action="inv_ConsProdCambioSede" id="inv_ConsProdCambioSede" method="post">
            <s:textfield name="accion" value="buscaProdCambioSede" cssStyle="display:none"/>
            <s:textfield name="producto.dska_cod" id="codigoProdCambioSede" />
        </s:form>
        <s:form action="inv_ConsProdCorrIngresos" id="inv_ConsProdCorrIngresos" method="post" >
            <s:textfield name="accion" value="buscaProdCorrProd" />
            <s:textfield name="producto.dska_cod" id="codigoProdCorrigeIng" cssClass="form-control" />
        </s:form>
    </div>
    </body>
</html>
