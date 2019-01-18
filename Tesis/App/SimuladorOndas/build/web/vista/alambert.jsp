<%-- 
    Document   : alambert
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

        <!-- Modal información-->
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
                        <h5>Condiciones Iniciales</h5>
                        <img src="../images/ciA.png">
                        <h5>Formula D'Alambert   en 2D</h5>
                        <img src="../images/fa.png" width="90%">
                        <h5>Elasticidad</h5>
                        <p class="text-justify">Se denomina elasticidad a la propiedad mecánica de ciertos materiales de sufrir deformaciones reversibles cuando se encuentran sujetos a la acción de fuerzas exteriores y de recuperar la forma original si estas fuerzas exteriores se eliminan.</p>

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
                        <h5 class=" my-2 mx-4 text-white text-uppercase"> D'Alambert caso infinito </h5>    
                    </div>
                    <div class="col-2 menu" style="cursor: pointer" >
                        <h5><a data-toggle="modal" data-target="#modalInfo" class="badge my-2 mx-3 float-right text-white text-uppercase" ><i class="fas fa-info-circle"></i>&nbsp Información </a></h5>
                    </div>

                    <div class="col espacio"></div>
                    <div class="col-12">
                        <div class="row lienzo my-xs-4">
                            <div class="col-xl-3  panel text-justify text-white " >
                                <form id="frmOnda" action="../controlador/controlador.jsp?opc=guardarOnda" method="POST">
                                    <input type="hidden" value="infinito" class="form-control " name="casoInput" id="caso" >
                                    <div class="form-group pt-5 text-center text-white">
                                        <label for=""> <h5>PANEL DE CONTROL</h5> </label>
                                    </div>
                                    <div  class="form-group mx-2">
                                        <label data-toggle="tooltip" data-placement="right" title="Solo números de 0 a 3" for="coeficiente">Coeficiente de elasticidad &nbsp; <i class="fas fa-info-circle"></i></label>
                                        <input type="text" class="form-control coeficiente" value="1" name="coeficienteInput" id="coeficiente" onclick="validarNumeros()" onblur="rangoCoefiElas()" >
                                    </div>
                                    <div class="form-group mx-2 " id="posIni">
                                        <label data-toggle="tooltip" data-placement="right" title="Expresión matemática de la forma F(x)" for="">Posición inicial &nbsp; <i class="fas fa-info-circle"></i> </label>
                                        <input type="text" value="cos(x^2)" id="posicionInput" name="posicionInput" class="form-control">
                                    </div>
                                    <div class="form-group mx-2 " id="velIni">
                                        <label data-toggle="tooltip" data-placement="right" title="Expresión matemática de la forma F(x)">Velocidad inicial &nbsp; <i class="fas fa-info-circle"></i> </label>
                                        <input type="text" value="0" id="velocidadInput" name="velocidadInput" class="form-control">
                                    </div>
                                    <div class="form-group mx-2">
                                        <label data-toggle="tooltip" data-placement="right" title="Eliga la dimensión de la onda"for="radioDimension">Dimensión &nbsp; <i class="fas fa-info-circle"></i></label>
                                        <div class="row mx-2"> 
                                            <div class="col-4">
                                                <input checked required class="form-check-input" type="radio" name="dimensionInput" value="2D">
                                                <label class="form-check-label" >
                                                    2D  
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <button type="button" onclick="generarAlambert()" class="ml-5 btn btn-primary" >Graficar</button>
                                        <button type="button" onclick="detener()" class=" ml-2 btn btn-primary" >Detener</button>
                                    </div>

                                </form>
                            </div>
                            <div class="col-12  col-sm-12 col-md-9 area" id="areaCan">
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
        </script>
    </body>
</html>
