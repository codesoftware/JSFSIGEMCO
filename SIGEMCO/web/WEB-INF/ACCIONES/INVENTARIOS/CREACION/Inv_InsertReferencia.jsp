<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="/WEB-INF/NEWTEMPLATE/Parametros.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <s:include value="/WEB-INF/NEWTEMPLATE/cabecera.jsp"></s:include>
            <script type="text/javascript" src="JS/INVENTARIOS/Inv_UpdReferencia.js"></script>
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
                <br/>
                <s:form action="inv_InsReferencia" method="post" theme="simple">
                    <s:textfield name="accion" value="insertar" cssStyle="display:none;"/>
                    <table class="table table-bordered" >
                        <thead>
                            <tr>
                                <th colspan="2" style="text-align: center;" class="alert alert-info text-center"><h3>
                                <s:i18n name="co.com.sigemco.alfa.archivos.MessagesBundleProducto" >
                                    <s:text name="texto1" />
                                    </s:i18n></h3></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Nombre:</td>
                                <td><s:textfield name="referencia.refe_nombre" cssClass="form-control"  maxLength="50"/></td>
                            </tr>
                            <tr>
                                <td>Descripción:</td>
                                <td><s:textfield name="referencia.refe_desc" cssClass="form-control"  maxlength="200"/></td>
                            </tr>
                            <tr>
                                <td><s:text name="modeloAsociado.caracteristica1"/></td>
                                <td><s:textfield name="referencia.refe_came" cssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td><s:text name="modeloAsociado.caracteristica2"/></td>
                                <td><s:textfield name="referencia.refe_memori" cssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td><s:text name="modeloAsociado.caracteristica3"/></td>
                                <td><s:textfield name="referencia.refe_pantalla" cssClass="form-control" /></td>
                            </tr>

                        </tbody>                        
                        <tfoot>
                            <tr>
                                <td style="text-align: right;" colspan="2">
                                    <s:include value="/WEB-INF/TEMPLATE/botones/add.jsp" > 
                                        <s:param name="function">insertarReferencia</s:param>
                                        <s:param name="title">Adicion Referencia</s:param>
                                    </s:include>
                                    <s:include value="/WEB-INF/TEMPLATE/botones/clean.jsp" />

                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </s:form>
            </div>
            <div class="col-md-3 col-xs-0 col-sm-0"></div>
        </div>
    </body>
</html>
