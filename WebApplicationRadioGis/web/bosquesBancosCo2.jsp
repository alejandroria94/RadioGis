<%-- 
    Document   : menu
    Created on : 1/06/2018, 01:36:17 AM
    Author     : fidolinux
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
        <title>bosquesBancosCo2</title>
    </head>

    <body>
        <header class="header">
            <link rel="stylesheet" type="text/css" href="css/materialize.css">
            <!--<link rel="stylesheet" type="text/css" href="css/materialize.min.css">-->

        </header>


    <body>
        <jsp:include page="menu.jsp"/>
    <center>
        <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQDgAIn91Nf6TYmyA6otakgxa00iztWhuOxy_v8PZpEyAst_R35A1YcGYH4uz3AtLEEG_cc95x5gYdm/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
    </center>
    <p>Prueba arnold</p>
</body>





<script src="js/particles.min.js"></script>
<script>
    window.onload = function () {

        Particles.init({
            selector: '.header__background',
            color: '#75A5B7',
            maxParticles: 130,
            connectParticles: true,
            responsive: [
                {
                    breakpoint: 768,
                    options: {
                        maxParticles: 80
                    }
                }, {
                    breakpoint: 375,
                    options: {
                        maxParticles: 50
                    }
                }
            ]
        });
    };
</script>
</body>
</html>
