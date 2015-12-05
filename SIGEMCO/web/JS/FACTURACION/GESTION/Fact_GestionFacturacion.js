$(function () {
    $('#sevicioAdd').click(function () {
        filtrosReservaHabitacion();
    });
    $('.input-group.date').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true
    });
    $('#buscarPosibleReservHab').click(function () {
        buscaPosiblesReservasXFiltros();
    });
    $('#productoAdd').click(function () {
        filtrosProductos();
    });
    $('#buscaPosiblesProd').click(function () {
        buscaPosiblesProductos();
    });
    $('#confirmarReserva').click(function () {
        adicionaReservaFactura()
    });
    $(document).on('click', '.elimnarFilaServ', function () {
        $(this).closest('.filaAddServ').remove();
    });
});

/**
 * Funcion la cual se activa al dar click sobre el boton de agregar.
 * @returns {undefined}
 */
function agregar() {
    $('#dialogoAddServProd').modal('show');
}


function sumaValoresTotales() {
    var iva = $('.vlrIvatotal');
    var sumaIva = 0;
    $.each(iva, function (index, value) {
        var aux = parseFloat(value.value);
        sumaIva += aux;
    });
    $('#sumivaTotalFactura').html(sumaIva);
    var prodTot = $('.vlrProdtotal');
    var sumaTotal = 0;
    $.each(prodTot, function (index, value) {
        var aux = parseFloat(value.value);
        sumaTotal += aux;
    });
    $('#sumprodTotalFactura').html(sumaTotal);
    var total = $('.vlrTotalPagar');
    var sumaTotalAPagar = 0;
    $.each(total, function (index, value) {
        var aux = parseFloat(value.value);
        sumaTotalAPagar += aux;
    });
    $('#sumtotalAPagar').html(sumaTotalAPagar);

}

//Funcion con la cual se factura completo
function generarFactura() {
    var servicios = document.getElementsByClassName('reservUsua');
    var datos = '[';
    for (var i = 0; i < servicios.length; i++) {
        var id = servicios[i].value;
        var fecha = servicios[i].dataset.dias;
        var dias = servicios[i].dataset.dias;
        if (i != 0) {
            datos += ',{';
        } else {
            datos += '{';
        }
        datos += " \"id\" : \"" + id + "\",";
        datos += " \"fecha\" : \"" + fecha + "\",";
        datos += " \"dias\" : \"" + dias + "\" ";
        datos += '}';
    }
    datos += "]";
    $('#serviceJson').val(datos);
    
    //Adicion de productos
    var productos = document.getElementsByClassName('listaProductos');
    var datosProd = '[';
    for (var i = 0; i < productos.length; i++) {
        var id = productos[i].value;
        var cantidad = productos[i].dataset.cantidad;
        if (i != 0) {
            datosProd += ',{';
        } else {
            datosProd += '{';
        }
        datosProd += " \"id\" : \"" + id + "\",";
        datosProd += " \"cantidad\" : \"" + cantidad + "\" ";
        datosProd += '}';
    }
    datosProd += "]";
    $('#productJson').val(datosProd);
}