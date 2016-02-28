$(function () {
    $('#btnAceptar').click(function(){
        
    });
});

function clickAceptar(){
    var clave = $('#segundaClave').val();
    $('#claveUsuario').val(clave);
    document.getElementById("adm_updPermisos").action = 'adm_updPermisosCont';
    document.getElementById("adm_updPermisos").submit();
}

function consultar() {
    document.getElementById("formConsultaPerfil").submit();
}
function permisoPerfil(valor) {
    document.getElementById("linkPerfil").value = valor;
    document.getElementById("adm_updPermisos").submit();
}

function permisoPerfilClave(valor) {
    document.getElementById("linkPerfil").value = valor;
    $('#textoMsn').html('Por favor digite su segunda clave <input type=\"password\" style=\"form-control\" id=\"segundaClave\" />');
    $('#mensaje').modal('show');
}