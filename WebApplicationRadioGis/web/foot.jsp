<%-- 
    Document   : menu
    Created on : 1/06/2018, 01:36:17 AM
    Author     : fidolinux
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="page-footer light-blue darken-3">
    <div class="container light-blue darken-3">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Proyecto IoT UIS</h5>
                <p class="grey-text text-lighten-4">Descripción del proyecto</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#!">Link 1</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2018 CentroTIC UIS
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
        </div>
    </div>
</footer>
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
