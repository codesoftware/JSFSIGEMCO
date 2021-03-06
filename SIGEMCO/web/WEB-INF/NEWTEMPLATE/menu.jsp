<%@page import="co.com.hotel.datos.session.Usuario"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String permisos = usuario.getPermisos();
%>
<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" onclick="irInicio()">SIGEMCO</a>
    </div>
    <div class="navbar-collapse collapse">

        <!-- Left nav -->
        <ul class="nav navbar-nav">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;Administración</a>
                <ul class="dropdown-menu">
                    <%if (permisos.indexOf(".AdUs1.") >= 0 || permisos.indexOf(".AdUs2.") >= 0 || permisos.indexOf(".AdUs3.") >= 0 || permisos.indexOf(".AdUs4.") >= 0 || permisos.indexOf(".AdUs5.") >= 0) {%>
                    <li><a href="#">Usuarios</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".AdUs1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=111">Insertar</a></li>
                                <%}
                                    if (permisos.indexOf(".AdUs5.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=110">Consultar</a></li>
                                <%}
                                    if (permisos.indexOf(".AdUs3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=112">Modificar</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".AdPf1.") >= 0 || permisos.indexOf(".AdPf2.") >= 0 || permisos.indexOf(".AdPf3.") >= 0 || permisos.indexOf(".AdUs4.") >= 0) {%>
                    <li><a href="#">Perfiles</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".AdPf1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=121">Insertar</a></li>
                                <%}
                                    if (permisos.indexOf(".AdPf2.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=122">Modificar</a></li>
                                <%}
                                    if (permisos.indexOf(".AdPf3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=124">Consulta General</a></li>
                                <%}%>                                    
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".AdSe1.") >= 0 || permisos.indexOf(".AdSe2.") >= 0 || permisos.indexOf(".AdSe3.") >= 0 || permisos.indexOf(".AdSe4.") >= 0) {%>
                    <li><a href="#">Sedes</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".AdSe1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=141">Insertar</a></li>
                                <%}
                                    if (permisos.indexOf(".AdSe3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=144">Consulta General</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".AdEm1.") >= 0 || permisos.indexOf(".AdEm2.") >= 0) {%>
                    <li><a href="#">Empresa</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".AdEm1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=131">Información</a></li>
                                <%}
                                    if (permisos.indexOf(".AdEm2.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=132">Parametros Generales</a></li>
                                <%}
                                    if (permisos.indexOf(".AdEm3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=133">Logo</a></li>
                                <% }%>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </li>
            <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;Inventarios</a>
                <ul class="dropdown-menu">
                    <%if (permisos.indexOf(".InPr1.") >= 0 || permisos.indexOf(".InPr2.") >= 0 || permisos.indexOf(".InPr3.") >= 0 || permisos.indexOf(".InPr4.") >= 0 || permisos.indexOf(".InPr5.") >= 0) {%>
                    <li><a href="#">Productos</a>
                        <ul class="dropdown-menu">
                            <li><a href="reenvioGeneral.action?accion=217">Gesti&oacute;n</a></li>
                                <%if (permisos.indexOf(".InPr1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=214">Consultar</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr6.") >= 0) {%>
                            <li style="display:none"><a href="reenvioGeneral.action?accion=216">Parametrizacion Precios</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr2.") >= 0) {%>
                            <li style="display: none;"><a href="reenvioGeneral.action?accion=211">Adicionar Nuevo</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr3.") >= 0) {%>
                            <li style="display: none;"><a href="reenvioGeneral.action?accion=219">Adicionar Existente</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr4.") >= 0) {%>
                            <li style="display: none;"><a href="reenvioGeneral.action?accion=215">Inactivar Existente</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr5.") >= 0) {%>
                            <li style="display: none;"><a href="reenvioGeneral.action?accion=212">Actualizar Producto</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr9.") >= 0) {%>
                            <li style="display: none;"><a href="reenvioGeneral.action?accion=218">Cambio de Sede</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr10.") >= 0) {%>
                            <li style="display: none;"><a href="reenvioGeneral.action?accion=213">Correccion de Ingresos</a></li>
                                <%}%>
                        </ul>    
                    </li>
                    <%}
                        if (permisos.indexOf(".InSr1.") >= 0 || permisos.indexOf(".InSr2.") >= 0 || permisos.indexOf(".InSr3.") >= 0) {%>
                    <li><a href="#">Servicio</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InSr1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=224" >Consulta</a></li>
                                <%}
                                    if (permisos.indexOf(".InSr2.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=221">Adicionar Nuevo</a></li>
                                <%}
                                    if (permisos.indexOf(".InSr3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=225">Inactivar</a></li>
                                <%}
                                    if (permisos.indexOf(".InSr5.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=231">Parametrizaci&oacute;n de Precios</a></li>
                                <%}%>
                        </ul>
                    </li>                    
                    <%}%>
                    <%if (permisos.indexOf(".InRec1.") >= 0 || permisos.indexOf(".InRec2.") >= 0 || permisos.indexOf(".InRec4.") >= 0) {
                    %>                    
                    <li><a href="#">Recetas</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InRec1.") >= 0) {
                            %>                   
                            <li><a href="reenvioGeneral.action?accion=291">Creación</a></li>
                                <%}%>
                                <%if (permisos.indexOf(".InRec2.") >= 0) {
                                %>                   
                            <li><a href="reenvioGeneral.action?accion=292">Consulta General</a></li>
                                <%}%>
                                <%if (permisos.indexOf(".InRec4.") >= 0) {
                                %>                   
                            <li><a href="reenvioGeneral.action?accion=293">Precios</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}%>
                    <%if (permisos.indexOf(".InPr11.") >= 0) {
                    %>                    
                    <li><a href="#">Conteos</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InPr11.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=232">Creaci&oacute;n</a></li>
                                <%}%>
                                <%if (permisos.indexOf(".InPr11.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=233">Consulta</a></li>
                                <%}%>
                        </ul>
                    </li>

                    <%}
                        if (permisos.indexOf(".InMi1.") >= 0 || permisos.indexOf(".InMi2.") >= 0 || permisos.indexOf(".InMi3.") >= 0) {%>
                    <li><a href="#">Mov. Inventario</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InMi1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=241">Adicionar Mov Inventario</a></li>
                                <%}
                                    if (permisos.indexOf(".InMi2.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=242">Actualizar Mov Inventario </a></li>
                                <%}
                                    if (permisos.indexOf(".InMi3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=244">Consultar Movimientos </a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".InRef1.") >= 0 || permisos.indexOf(".InRef2.") >= 0 || permisos.indexOf(".InRef3.") >= 0) {%>
                    <li><a href="#"><s:i18n name="co.com.sigemco.alfa.archivos.MessagesBundleProducto" >
                                <s:text name="texto1" />
                            </s:i18n></a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InRef1.") >= 0) {%>

                            <li><a href="reenvioGeneral.action?accion=261">Adicionar </a></li>
                                <%}
                                    if (permisos.indexOf(".InRef3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=264">Consultar </a></li>
                                <%}%>
                        </ul>
                    </li>

                    <%}
                        if (permisos.indexOf(".InMarca1.") >= 0 || permisos.indexOf(".InMarca2.") >= 0 || permisos.indexOf(".InMarca3.") >= 0) {%>
                    <li><a href="#">Marcas</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InMarca1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=601">Adicionar</a></li>
                                <%}
                                    if (permisos.indexOf(".InMarca3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=604">Consultar</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}

                        if (permisos.indexOf(".InProved1.") >= 0 || permisos.indexOf(".InProved2.") >= 0 || permisos.indexOf(".InProved.") >= 0) {%>
                    <li><a href="#">Proveedores</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InProved1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=701">Adicionar</a></li>
                                <%}
                                    if (permisos.indexOf(".InProved3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=704">Consultar</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".InArqueo1.") >= 0 || permisos.indexOf(".InArqueo2.") >= 0 || permisos.indexOf(".InArqueo3.") >= 0) {%>
                    <li><a href="#">Arqueos</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InArqueo1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=801">Crear Arqueo</a></li>
                                <%}
                                    if (permisos.indexOf(".InArqueo3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=804">Consultar Arqueos</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".InCat1.") >= 0 || permisos.indexOf(".InCat2.") >= 0 || permisos.indexOf(".InCat3.") >= 0) {%>
                    <li><a href="#">Categorias</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InCat1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=271">Adicionar</a></li>
                                <%}
                                    if (permisos.indexOf(".InCat3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=274">Consultar</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}
                        if (permisos.indexOf(".InPr7.") >= 0 || permisos.indexOf(".InPr8.") >= 0) {%>
                    <li><a href="#"><s:i18n name="co.com.sigemco.alfa.archivos.MessagesBundleProducto" >
                                <s:text name="texto2" />
                            </s:i18n></a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".InPr7.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=251">Ingreso</a></li>
                                <%}
                                    if (permisos.indexOf(".InPr8.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=254">Consultas</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </li>
            <% if (permisos.indexOf(".FcCr1.") >= 0 || permisos.indexOf(".FcCr3.") >= 0) { %>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Facturación</a>
                <ul class="dropdown-menu">
                    <%if (permisos.indexOf(".FcCr1.") >= 0) {%>
                    <li><!--<a href="reenvioGeneral.action?accion=311">Crear </a>-->
                        <a href="/SAFC/">Crear</a>
                    </li>
                        <%}
                            if (permisos.indexOf(".FcCr3.") >= 0) {%>
                    <li style="display: none"><a href="reenvioGeneral.action?accion=312">Adición Serv. Y Productos Fac. Existente</a></li>
                        <%}%>
                    <li style="display: none"><a href="#">Cerrar Factura</a></li>
                        <% if (permisos.indexOf(".FcCr5.") >= 0) {%>
                    <li style="display: none"><a href="reenvioGeneral.action?accion=313">Cancelación de Facturas</a></li>
                        <%}%>
                        <% if (permisos.indexOf(".FcCr6.") >= 0) {%>
                    <li style="display: none"><a href="reenvioGeneral.action?accion=314">Pantalla Principal</a></li>
                        <%}%>
                </ul>
            </li>            
            <%}
                if (permisos.indexOf(".RpIn1.") >= 0 || permisos.indexOf(".RpUs1.") > 0 || permisos.indexOf(".RpIn2.") > 0 || permisos.indexOf(".RpIn3.") > 0) {%>
            <li><a href="#"><span class="glyphicon glyphicon-floppy-save"></span>&nbsp;Reportes</a>
                <ul class="dropdown-menu">
                    <% if (permisos.indexOf(".RpUs1.") > 0) {%>
                    <li><a href="#">Usuarios</a>
                        <ul class="dropdown-menu">
                            <li><a href="reenvioGeneral.action?accion=431">Activos</a></li>
                        </ul>
                    </li>
                    <%}%>
                    <% if (permisos.indexOf(".RpIn1.") > 0 || permisos.indexOf(".RpIn2.") > 0 || permisos.indexOf(".RpIn3.") > 0) {%>
                    <li><a href="#">Inventario</a>                        
                        <ul class="dropdown-menu">
                            <% if (permisos.indexOf(".RpIn1.") > 0) { %>
                            <li><a href="reenvioGeneral.action?accion=411">Promedio Ponderado</a></li>
                                <%}%>
                                <% if (permisos.indexOf(".RpIn2.") > 0 || permisos.indexOf(".RpIn3.") > 0) { %>
                            <li><a href="reenvioGeneral.action?accion=412">Reportes Basicos</a></li>
                                <%}%>

                        </ul>
                    </li>
                    <%}%>
                    <%  if (permisos.indexOf(".reGen1.") >= 0 || permisos.indexOf(".reGen2.") >= 0) {%>
                    <li><a href="#">Reportes</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".reGen1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=152">REPORTES GENERALES</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}%>
                    <%  if (permisos.indexOf(".cieDi1.") >= 0 || permisos.indexOf(".cieDi2.") >= 0) {%>
                    <li><a href="#">Cierres</a>
                        <ul class="dropdown-menu">
                            <%if (permisos.indexOf(".cieDi1.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=151">Cierre Diario</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </li>
            <%}%>
            <%if (permisos.indexOf(".CoPu1.") >= 0) {%>
            <li><a href="#"><span class="glyphicon glyphicon-book"></span>&nbsp;Contabilidad</a>
                <ul class="dropdown-menu">
                    <li><a href="#">PUC</a>
                        <ul class="dropdown-menu">
                            <% if (permisos.indexOf(".CoPu1.") > 0) {%>
                            <li><a href="reenvioGeneral.action?accion=514">Consulta General</a>                                
                            </li>
                            <%}%>                                
                        </ul>
                    </li>
                    <%if (permisos.indexOf(".InMCo3.") >= 0) {%>
                    <li><a href="#">Mov. Contable</a>
                        <ul class="dropdown-menu">

                            <%  if (permisos.indexOf(".InMCo3.") >= 0) {%>
                            <li><a href="reenvioGeneral.action?accion=294">Consulta</a></li>
                                <%}%>
                        </ul>
                    </li>
                    <%}%>
                </ul>
            </li>
            <%}%>
        </ul>

        <!-- Right nav -->
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" aria-label="Left Align" onclick="nuevoSigemco();">
                    <span class="glyphicon glyphicon-new-window" ></span>&nbsp;NSIGEMCO
                </a>             
            </li>
            <li><a href="logout.action" aria-label="Left Align">
                    <span class="glyphicon glyphicon-off" ></span>&nbsp;Salir
                </a>             
            </li>
        </ul>
    </div><!--/.nav-collapse -->
    <script>
        function irInicio() {
            location.href = RutaSitio + '/inicioAdmin.action';
        }
        function nuevoSigemco() {
            var igualPuerto = '<s:text name="nuevoSigemco.url"/>';
            var puerto = '';
            var ubicacion = location;
            var host = location.hostname;
            var aplication = '/NSIGEMCO/index.jsf';
            if (host == 'localhost') {
                if (igualPuerto == 'NO') {
                    puerto = '<s:text name="nuevoSigemco.puerto"/>';
                } else {
                    puerto = location.port;
                }
            } else {
                puerto = location.port;
            }
            $.ajax({
                url: RutaSitio + "/AJAX/JSP/ajaxCerrarSesion.jsp",
                dataType: 'json',
                cache: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    if (data.respuesta == 'Ok') {
                        var ruta = "http://" + host + ":" + puerto + aplication;
                        document.getElementById('redirectNewSigemco').action = ruta;
                        document.getElementById('redirectNewSigemco').submit();
                    } else {
                        alert('Imposible cerrar sesion para ir a nsigmeco por favor contacte al administrador');
                    }
                }
            });
        }
    </script>
    <form method="POST" action="<s:text name="nuevoSigemco.url"/>" id="redirectNewSigemco" >
        <input type="hidden" value="<%=usuario.getUsuario()%>" name="usuario"/>
    </form>
</div>