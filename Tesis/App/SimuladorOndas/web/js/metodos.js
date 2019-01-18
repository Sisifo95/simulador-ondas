//obtener dimensión del contenedor
var areaH = document.getElementById('areaCan').offsetHeight;
var areaW = document.getElementById('areaCan').offsetWidth;

//asignar dimensión al canvas
var area = document.getElementById('areaTrabajo');
area.width = areaW;
area.height = areaH;

//inicializar el canvas
var canvas = document.getElementById('areaTrabajo').getContext('2d');
var w = document.getElementById('areaTrabajo').offsetWidth;
var h = document.getElementById('areaTrabajo').offsetHeight;
var g = 0;
//variables globales
var t = 0, animacion = null;

function drawFourier3D() {
    try {
        var onda = new fourier3D();
        canvas.clearRect(0, 0, w, h);
        onda.encenderSuperficie(t);
        validarGuardar(3);
        t += 0.05;
        g += 1;
        animacion = requestAnimationFrame(drawFourier3D);
    } catch (error) {
        $("input").prop('disabled', false);
        swal({
            title: "Fourier 3D",
            text: "Error de sintáxis en las ecuaciones",
            icon: "error"
        });
    }
}

function drawFourier2D() {
    try {
        var onda = new fourier2D();
        canvas.clearRect(0, 0, w, h);
        onda.encenderOnda2D(t);
        validarGuardar(2);
        t += 0.05;
        g += 1;
        animacion = requestAnimationFrame(drawFourier2D);
    } catch (error) {
        $("input").prop('disabled', false);
        swal({
            title: "Fourier 2D",
            text: "Error de sintáxis en las ecuaciones",
            icon: "error"
        });
    }
}

function drawAlambert2D() {
    try {
        var onda = new alambert2D();
        canvas.clearRect(0, 0, w, h);
        onda.encenderOnda2D(t);
        validarGuardar(1);
        t += 0.025;
        g += 1;
        animacion = requestAnimationFrame(drawAlambert2D);
    } catch (error) {
        $("input").prop('disabled', false);
        swal({
            title: "D'Alambert 2D",
            text: "Error de sintáxis en las ecuaciones",
            icon: "error"
        });
    }

}

function guardarOnda3DFourier() {
    if (g == 0) {
        $.ajax({
            type: "GET",
            url: "../controlador/controlador.jsp?opc=guardarOnda",
            dataType: "text",
            data: $("#frmOnda").serialize()
        });
        $("input").prop('disabled', true);
    }

}

function guardarOnda2DFourier() {
    if (g == 0) {
        $.ajax({
            type: "GET",
            url: "../controlador/controlador.jsp?opc=guardarOnda",
            dataType: "text",
            data: $("#frmOnda").serialize()
        });
        $("input").prop('disabled', true);
    }
}

function guardarOnda2DAlambert() {
    if (g == 0) {
        $.ajax({
            type: "GET",
            url: "../controlador/controlador.jsp?opc=guardarOnda",
            dataType: "text",
            data: $("#frmOnda").serialize()
        });
        $("input").prop('disabled', true);
    }

}

function generarFourier() {
    var num = validarCamposRequeridos();
    cancelAnimationFrame(animacion);
    var dimension_onda = $('input[name=dimensionInput]:checked', '#frmOnda').val();
    if (dimension_onda === '2D' && num === 4) {
        t = 0;
        g = 0;
        drawFourier2D();
    } else if (dimension_onda === '3D' && num === 4) {
        t = 0;
        g = 0;
        drawFourier3D();
    }
}

function generarAlambert() {
    var num = validarCamposRequeridos();
    cancelAnimationFrame(animacion);
    if (num === 4) {
        t = 0;
        g = 0;
        drawAlambert2D();
    }
}

function detener() {
    cancelAnimationFrame(animacion);
    $("input").prop('disabled', false);
}

function validarGuardar(opc) {
    var cElas = $('#coeficiente').val();
    var valPos = $('#posicionInput').val();
    var valVel = $('#velocidadInput').val();
    if (cElas !== "" && valPos !== "" && valVel !== "") {

        switch (opc) {
            case 1:
                guardarOnda2DAlambert();
                break;
            case 2:
                guardarOnda2DFourier();
                break;
            case 3:
                guardarOnda3DFourier();
        }
    }
}