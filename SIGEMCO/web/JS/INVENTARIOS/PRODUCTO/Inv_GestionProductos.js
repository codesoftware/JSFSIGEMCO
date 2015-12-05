var accion = '';

$(function(){
    $('#botonAceptar').on('click', function (){
        if(accion == 'adicionarProducto'){
            var codigo = $('#codigoProd').val();
            $('#codAddProdExist').val(codigo);
            $('#inv_consProdForAddEx').submit();
        }else if(accion == 'cambioSede'){
            var codigo = $('#codigoProd').val();
            $('#codigoProdCambioSede').val(codigo);
            $('#inv_ConsProdCambioSede').submit();
        }else if(accion == 'correccionIngresos'){
            var codigo = $('#codigoProd').val();
            $('#codigoProdCorrigeIng').val(codigo);
            $('#inv_ConsProdCorrIngresos').submit();
        }
        
    });
});

function adicionaProductoExistente(){
    accion='adicionarProducto';
    var inputCodigo = document.createElement("INPUT");
    inputCodigo.setAttribute('type', 'text');
    inputCodigo.setAttribute('class', 'form-control');
    inputCodigo.setAttribute('id','codigoProd');
    $('#textoMsn').html('Por Favor Digite el codigo del producto al cual le desea hacer la adicion de los productos');
    $('#textoMsn').append(inputCodigo);
    $('#mensaje').modal('show');
}

function cambioSedeProducto(){
    accion='cambioSede';
    var inputCodigo = document.createElement("INPUT");
    inputCodigo.setAttribute('type', 'text');
    inputCodigo.setAttribute('class', 'form-control');
    inputCodigo.setAttribute('id','codigoProd');
    $('#textoMsn').html('Por Favor Digite el codigo del producto al cual le desea hacer el cambio de sede');
    $('#textoMsn').append(inputCodigo);
    $('#mensaje').modal('show');    
}

function correccionIngresos(){
    accion='correccionIngresos';
    var inputCodigo = document.createElement("INPUT");
    inputCodigo.setAttribute('type', 'text');
    inputCodigo.setAttribute('class', 'form-control');
    inputCodigo.setAttribute('id','codigoProd');
    $('#textoMsn').html('Por Favor Digite el codigo del producto al cual desea corregirle los ingresos');
    $('#textoMsn').append(inputCodigo);
    $('#mensaje').modal('show');        
}