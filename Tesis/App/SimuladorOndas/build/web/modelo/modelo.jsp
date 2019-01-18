<%-- 
    Document   : modelo
    Created on : 21/07/2018, 13:25:08
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.simulador.metodos.metodos"%>

<%
    try {
        metodos port = new metodos();
        Object param = request.getParameter("opc");
        if (param != null) {
            String opc = param.toString();
            if (opc.equals("guardar")) {
                String JSON = (String) request.getSession().getAttribute("JSONDatos");
                port.guardarOnda(JSON);
                response.sendRedirect("../controlador/controlador.jsp?opc=alambert");
            } else if (opc.equals("getOndasInfinito2D")) {
                String result = port.getlistaOndas2DInfinito();
                session.setAttribute("ondas", result);
                response.sendRedirect("../controlador/controlador.jsp?opc=mostrarInfinito2D");
            } else if (opc.equals("getOndasFinito2D")) {
                String result = port.getlistaOndas2DFinito();
                session.setAttribute("ondas", result);
                response.sendRedirect("../controlador/controlador.jsp?opc=mostrarFinito2D");
            } else if (opc.equals("getOndasInfinito3D")) {
                String result = port.getlistaOndas3DInfinito();
                session.setAttribute("ondas", result);
                response.sendRedirect("../controlador/controlador.jsp?opc=mostrarInfinito3D");
            } else if (opc.equals("getOndasFinito3D")) {
                String result = port.getlistaOndas3DFinito();
                session.setAttribute("ondas", result);
                response.sendRedirect("../controlador/controlador.jsp?opc=mostrarFinito3D");
            } else {
                response.sendRedirect("../vista/error.jsp");
            }
        }
    } catch (Exception e) {
        response.sendRedirect("../vista/error.jsp");
    }

%>