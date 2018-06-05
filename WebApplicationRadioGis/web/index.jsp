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
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="css/materialize.css">
    </head>

    <body>
        <jsp:include page="menu.jsp"/>

        <div class="container">
            <div class="row">

                <!--Parte izquierda-->
                <div class="col s6">
                    <center>
                         <div class="col s12 m7" style=" width: 100%;">
                        <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vTXjiTJY2S054LpHxmdTdJZRKyOveFLHH7fjh7iyL-aRp_7VgUN454U90dorQUl6gBfJbo-RDUBZOed/embed?start=false&loop=false&delayms=3000" frameborder="0" width="100%" height="369" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
                         </div>
                    </center>
                </div>

                <!--Parte derecha-->
                <div class="col s5">
                    <div class="row">
                        <div class="col s12 m7" style=" width: 100%;">
                            <div class="card">
                                <div class="card-image">
                                    <img src="images/inicio/sample-1.jpg">
                                    <span class="card-title">Proyecto IoT</span>
                                </div>
                                <div class="card-content">
                                    <p>Descripción del proyecto</p>
                                </div>
                                <div class="card-action">
                                    <a href="#">Ver más</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <jsp:include page="foot.jsp"/>
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
