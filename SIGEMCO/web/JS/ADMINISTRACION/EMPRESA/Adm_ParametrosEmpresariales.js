function cleanForm() {
    document.getElementById("adm_updtParaEmp_empresa_nombre").value = '';
    document.getElementById("adm_updtParaEmp_empresa_nit").value = '';
    document.getElementById("adm_updtParaEmp_empresa_direccion").value = '';
    document.getElementById("adm_updtParaEmp_empresa_telefono").value = '';
    document.getElementById("adm_updtParaEmp_empresa_ciudad").value = '';
    document.getElementById("adm_updtParaEmp_empresa_resolucion").value = '';
}

function ingresarParametros() {
    document.getElementById("adm_updtParaEmp").submit();
}

function cambioDepartamento(valor) {
    var datos = new Object();
    datos.idDepa = valor;
    $.ajax({
        url: RutaSitio + '/buscaCiudades.action',
        data: datos,
        cache: false,
        dataType: 'json',
        async: false,
        success: function (data, textStatus, jqXHR) {
            $("#selectCiudad").html('');
            var ciudad = document.getElementById('selectCiudad');
            var option = new Option("SELECCIONE UNA CIUDAD", "-1");
            ciudad.options[0] = option;
            for (var i = 0; i < data.objeto.length; i++) {
                var value = data.objeto[i].nombre;
                var idOption = data.objeto[i].id
                var option = new Option(value, idOption);
                ciudad.options[i + 1] = option;
            }
        }
    });
}