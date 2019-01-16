<%-- 
    Document   : fourier
    Created on : 21/07/2018, 13:21:14
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

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/error.css" rel="stylesheet">

        <!-- fontawesome's CSS -->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>


        <title>SOE | Simulador de Ondas Espoch</title>

    </head>
    
    <body > 
        <main>
            <div class="container">
                <div class="row imagen">
                    <div class="col mx-auto py-2">
                        <img src="../images/cara.png" height="200px" alt="" class="mx-auto d-flex justify-content-center"> 
                    </div>
                </div>
                <div class="row texto">
                    <div class="col py-2">
                        <h1 class="mx-auto d-flex justify-content-center">Oops!</h1>
                        <h2 class="mx-auto d-flex justify-content-center text-center"> Lo sentimos, un error inesperado ha ocurrido! </h2>
                    </div>
                </div>
                <div class="row boton">
                    <div class="col py-2 mx-auto d-flex justify-content-center">
                        <a href="../index.jsp" class=" btn btn-primary btn-lg " ><span class="glyphicon glyphicon-home"></span>
                            Inicio 
                        </a>
                    </div>
                </div>
            </div>
        </main>

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

        <script type="text/javascript" src="../js/jquery.min.js"></script>

        <script type="text/javascript">


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



