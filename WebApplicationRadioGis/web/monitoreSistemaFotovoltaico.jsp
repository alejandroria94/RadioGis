<%-- 
    Document   : menu
    Created on : 1/06/2018, 01:36:17 AM
    Author     : fidolinux
--%>

<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
        <title>monitoreSistemaFotovoltaico</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
    <center>
        <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vTnZ7313Jjz2Z4GqCf72AUIi5q7M91IU2aYq8qurB6hP23r-RziD2D_4N0Ndi_DhkqnWxzXAx3NgEjw/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe> 
    </center>

    <a class="waves-effect waves-light btn" target="_blank" href="https://api.enphaseenergy.com/api/v2/systems/752668/energy_lifetime?key=77160fa246179049b64391520f7dc1cd&user_id=4e5459324e7a4d300a"><i class="material-icons left">cloud</i>button</a>
    <a class="waves-effect waves-light btn" target="_blank" href="https://api.enphaseenergy.com/api/v2/systems?key=77160fa246179049b64391520f7dc1cd&user_id=4e5459324e7a4d300a"><i class="material-icons left">cloud</i>button</a>



    <jsp:include page="foot.jsp"/>

</body>
</html>
