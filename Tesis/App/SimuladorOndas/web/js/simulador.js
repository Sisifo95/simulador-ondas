//validaciones
function rangoCoefiElas() {

    var num = document.getElementById('coeficiente').value;
    if (isNaN(num)) {
        swal({
            title: "Coeficiente de elasticidad",
            text: "Solo números del 0 a 3",
            icon: "error"
        });
        document.getElementById('coeficiente').value = "";
    } else {
        if (parseFloat(num) < 0 || parseFloat(num) > 3) {
            swal({
                title: "Coeficiente de elasticidad",
                text: "Solo números del 0 a 3",
                icon: "error",
            });
            document.getElementById('coeficiente').value = "";
        }
    }
}

function validarCamposRequeridos() {

    var coeficiente = $('#coeficiente').val();
    var posicion_inicial = $('#posicionInput').val();
    var velocidad_inicial = $('#velocidadInput').val();
    var dimension_onda = $('input[name=dimensionInput]:checked', '#frmOnda').val();
    var num = 0;
    if (coeficiente.length > 0) {
        num += 1;
        if (posicion_inicial.length > 0) {
            num += 1;
            if (velocidad_inicial.length > 0) {
                num += 1;
                if (dimension_onda == '2D' || dimension_onda == '3D') {
                    num += 1;
                } else {
                    swal({
                        title: "Dimensión",
                        text: "Seleccione una dimensión para la onda",
                        icon: "error"
                    });
                }
            } else {
                swal({
                    title: "Velocidad inicial",
                    text: "Ingrese un valor para la velocidad inicial",
                    icon: "error"
                });
            }
        } else {
            swal({
                title: "Posición inicial",
                text: "Ingrese un valor para la posición inicial",
                icon: "error"
            });
        }
    } else {
        swal({
            title: "Coeficiente de elasticidad",
            text: "Ingrese un valor para el coeficiente de elasticidad",
            icon: "error"
        });
    }
    if (num !== 4) {
        $("input").prop('disable', false);
    } 
    return num;
}

