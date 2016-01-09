<%@page import="co.com.sigemco.alfa.tareaProgramada.Programacion"%>
<%@page import="co.com.sigemco.alfa.tareaProgramada.TareaInvocar"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>        
        <%@include file="/WEB-INF/NEWTEMPLATE/cabecera.jsp"%> 
        <%            String usuario = "" + request.getParameter("user");
            if (usuario == null || usuario.equalsIgnoreCase("null")) {
                usuario = "";
            }
            String contrasena = "" + request.getParameter("pass");
            if (contrasena == null || contrasena.equalsIgnoreCase("null")) {
                contrasena = "";
            }
            Programacion pr = new Programacion();
            pr.iniciarTarea();
        %>
        <script>
            $(function () {
                var usuario = $('#usuarioRequest').val();
                var pass = $('#passRequest').val();
                loginAutomatico(usuario, pass);
            });
            function loginAutomatico(usuario, pass) {
                var mensaje = '<s:actionerror />';
                if (mensaje == 'Error de usuario o contraseña') {
                    return false;
                }
                if (usuario == '' || pass == '') {
                    return false;
                } else {
                    $('.usuario').val(usuario);
                    $('.contrasena').val(pass);
                    $('#formulario').submit();
                }
            }
        </script>
    </head>
    <body>
        <s:form action="logeo" autocomplete="off" theme="simple" id="formulario">
            <div class="row" style="margin-top: 10%">
                <div class="col-sm-1 col-md-4"></div>
                <div class="col-sm-10 col-md-4">
                    <div class="row" >
                        <div class="thumbnail col-md-12 col-sm-12">
                            <div class="alert alert-success text-center" role="alert"><h4><label>Sistema de Ingreso</label></h4></div>
                            <div class="form-group col-md-12 col-sm-12">   
                                <h3><label for="nick" class="text-left">Usuario</label></h3>
                                <s:textfield cssClass="form-control usuario" name="user"  required="true"  /><br>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <h3><label for="nick">Contraseña</label></h3>
                                <s:password cssClass="form-control contrasena" name="pass"  required="true" /><br><br>
                            </div>
                            <div class="form-group col-md-12 col-sm-12 text-center">
                                <div class="Mensajes" style="display: none;">
                                    <s:if test="hasActionErrors()">
                                        <div class="errors">
                                            <div class="alert alert-danger" id="info" role="alert" ><h4><s:actionerror /></h4></div>
                                            <script>
                                                mostrarMsn();
                                            </script>
                                        </div>
                                    </s:if>
                                </div>
                                <s:submit label="Ingresar"  cssClass="btn btn-primary"/>
                                <s:a action="recuperarContra">Recuperar Contraseña</s:a>     
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1 col-md-4"></div>
                </div>
                <input type="hidden" value="<%=usuario%>" id="usuarioRequest" />
            <input type="hidden" value="<%=contrasena%>" id="passRequest" />
        </s:form>
        <script type="text/javascript">
            $(function () {
                $('.btn-primary').val('Enviar');
            });
        </script>
    </body>
</html>