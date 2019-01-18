<%-- 
    Document   : controlador
    Created on : 21/07/2018, 13:24:58
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Object param = request.getParameter("opc");
                if (param != null) {
                    String opc = param.toString();
                    if (opc.equals("alambert")) {
                        response.sendRedirect("../vista/alambert.jsp");
                    } else if (opc.equals("fourier")) {
                        response.sendRedirect("../vista/fourier.jsp");
                    } else if (opc.equals("ondasInfinito2D")) {
                        response.sendRedirect("../vista/ondasInfinito2D.jsp");
                    } else if (opc.equals("ondasInfinito3D")) {
                        response.sendRedirect("../vista/ondasInfinito3D.jsp");
                    } else if (opc.equals("ondasFinito2D")) {
                        response.sendRedirect("../vista/ondasFinito2D.jsp");
                    } else if (opc.equals("ondasFinito3D")) {
                        response.sendRedirect("../vista/ondasFinito3D.jsp");
                    } else if (opc.equals("index")) {
                        response.sendRedirect("../index.jsp");
                    } else if (opc.equals("getOndasInfinito2D")) {
                        response.sendRedirect("../modelo/modelo.jsp?opc=getOndasInfinito2D");
                    } else if (opc.equals("getOndasFinito2D")) {
                        response.sendRedirect("../modelo/modelo.jsp?opc=getOndasFinito2D");
                    } else if (opc.equals("mostrarInfinito2D")) {
                        response.sendRedirect("../vista/ondasInfinito2D.jsp");
                    } else if (opc.equals("mostrarFinito2D")) {
                        response.sendRedirect("../vista/ondasFinito2D.jsp");
                    } else if (opc.equals("getOndasInfinito3D")) {
                        response.sendRedirect("../modelo/modelo.jsp?opc=getOndasInfinito3D");
                    } else if (opc.equals("getOndasFinito3D")) {
                        response.sendRedirect("../modelo/modelo.jsp?opc=getOndasFinito3D");
                    } else if (opc.equals("mostrarInfinito3D")) {
                        response.sendRedirect("../vista/ondasInfinito3D.jsp");
                    } else if (opc.equals("mostrarFinito3D")) {
                        response.sendRedirect("../vista/ondasFinito3D.jsp");
                    } else if (opc.equals("guardarOnda")) {

                        String coeficiente = request.getParameter("coeficienteInput");
                        String posicion = request.getParameter("posicionInput");
                        String velocidad = request.getParameter("velocidadInput");
                        String caso = request.getParameter("casoInput");
                        String dimension = request.getParameter("dimensionInput");
                        String JSONOnda = "{'coeficiente_elasticidad':'" + coeficiente + "','posicion_inicial':'" + posicion + "','velocidad_inicial':'" + velocidad + "','caso_onda':'" + caso + "','dimension_onda':'" + dimension + "'}";
                        session.setAttribute("JSONDatos", JSONOnda);
                        response.sendRedirect("../modelo/modelo.jsp?opc=guardar");
                    } else {
                        response.sendRedirect("../vista/error.jsp");
                    }
                }
            } catch (Exception e) {
                response.sendRedirect("../vista/error.jsp");
            }
        %> 
    </body>
</html>