function filtrosReservaHabitacion() {
    $('#dialogoAddServProd').modal('hide');
    $('#dialogoFiltroReservServ').modal('show');
}

function buscaPosiblesReservasXFiltros() {
    var valida = validaConsultaServicios();
    if (valida) {
        $('#dialogoFiltroReservServ').modal('hide');
        ejecutarBusquedaReservaHab();
    }

}

function validaConsultaServicios() {
    var fecha = $('#fechaReserv').val();
    var pers = $('#numPersonasReserv').val();
    var numD = $('#numDiasReserv').val();
    $('#divError').hide('fast');
    if (fecha == '') {
        $('#divError').show('slow');
        $('#msgError').html('EL CAMPO FECHA NO PUEDE SER NULO');
        return false;
    } else if (pers == '') {
        $('#divError').show('slow');
        $('#msgError').html('EL CAMPO NUMERO DE PERSONAS NO PUEDE SER NULO');
        return false;
    } else if (numD == '') {
        $('#divError').show('slow');
        $('#msgError').html('EL CAMPO NUMERO DE DÍAS NO PUEDE SER NULO');
        return false;
    } else if (pers == '0') {
        $('#divError').show('slow');
        $('#msgError').html('EL CAMPO NUMERO DE PERSONAS NO PUEDE SER CERO');
        return false;
    } else if (numD == '0') {
        $('#divError').show('slow');
        $('#msgError').html('EL CAMPO NUMERO DE DÍAS NO PUEDE SER CERO');
        return false;
    }
    return true;
}

function ejecutarBusquedaReservaHab() {
    var datos = new Object();
    datos.fecha = $('#fechaReserv').val();
    datos.numPers = $('#numPersonasReserv').val();
    datos.numDias = $('#numDiasReserv').val();
    $.ajax({
        type: 'POST',
        dataType: 'json',
        data: datos,
        url: RutaSitio + "/AJAX/JSP/ajaxBuscaServiciosXFiltros.jsp",
        success: function (data, textStatus, jqXHR) {
            tabla = $('#tablaAddServ');
            if (data == null) {
                $('#informacionPopUp').modal('show');
                $('#msnInfo').html('NO EXISTEN HABITACIONES DISPONIBLES CON ESTOS CRITERIOS DE BUSQUEDA');
            } else {
                var cabecera = '<thead>' +
                        '<tr>' +
                        '<th>&nbsp; Opc &nbsp;</td>' +
                        '<th>&nbsp; Num Habit. &nbsp;</td>' +
                        '<th>&nbsp; Max Personas &nbsp;</td>' +
                        '<th>&nbsp; Min Personas &nbsp;</td>' +
                        '</tr>' +
                        '</thead>';
                tabla.children().remove();
                tabla.append(cabecera);
                $.each(data, function (index, obj) {
                    var numeroDias = $('#numDiasReserv').val();
                    var fechaRev = $('#fechaReserv').val();
                    var linea = '<tr>' +
                            '<td><input type=\"checkbox\" name=\"addServ\" class=\"servAdd\" value=\"' + obj.idHabitacion + '\" data-numdias=\"' + numeroDias + '\" data-fecha=\"' + fechaRev + '\" /></td>' +
                            '<td>' + obj.numHabi + '</td>' +
                            '<td>' + obj.numMaxPers + '</td>' +
                            '<td>' + obj.numMinPers + '</td>' +
                            '</tr>';
                    tabla.append(linea);
                });
                $('#consultaBusquedaServ').modal('show');
            }
        }
    });
}

function adicionaReservaFactura() {
    var servicios = document.getElementsByClassName('servAdd');
    var arrayServSelec = [];
    var j = 0;
    for (var i = 0; i < servicios.length; i++) {
        if (servicios[i].checked == true) {
            var datos = new Object();
            datos.dsha_dsha = servicios[i].value;
            datos.fecha = servicios[i].dataset.fecha;
            datos.numdias = servicios[i].dataset.numdias;
            arrayServSelec[j] = datos;
            j++;
        }
    }
    consultaDatosFacturacionServ(arrayServSelec);
}

function consultaDatosFacturacionServ(servicios) {
    for (var i = 0; i < servicios.length; i++) {
        var datos = new Object();
        datos.dsha_dsha = servicios[i].dsha_dsha;
        datos.cantidad = servicios[i].numdias;
        datos.fecha = servicios[i].fecha;
        $.ajax({
            url: RutaSitio + "/simulaDetalleServicioFactura.action",
            data: datos,
            dataType: 'json',
            async: false,
            success: function (data, textStatus, jqXHR) {
                if(data.respuesta == 'Ok'){
                    var fila = '';
                    fila = '<tr class=\"filaAddServ\">'+
                                '<td>'+data.Objeto.num_hab +
                                '</td>'+
                                '<td>'+data.Objeto.numDias +
                                '</td>'+
                                '<td>'+data.Objeto.precioUnidad + 
                                '</td>'+
                                '<td>$'+data.Objeto.precioTotal +
                                '</td>'+
                                '<td>$'+data.Objeto.ivaUnidad + 
                                '</td>'+
                                '<td>$'+data.Objeto.ivaTotal + 
                                '</td>'+                                
                                '<td>$'+data.Objeto.totalPagar +
                                '</td>'+                                                                                              
                                '<td><button type=\"button\" class=\"btn btn-danger elimnarFilaServ\" >'+
                                '<span class=\"glyphicon glyphicon-remove\" ></span> </button></td>'+
                                '<td style=\"display:none;\" >'+
                                '<input type=\"text\" class=\"reservUsua\" value=\"'+data.Objeto.num_hab+'\" data-dias=\"'+data.Objeto.numDias+'\" data-fecha=\"'+data.fechaReserv+'\" />' + 
                                '</td>'+
                           '</tr>';
                   $('#consultaBusquedaServ').modal('hide');
                   $('.serviciosEnLista').append(fila);
                }else{
                    $('#informacionPopUp').modal('show');
                    $('#consultaBusquedaServ').modal('hide');
                    $('#msnInfo').html('Error al crear la simulacion del costo de la reserva ya que la habitacion no tiene precio parametrizado');
                }
            }
        })
    }
}