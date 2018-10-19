<%@page import="com.google.gson.JsonParser"%>
<jsp:useBean id="suscriptormqtt" class="suscribe.MqttSubscriberSample" scope="session"/>
<%--<jsp:useBean id="suscriptormqtt1" class="suscribe.MqttSubscriberSample" scope="session"/>--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";
    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "mensajehumedad",
        "mensajepotenciometro",
        "mensajegas",
        "mensajergb"
    });
    // Si el usuario tiene sesión válida y permisos.
    String proceso = "" + request.getParameter("proceso");
    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("mensajehumedad")) {
            String data = suscriptormqtt.getSuscriptor().getMensajeHumedad();
            if (data.equals("No data")) {
                long epoch = System.currentTimeMillis() / 1000;
                String hora = "" + epoch;
                String mensaje = "{\"hora\":\"" + hora + "\",\"valor\":\"0\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            } else {
                String hora = new JsonParser().parse(data).getAsJsonObject().get("hora").getAsString();
                float valor = Float.parseFloat(new JsonParser().parse(data).getAsJsonObject().get("valor").getAsString());
                String mensaje = "{\"hora\":\"" + hora + "\",\"valor\":\"" + valor + "\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            }
        } else if (proceso.equals("mensajepotenciometro")) {
            String data = suscriptormqtt.getSuscriptor().getMensajePotenciometro();
            if (data.equals("No data")) {
                long epoch = System.currentTimeMillis() / 1000;
                String hora = "" + epoch;
                String mensaje = "{\"hora\":\"" + hora + "\",\"valor\":\"0\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            } else {
                String hora = new JsonParser().parse(data).getAsJsonObject().get("hora").getAsString();
                float valor = Float.parseFloat(new JsonParser().parse(data).getAsJsonObject().get("valor").getAsString());
                String mensaje = "{\"hora\":\"" + hora + "\",\"valor\":\"" + valor + "\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            }
        } else if (proceso.equals("mensajegas")) {
            String data = suscriptormqtt.getSuscriptor().getMensajeGas();
            if (data.equals("No data")) {
                long epoch = System.currentTimeMillis() / 1000;
                String hora = "" + epoch;
                String mensaje = "{\"hora\":\"" + hora + "\",\"valor\":\"0\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            } else {
                String hora = new JsonParser().parse(data).getAsJsonObject().get("hora").getAsString();
                float valor = Float.parseFloat(new JsonParser().parse(data).getAsJsonObject().get("valor").getAsString());
                String mensaje = "{\"hora\":\"" + hora + "\",\"valor\":\"" + valor + "\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            }
        } else if (proceso.equals("mensajergb")) {
            String data = suscriptormqtt.getSuscriptor().getMensajeRgb();
            if (data.equals("No data")) {
                String mensaje = "{\"red\":\"255\",\"green\":\"255\",\"blue\":\"255\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            } else {
                int red = Integer.parseInt(new JsonParser().parse(data).getAsJsonObject().get("red").getAsString());
                int green = Integer.parseInt(new JsonParser().parse(data).getAsJsonObject().get("green").getAsString());
                int blue = Integer.parseInt(new JsonParser().parse(data).getAsJsonObject().get("blue").getAsString());
//                String mensaje = "{\"red\":\"" + (int) (Math.random() * 256) + "\",\"green\":\"" + (int) (Math.random() * 256) + "\",\"blue\":\"" + (int) (Math.random() * 256) + "\"}";
                String mensaje = "{\"red\":\"" + red + "\",\"green\":\"" + green + "\",\"blue\":\"" + blue + "\"}";
                respuesta += "\"" + proceso + "\":" + mensaje + "";
            }
        }
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>