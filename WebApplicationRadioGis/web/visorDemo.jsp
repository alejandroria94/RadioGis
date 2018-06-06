<%-- 
    Document   : visorDemo
    Created on : 6/06/2018, 02:52:20 PM
    Author     : Fido
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>The Materialize NavBar Example</title>
        <meta name = "viewport" content = "width = device-width, initial-scale = 1">      
        <link rel = "stylesheet"
              href = "https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel = "stylesheet"
              href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
        <script type = "text/javascript"
        src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">
        </script>	 

        <script>
            $(document).ready(function ()) {
                $(".dropdown-button").dropdown();
            });
        </script>
    </head>

    <body class = "container"> 
        <div class = "row" style = "width:560px;">
            <div class = "col s12 m12 l12" >
                <h5>Right Aligned Nav Bar</h5>
                <nav>
                    <div class = "nav-wrapper">
                        <a href = "#" class = "brand-logo">TutorialsPoint</a>
                        <ul id = "nav-mobile" class = "right hide-on-med-and-down">
                            <li><a href = "#">HTML5</a></li>
                            <li><a href = "#">CSS</a></li>
                            <li><a href = "#">JavaScript</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class = "row" style = "width:560px;">
            <div class = "col s12 m12 l12">
                <h5>Left Aligned Nav Bar</h5>
                <nav>
                    <div class = "nav-wrapper">
                        <a href = "#" class = "brand-logo right">TutorialsPoint</a>
                        <ul id = "nav-mobile" class = "left hide-on-med-and-down">
                            <li><a href = "#">HTML5</a></li>
                            <li><a href = "#">CSS</a></li>
                            <li><a href = "#">JavaScript</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class = "row" style = "width:560px;">
            <div class = "col s12 m12 l12">
                <h5>Center Aligned Nav Bar</h5>
                <nav>
                    <div class = "nav-wrapper">
                        <a href = "#" class = "brand-logo center">TutorialsPoint</a>
                        <ul id = "nav-mobile" class = "right hide-on-med-and-down">                    
                            <li><a href = "#">Java</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class = "row" style = "width:560px;">
            <div class = "col s12 m12 l12">
                <h5>Nav Bar with Active link</h5>
                <nav>
                    <div class = "nav-wrapper">
                        <a href = "#" class = "brand-logo right">TutorialsPoint</a>
                        <ul id = "nav-mobile" class = "left hide-on-med-and-down">
                            <li><a href = "#">HTML5</a></li>
                            <li><a href = "#">CSS</a></li>
                            <li class = "active"><a href = "#">JavaScript</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class = "row" style = "width:560px;">
            <div class = "col s12 m12 l12">
                <h5>Nav Bar with dropdown menu</h5>
                <ul id = "javaDropDown" class = "dropdown-content">
                    <li><a href = "#!">JSF</a></li>
                    <li><a href = "#!">JSP</a></li>
                    <li class = "divider"></li>
                    <li><a href = "#!">Servlets</a></li>
                </ul>

                <nav>
                    <div class = "nav-wrapper">
                        <a href = "#" class = "brand-logo center">TutorialsPoint</a>
                        <ul id = "nav-mobile" class = "right hide-on-med-and-down">                    
                            <!-- Dropdown Trigger -->
                            <li><a class = "dropdown-button" href = "#!" 
                                   data-activates = "javaDropDown">Java<i class = "material-icons
                                                                       right">arrow_drop_down</i></a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <div class = "row" style = "width:560px;">
            <div class = "col s12 m12 l12">
                <h5>Nav Bar with Links and Icons</h5>
                <nav>
                    <div class = "nav-wrapper">
                        <a href = "#" class = "brand-logo right">TutorialsPoint</a>
                        <ul id = "nav-mobile" class = "left hide-on-med-and-down">
                            <li><a href = "#"><i class = "material-icons left">search</i>
                                    HTML5</a></li>
                            <li><a href = "#"><i class = "material-icons right">view_module</i>
                                    CSS</a></li>
                            <li><a href = "#">JavaScript</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>  	 	  
    </body>  
</html>