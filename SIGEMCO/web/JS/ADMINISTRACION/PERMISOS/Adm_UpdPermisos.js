$(function() {
    $("#admUsu").click(function() {
        $(".subPermisoAdmUsu").toggle("slow");
    });
    $("#admPerf").click(function() {
        $(".subPermisoAdmPerf").toggle("slow");
    });
    $("#InvPr").click(function() {
        $(".subPermisoInvPro").toggle("slow");
    });
    $("#InServ").click(function() {
        $(".subPermisoInvServ").toggle("slow");
    });
    $("#FacCrea").click(function() {
        $(".subPermisoFacCrea").toggle("slow");
    });
    $("#RepInv").click(function() {
        $(".subPermisoRepInv").toggle("slow");
    });
    $("#RepInv").click(function() {
        $(".subPermisoCierreD").toggle("slow");
    });
    $("#RepInv").click(function() {
        $(".subPermisoReportesGenerales").toggle("slow");
    });
    $("#admEmp").click(function() {
        $(".subPermisoAdmEmp").toggle("slow");
    });
    $("#InMvInv").click(function() {
        $(".subPermisoInvMvInv").toggle("slow");
    });
    $("#InMvCon").click(function() {
        $(".subPermisoInvMvCon").toggle("slow");
    });
    $("#admSedes").click(function() {
        $(".subPermisoAdmSedes").toggle("slow");
    });
    $("#InRefe").click(function() {
        $(".subPermisoInRefe").toggle("slow");
    });
    $("#InMarca").click(function() {
        $(".subPermisoInMarca").toggle("slow");
    });
    $("#InProved").click(function() {
        $(".subPermisoInProved").toggle("slow");
    });
    $("#InArqueos").click(function() {
        $(".subPermisoInArqueos").toggle("slow");
    });
    $("#RepUsua").click(function() {
        $(".subPermisoRepUsua").toggle("slow");
    });
    $("#InRec").click(function() {
        $(".subPermisoInRec").toggle("slow");
    });
     $("#InRec").click(function() {
        $(".subPermisoNotificaciones").toggle("slow");
    });
});

function actualizar() {
    var permisos = concatenaPermisos();
    if (permisos == '') {
        abrirDialogoInfo('Por Favor elija al menos un permiso');
    } else {
        document.getElementsByClassName('permisos')[0].value = permisos;
        document.getElementById("Adm_UpdPermPerf").submit();
    }
}

function concatenaPermisos() {
    var formulario = document.getElementById("Adm_UpdPermPerf");
    var tam = formulario.length;
    var permisos = '';
    for (var i = 0; i < tam; i++) {
        var obj = formulario[i].type;
        if (obj == 'checkbox') {
            var check = formulario[i];
            if (check.checked == true) {
                permisos += '.' + check.value + '.';
            }
        }
    }
    return permisos;
}

function postDialogAc(accion, dialog) {
    if (accion == 'informacion') {
        $(dialog).dialog('close');
    }
}

function mostrarPermisos(valor) {
    var vector = valor.split('..');
    var admin = valor.indexOf('AdUs');
    if (admin > 0) {
        $(".subPermisoAdmUsu").show("slow");
    }
    var perfil = valor.indexOf('AdPf');
    if (perfil > 0) {
        $(".subPermisoAdmPerf").show("slow");
    }
    var producto = valor.indexOf('InPr');
    if (producto > 0) {
        $(".subPermisoInvPro").show("slow");
    }
    var servicio = valor.indexOf('InSr');
    if (servicio > 0) {
        $(".subPermisoInvServ").show("slow");
    }
    var movInv = valor.indexOf('InMi');
    if (movInv > 0) {
        $(".subPermisoInvMvInv").show("slow");
    }
    var facturacion = valor.indexOf('FcCr');
    if (facturacion > 0) {
        $(".subPermisoFacCrea").show("slow");
    }
    var reportes = valor.indexOf('RpIn');
    if (reportes > 0) {
        $(".subPermisoRepInv").show("slow");
    }
    var reportes = valor.indexOf('cieDi1');
    if (reportes > 0) {
        $(".subPermisoCierreD").show("slow");
    }
    var reportesg = valor.indexOf('reGen1');
    if (reportesg > 0) {
        $(".subPermisoReportesGenerales").show("slow");
    }
    
    var empresa = valor.indexOf('AdEm');
    if (empresa > 0) {
        $(".subPermisoAdmEmp").show("slow");
    }
    var sedes = valor.indexOf('AdSe');
    if (sedes > 0) {
        $(".subPermisoAdmSedes").show("slow");
    }
    var referencias = valor.indexOf('InRef');
    if (referencias > 0) {
        $(".subPermisoInRefe").show("slow");
    }
    var marcas = valor.indexOf('InMarca');
    if(marcas > 0){
         $(".subPermisoInMarca").show("slow");
    }
    var proved = valor.indexOf('InProved');
    if(proved > 0){
         $(".subPermisoInProved").show("slow");
    }
    var arqueos = valor.indexOf('InArqueos');
    if(arqueos > 0){
         $(".subPermisoInArqueos").show("slow");
    }
    var repUsua = valor.indexOf('RpUs');
    if (repUsua > 0) {
        $(".subPermisoRepUsua").show("slow");
    }
     var notCorr = valor.indexOf('notGen');
     if (notCorr > 0) {
        $(".subPermisoNotificaciones").show("slow");
    }
    var movCont = valor.indexOf('InMCo');
    if (movCont > 0) {
        $(".subPermisoInvMvCon").show("slow");
    }
    var arqueos = valor.indexOf('InArqueo');
    if (arqueos > 0) {
        $(".subPermisoInArqueos").show("slow");
    }
    var recetas = valor.indexOf('InRec');
    if (recetas > 0) {
        $(".subPermisoInRec").show("slow");
    }
    cargarPermisos(vector);
}

function cargarPermisos(vector) {
    for (var i = 0; i < vector.length; i++) {
        var aux = vector[i].replace('.', '');
        document.getElementById(aux).checked = 'true';
    }
}