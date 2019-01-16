<%-- 
    Document   : fourier
    Created on : 21/07/2018, 13:20:41
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>


        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- shortcut icon -->
        <link href="https://www.espoch.edu.ec/images/favicon.png" rel="shortcut icon" type="image/vnd.microsoft.icon" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css" >
        <link href="../css/estilos.css" rel="stylesheet" type="text/css"/>

        <!-- fontawesome's CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">

        <script src="../js/math.min.js"></script>

        <title>SOE | Simulador de Ondas Espoch</title>
    </head>

    <body >

        <header>
            <nav class="nav navbar navbar-dark bg-inverse navbar-top navbar-fixed-top" role="navigation">
                <div class="d-inline-block sello_espoch_image" onClick="window.location.href = 'https://www.espoch.edu.ec/'">
                </div>
                <div class="navbar-brand name px-3 mx-1 titulo text-uppercase" onClick="window.location.href = '../controlador/controlador.jsp?opc=index'">
                    Simulador de Ondas
                </div>
                <div class="mx-auto float-xs-right" >
                    <a id="menuVertical" target="_blank" href="../manuales/manualUsuario.pdf" class="nav-link" style="margin-top: 0rem;">
                        <i class="fa fa-question-circle "></i>
                    </a>
                </div>
            </nav>
        </header>

        <!-- modal informacion -->
        <div class="modal fade" id="modalInfo" tabindex="-1" role="dialog" aria-labelledby="modalInfo" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-uppercase" id="modalInfo">Modelo matemático</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs mt-1 mb-3" style="height: 43px" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">2D</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">3D</a>
                            </li>
                        </ul>

                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h5>Condiciones Iniciales</h5>
                                <img src="../images/ciF.png">
                                <h5>Formula Fourier en 2D</h5>
                                <img src="../images/ff2.png" width="90%">
                                <h5>Elasticidad</h5>
                                <p class="text-justify">Se denomina elasticidad a la propiedad mecánica de ciertos materiales de sufrir deformaciones reversibles cuando se encuentran sujetos a la acción de fuerzas exteriores y de recuperar la forma original si estas fuerzas exteriores se eliminan.</p>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h5>Condiciones Iniciales</h5>
                                <img src="../images/cf3.png">
                                <h5>Formula Fourier en 3D</h5>
                                <img src="../images/ff3.png" width="90%">
                                <h5>Elasticidad</h5>
                                <p class="text-justify">Se denomina elasticidad a la propiedad mecánica de ciertos materiales de sufrir deformaciones reversibles cuando se encuentran sujetos a la acción de fuerzas exteriores y de recuperar la forma original si estas fuerzas exteriores se eliminan.</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>

        <main>
            <div class="container-full">
                <div class="row contenido">
                    <div class="col-10 menu " >
                        <h5 class=" my-2 mx-4 text-white text-uppercase"> Fourier caso finito </h5>  
                    </div>
                    <div class="col-2 menu" style="cursor: pointer" >
                        <h5><a data-toggle="modal" data-target="#modalInfo" class="badge my-2 mx-3 float-right text-white text-uppercase" ><i class="fas fa-info-circle"></i>&nbsp Información </a></h5>
                    </div>

                    <div class="col espacio"></div>
                    <div class="col-12">
                        <div class="row lienzo my-xs-4">
                            <div class="col-xl-3  panel text-justify text-white " >
                                <ul class="nav nav-tabs mt-1 mb-3" style="height: 43px; cursor: pointer" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active 2D" id="home-tab" data-toggle="tab" role="tab" aria-controls="home" aria-selected="true">2D</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link 3D" id="profile-tab" data-toggle="tab" role="tab" aria-controls="profile" aria-selected="false">3D</a>
                                    </li>
                                </ul>
                                <form id="frmOnda" action="../controlador/controlador.jsp?opc=guardarOnda" method="POST">
                                    <input checked required class="form-check-input" style="display: none" type="radio" name="dimensionInput" value="2D">
                                    <input type="hidden" value="finito" class="form-control " name="casoInput" id="caso" >
                                    <div class="form-group pt-1 text-center text-white">
                                        <label for=""> <h5>PANEL DE CONTROL</h5> </label>
                                    </div>
                                    <div class="form-group mx-2 nodo" style="margin-top: -20px;display: none" >
                                        <label data-toggle="tooltip" data-placement="right" title="Nodos de animación" for="radioDimension">Nodo &nbsp; <i class="fas fa-info-circle"></i></label>
                                        <select required class="form-control"id="nodo" style="cursor: pointer" >
                                            <option value="0">n=1 - m=1</option>
                                            <option value="1">n=1 - m=2</option>
                                            <option value="2">n=2 - m=1</option>
                                            <option value="3">n=2 - m=2</option>
                                            <option value="4">n=1 - m=3</option>
                                            <option value="5">n=3 - m=1</option>
                                            <option value="6">n=3 - m=2</option>
                                        </select> 
                                    </div>
                                    <div  class="form-group mx-2">
                                        <label data-toggle="tooltip" data-placement="right" title="Solo números de 0 a 3" for="coeficiente">Coeficiente de elasticidad &nbsp; <i class="fas fa-info-circle"></i></label>
                                        <input type="text" class="form-control coeficiente" value="1" name="coeficienteInput" id="coeficiente" onclick="validarNumeros()" onblur="rangoCoefiElas()" >
                                    </div>
                                    <div class="form-group mx-2 " id="posIni" >
                                        <label data-toggle="tooltip" data-placement="right" title="Expresión matemática de la forma F(x) para 2D Y F(x,y) para 3D" for="">Posición inicial &nbsp; <i class="fas fa-info-circle"></i> </label>
                                        <input type="text" id="posicionInput" value="x" name="posicionInput"  class="form-control">
                                    </div>
                                    <div data-toggle="modal" class="form-group mx-2 " id="velIni">
                                        <label data-toggle="tooltip" data-placement="right" title="Expresión matemática de la forma F(x) para 2D Y F(x,y) para 3D">Velocidad inicial &nbsp; <i class="fas fa-info-circle"></i> </label>
                                        <input type="text" id="velocidadInput" value="x" name="velocidadInput"  class="form-control">
                                    </div>
                                    <div>
                                        <button type="button" onclick="generarFourier()" class="ml-5 btn btn-primary" >Graficar</button>
                                        <button type="button" onclick="detener()" class=" ml-2 btn btn-primary" >Detener</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-12  col-sm-12 col-md-9 area" id="areaCan">
                                <img id="carga" class="img-fluid rounded mx-auto" width="50%" src="../images/gif.gif" style="margin: auto;display: none" >
                                <canvas id='areaTrabajo'></canvas>                       
                            </div>        
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="d-none d-xl-block">
            <div class="row text-center">
                <div class="col-3"></div>
                <div class="col-6">
                    <hr>
                    <i class="fa fa-map-marker" aria-hidden="true"></i> Panamericana Sur km 1 &#189;, Riobamba, Chimborazo, Ecuador &nbsp;&nbsp;|&nbsp;&nbsp; EC060155
                    <br>
                    <i class="fa fa-phone"></i> 593 (03) 2998-200 &nbsp;&nbsp;|&nbsp;&nbsp; <i class="fa fa-print"></i> (03) 2317-001
                </div>
                <div class="col-4"></div>
            </div>
        </footer>

        <!-- Preloader -->
        <div id="preloader">
            <div class="preloader">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
        <!-- /Preloader -->

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <script src="../js/popper.min.js" ></script>
        <script src="../js/bootstrap.min.js" ></script>
        <script src="../js/simulador.js" ></script>
        <script src="../js/clases.js" ></script>
        <script src="../js/metodos.js" ></script>
        <script src="../js/sweetalert.min.js"></script>
        <script type="text/javascript">

                                            $(function () {
                                                $('[data-toggle="tooltip"]').tooltip()
                                            });

                                            $(window).on('load', function () {
                                                $("#preloader").delay(600).fadeOut();
                                            });

                                            $(".3D").click(function () {
                                                $(".nodo").css("display", "block");
                                                var dimension_onda = $('input[name=dimensionInput]:checked', '#frmOnda').val("3D");
                                            });

                                            $(".2D").click(function () {
                                                $(".nodo").css("display", "none");
                                                var dimension_onda = $('input[name=dimensionInput]:checked', '#frmOnda').val("2D");

                                            });
        </script>
    </script>
</body>
</html>
