<%-- 
    Document   : ondasInfinito2D
    Created on : 07/08/2018, 18:29:55
    Author     : luis
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="simulador.comunes.ondas"%>
<%@page import="simulador.comunes.onda"%>
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


        <link href="../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>

        <script src="../js/math.min.js"></script>

        <!-- fontawesome's CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">

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

        <!-- modal -->
        <div id="modalReporte"  class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle"> ONDA 2D</h5>
                        <button type="button" onclick="cancel()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <canvas  id="reporteCanvas" height="450px" width="850px" ></canvas>
                </div>               
            </div>
        </div>

        <form method="POST"  class="action__form" >

            <input type="hidden" name="coeficiente" id="coeficiente">
            <input type="hidden" name="posicionInput" id="posicionInput">
            <input type="hidden" name="velocidadInput" id="velocidadInput">
        </form>

        <main>
            <div class="container-full">
                <div class="row contenido">
                    <div class="col-12 menu " >
                        <h5 class=" my-2 mx-4 text-white text-uppercase"> Histórico ondas 2D </h5>        
                    </div>

                    <div class="col espacio"></div>
                    <div class="col-12">
                        <div class="row lienzo my-xs-4">
                            <div class="col-xl-3  panel text-justify text-white " >
                                <div class="form-group pt-5 text-center text-white">
                                    <label for=""> <h5>OPCIONES</h5> </label>
                                </div>

                                <div class="mx-2 form-group text-justify " id="opciones">
                                    <a class="item "  href="../controlador/controlador.jsp?opc=ondasInfinito2D"> <i class="fas fa-file"></i> &nbsp;D'Alambert caso infinito  </a> <br>
                                    <div class="col espacio"></div>

                                    <a class="item"  href="../controlador/controlador.jsp?opc=ondasFinito2D"> <i class="fas fa-file"></i> &nbsp;Fourier caso finito </a> 
                                </div>

                                <div class="mx-2 form-group text-justify text-white">
                                    <label >  </label>
                                </div>

                            </div>
                            <div id="contenidoReporte" class="areaReporte col-12  col-sm-12 col-md-9" >
                                <br>
                                <h2 >Datos ondas D'Alambert</h2>
                                <br>
                                <table id="table" class="text-center">
                                    <thead>
                                        <tr>
                                            <th>Coeficiente</th>
                                            <th>Posición Incial</th>
                                            <th>Velocidad Inicial</th>
                                            <th>Generar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            try {
                                                Object objOndas = request.getSession().getAttribute("ondas");
                                                if (objOndas != null) {
                                                    session.setAttribute("ondas", null);
                                                    String ondas = (String) objOndas;
                                                    Gson gson = new Gson();
                                                    ondas onda = gson.fromJson(ondas, ondas.class);
                                                    ArrayList<onda> arrayOndas = (ArrayList) onda.getObjListaOndas();
                                                    if (arrayOndas.size() > 0) {
                                                        for (onda datosOnda : arrayOndas) {
                                                            out.println("<tr class='data__info' data-coeficiente='" + datosOnda.getCoeficiente_elasticidad() + " ' data-posicion='" + datosOnda.getPosicion_inicial() + "' data-velocidad='" + datosOnda.getVelocidad_inicial() + "'>");
                                                            out.println("<td> " + datosOnda.getCoeficiente_elasticidad() + "  </div>");
                                                            out.println("<td>" + datosOnda.getPosicion_inicial() + "</div>");
                                                            out.println("<td>" + datosOnda.getVelocidad_inicial() + "</div>");
                                                            out.println("<td class='update'><a data-toggle='modal' data-target='.bd-example-modal-lg' href=''><i class='fas fa-eye '></i></a>");
                                                            out.println("</tr>");
                                                        }
                                                    } 
                                                } else {
                                                    response.sendRedirect("../controlador/controlador.jsp?opc=getOndasInfinito2D");
                                                }
                                            } catch (Exception e) {
                                                System.out.println(e);
                                                response.sendRedirect("../vista/error.jsp");
                                            }
                                        %>
                                    </tbody>
                                </table>
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
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="../js/jquery.dataTables.min.js"></script>
        <script src="../js/popper.min.js" ></script>
        <script src="../js/bootstrap.min.js" ></script>
        <script src="../js/simulador.js" ></script>
        <script src="../js/clases.js" ></script>
        <script src="../js/reporte.js" ></script>
        <script src="../js/sweetalert.min.js"></script>

        <script type="text/javascript">

                            $('#modalReporte').modal({
                                backdrop: false,
                                show: false
                            });

                            $('#table').DataTable({
                                language: {
                                    "search": "Buscar:",
                                    "zeroRecords": "No hay resultados...",
                                    "infoEmpty": "No hay datos que mostrar",
                                    "lengthMenu": '',
                                    "paginate": {
                                        "previous": "Anterior",
                                        "next": "Siguiente"
                                    }
                                },
                                "ordering": false,
                                "info": false,
                                "lengthMenu": [5, 10, 25, 50, 100]
                                        //"paging": false

                            });

                            $('.update').on('click', function (event) {
                                event.preventDefault();
                                var datos = $(this).closest('.data__info').data();
                                cargarFormulario(datos);
                            });

                            function cargarFormulario(datos) {
                                $('.action__form')[0].reset();
                                $(".action__form input[name=coeficiente]").val(datos['coeficiente']);
                                $(".action__form input[name=posicionInput]").val(datos['posicion']);
                                $(".action__form input[name=velocidadInput]").val(datos['velocidad']);
                                historicoDalambert2D();
                            }

                            $(function () {
                                $('[data-toggle="tooltip"]').tooltip();
                            });
                            $(window).on('load', function () {
                                $("#preloader").delay(600).fadeOut();
                            });

        </script>

    </body>
</html>

