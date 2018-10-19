<%-- 
    Document   : menu
    Created on : 1/06/2018, 01:36:17 AM
    Author     : fidolinux
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="suscriptormqtt" class="suscribe.MqttSubscriberSample" scope="session"/>
<%--<jsp:useBean id="suscriptormqtt1" class="suscribe.MqttSubscriberSample" scope="session"/>--%>
<!DOCTYPE html>
<!-- Scripts y css -->
<link rel = "stylesheet"  href = "https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel = "stylesheet" href = "css/materialize.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src = "js/materialize.min.js"></script>
<script>
//    $(document).ready(function ()) {
//        $(".dropdown-button").dropdown();
//    });

    $(document).ready(function () {
        $(".dropdown-button").dropdown();
    });
</script>

<%
    if (!suscriptormqtt.getSuscriptor().isConectado()) {
        suscriptormqtt.iniciar("UIS/LP210","1883");
    }
//    if (!suscriptormqtt1.getSuscriptor().isConectado()) {
//        suscriptormqtt1.iniciar("UIS/LP211","1883");
//    }
%>
<div class = "col s12 m12 l12">


    <ul id = "fotoDropDown" class = "dropdown-content">
        <li class = "divider"></li>
        <li><a href="monitoreSistemaFotovoltaico.jsp">Maria Alejandra</a></li>
        <li class = "divider"></li>
        <li><a href="inhibidores.jsp">Luis Miguel</a></li>
        <li><a href="bosquesBancosCo2.jsp">Arnold</a></li>
        <li><a href="bosquesNarizElectronica.jsp">Naren</a></li>
    </ul>

    <nav style="margin-bottom: 5%;">
        <div class = "nav-wrapper light-blue darken-3">
            <a href="#" class="brand-logo">  <i class="large material-icons " Style="font-size: 2em;">memory</i></a>
            <ul id = "nav-mobile" class = "right hide-on-med-and-down">   
                <li><a href="index.jsp">Proyecto IoT</a></li>
                <li><a href="rgbvisor.jsp">RGB visor</a></li>
                <li><a href="visorpotenciometro.jsp">Visor Potenciometro</a></li>
                <li><a href="visorhumedad.jsp">Visor Humedad</a></li>
                <li><a href="visorgas.jsp">Visor Gas</a></li>
                <!--<li><a href="visorDemo.jsp">Visor e3T</a></li>-->
                <!--<li><a href="visorLOKA.jsp">Visor LOKA</a></li>-->
                <!--<li><a href="parqueadero.jsp">Visor parqueaderos</a></li>-->
                <!-- Dropdown Trigger -->
                <!--                <li>
                                    <a class = "dropdown-button" href = "#!" data-activates = "fotoDropDown">Presentaciones proyectos<i class = "material-icons right">arrow_drop_down</i></a>
                                </li>-->
            </ul>
            <canvas class="header__background" style="background: rgb(13, 55, 93);"></canvas>
        </div>
    </nav>
</div>
