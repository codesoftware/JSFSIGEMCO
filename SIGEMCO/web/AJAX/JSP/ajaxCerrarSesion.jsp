<%
    String rta = "Ok";
    try {
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        request.getSession().removeAttribute("usuario");
        request.getSession().removeAttribute("parametros");

        session.invalidate();
    } catch (Exception e) {
        e.printStackTrace();
        rta = "Error " + e;
    }
    out.print("{\"respuesta\": \""+rta+"\"}");
%>
