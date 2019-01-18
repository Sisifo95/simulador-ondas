<%-- 
    Document   : index
    Created on : 21/07/2018, 13:19:13
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>


        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- shortcut icon -->
        <link href="https://www.espoch.edu.ec/images/favicon.png" rel="shortcut icon" type="image/vnd.microsoft.icon" />

        <!-- Bootstrap CSS -->

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/inicio.css" rel="stylesheet">

        <!-- fontawesome's CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>


        <title>SOE | Simulador de Ondas Espoch</title>

    </head>

    <body > 

        <main>
            <div id="headerwrap" >
                <div class="container"  >
                    <div class="row">
                        <div class="col-lg-12 ">
                            <h1>Simulador de ondas </h1>
                            <h2>Bienvenido </h2>
                            <div class="espacio">
                                <a href="#area"> <i class="fa fa-angle-down"></i> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <section id="area">
            <div class="container" style="margin-top: -70px;">
                <div class="row">
                    <div class="col-lg-12 col-lg-offset-2">
                        <div class="espacio">
                            <a href="#headerwrap"> <i class="fa fa-angle-up"></i> </a>
                        </div>
                        <br>
                        <h1 data-aos="zoom-in" data-aos-duration="1000" > Casos de ondas </h1>
                        <br>

                        <div class="card-group">
                            <div id="tarjeta1" class="card p-2 m-2 tarjeta rounded" data-aos="fade-up"  data-aos-duration="1000" >
                                <a href="controlador/controlador.jsp?opc=alambert">
                                    <br>
                                    <div class="card-body">
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-text ">D'Alambert caso infinito</h3>
                                    </div>
                                </a>
                            </div>

                            <div  id="tarjeta2" class="card p-2 m-2 tarjeta rounded" data-aos="fade-up" data-aos-duration="1000" >
                                <a href="controlador/controlador.jsp?opc=fourier">
                                    <br>
                                    <div class="card-body">
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-title">Fourier caso finito</h3>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="espacio">
                    <a href="#reportes"> <i class="fa fa-angle-down"></i> </a>
                </div>

            </div>
        </section>

        <section id="reportes">
            <div class="container" style="margin-top: -70px;">
                <div class="row">
                    <div class="col-lg-12 col-lg-offset-2">
                        <div class="espacio">
                            <a href="#area"> <i class="fa fa-angle-up" style="font-size: 34px;"></i> </a>
                        </div>
                        <br>
                        <h1 data-aos="zoom-in" data-aos-duration="1000" > Histórico </h1>
                        <br>

                        <div class="card-group">
                            <div id="tarjeta1" class="card p-2 m-2 tarjeta rounded" data-aos="fade-up"  data-aos-duration="1000" >
                                <a href="controlador/controlador.jsp?opc=ondasInfinito2D">
                                    <br>
                                    <div class="card-body">
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-text ">Ondas 2D</h3>
                                    </div>
                                </a>
                            </div>

                            <div  id="tarjeta2" class="card p-2 m-2 tarjeta rounded" data-aos="fade-up" data-aos-duration="1000" >
                                <a href="controlador/controlador.jsp?opc=ondasFinito3D">
                                    <br>
                                    <div class="card-body">
                                    </div>
                                    <div class="card-body">
                                        <h3 class="card-title">Ondas 3D</h3>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer container row text-center" >
                    <div class="col-3"></div>
                    <div class="col-6" style="font-size: 12px;">
                        <hr>
                        <i style="font-size: 10px;color: #000;" class="fa fa-map-marker" aria-hidden="true"></i> Panamericana Sur km 1&#189;, Riobamba, Chimborazo, Ecuador &nbsp;&nbsp;|&nbsp;&nbsp; EC060155
                        <br>
                        <i class="fa fa-phone" style="font-size: 10px;color: #000;"></i> 593 (03) 2998-200 &nbsp;&nbsp;|&nbsp;&nbsp; <i class="fa fa-print" style="font-size: 10px;color: #000;"></i> (03) 2317-001
                    </div>
                    <div class="col-4"></div>
                </div>

            </div>
        </section>


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

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

        <script type="text/javascript">

            AOS.init();

            $('a[href^="#"]').on('click', function (event) {
                var target = $(this.getAttribute('href'));
                if (target.length) {
                    event.preventDefault();
                    $('html, body').stop().animate({
                        scrollTop: target.offset().top
                    }, 1000);
                }
            });

            $(window).on('load', function () {
                $("#preloader").delay(600).fadeOut();
            });


        </script>


    </body>
</html>




